
# This data is required for the module to work
# It stores information, such as the credential that is going to be used
$JiraCloud_Conf = @{
    EndPoint      = "your-domain.atlassian.net"
    credential    = $null
    CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters)
	DefaultProject  = $null
	StoredData      = @{ Columns = @{ } }
}

# This command is requried to, at least, set the credential
function Initialize-JiraCloud {
    [CmdletBinding()]
	param (
		[parameter(Position = 0)][pscredential]$Credential,
		[string]$EndPoint,
		[pscredential]$DefaultProject
    )
    process {
		switch ($PSBoundParameters.Keys) {
			Default { $JiraCloud_Conf[$_] = $PSBoundParameters[$_] }
		}
	}
}
Export-ModuleMember Initialize-JiraCloud

function Invoke-JiraCloud {
    [CmdletBinding()]
	param (
        [parameter(Mandatory,Position = 0)][string]$Function,
        [string[]]$Query=@(),
		$Method, # this variable can be used to manually force a method
		$Json,   # this variable can be used to manually  simulate a json payload
		[hashtable]$PsBP=@{},
		[switch]$force
    )

	# Some inputs are not to be parsed by the command
	$Conf = $JiraCloud_Conf # Small Shortcut that makes the code easier to write
	$ToIgnore = $Conf.CommonParameters + "force"

	# Verifying credentials, we consider the are mandatory
	if (!$Conf.Credential) {
		Write-host 'No Credential found for JiraCloud API, please run :'
		Write-host ' Initialize-JiraCloud $Credential'
		write-host 'To inform the tool which credential are going to get used. $Credential is a PsCredential Object'
		return
	}

	# we want to make sure that {keys} in the URL are not considered as query inputs
	$FFunc = ($Function -split "/" | % {
		if ($_ -match "^{.*}$") {
			$key = $_ -replace "{|}"
			$ToIgnore += $key
			if ($PsBP.containskey($key)) { $PsBP[$key] }
		} else { $_ }
	}) -join "/"

	############
	# Comment this if you are not using Basic Authentication
	############
	$Encoding = "ASCII" # You may need to change this depending on the API
	$Encoded  =  [Convert]::ToBase64String([System.Text.Encoding]::"$Encoding".GetBytes(($Conf.credential.username + ":" + $Conf.credential.GetNetworkCredential().password)))
	$headers =  @{
		'Authorization' =  "Basic $Encoded"
		"Content-Type" = "application/json"
		"verify" = "false"
	}


    # Starting to build the Rest Method commands inputs
    $RestM = @{
        Method		  = "Get"
        Uri			  = ("https://$($Conf.EndPoint)" + $FFunc )
		Headers		  = $headers
    }

	####################
	# Determining who called me > calculates the Method to use
	####################
	$CalledBy = (Get-PSCallStack)[1].command
	switch -regex ($CalledBy) {
		"^Remove-"  			 { $RestM["method"] = "DELETE" 	}
		"^(add|new|Export)-"     { $RestM["method"] = "POST"	}
		"^(set)-"    			 { $RestM["method"] = "PUT"	    }
		"^(patch)-"    			 { $RestM["method"] = "UPDATE"	}
	}

	####################
	# Managing incoming Data
	####################
	$Query = @()
	$Body  = @{}

	foreach ($Key in @($PsBP.keys | ? { $_ -notin $ToIgnore })) {
		$RealKey = $Key
		if ($ConvertAutomaticVariablesJiraCloud.count) {
			if ($ConvertAutomaticVariableJiraCloud.containskey("$CalledBy;$Function")) {
				if ($ConvertAutomaticVariableJiraCloud["$CalledBy;$Function"].containskey($Key)) {
					$RealKey = $ConvertAutomaticVariableJiraCloud["$CalledBy;$Function"][$Key]
				}
			}
		}
		if ($RestM["method"] -match "GET|DELETE") {
			$Query += ("$RealKey=" + $PsBP[$key])
		} else {
			$Body[$RealKey] = $PsBP[$key]
		}
	}

	# Manual inputs - used to test
	switch ($PSBoundParameters.keys) {
		Method	{ $RestM["method"] = $Method }
		Json	{ $RestM["Body"]   = $JSON }
	}

	if ($Body.count) {
		# Note : the Depth parameter will not work on powershell 5
		$RestM["Body"] = ($Body | ConvertTo-Json -Depth 100 -Compress)
	}

	if ($Query) { $RestM.Uri += "?" + ($Query -join "&") }

	write-verbose ($RestM | out-string )
	if ($RestM["Body"]) { Write-verbose $RestM["Body"] }

	# Running the Local Command
	# The loop is used in case of certain API which are not stable
	# it is not required
	$MaxTries = 1 ; $try = 0
	do {
		$Failure = $false
		try {
			$Result = Invoke-RestMethod @RestM
		} Catch {
			Write-host -ForegroundColor DarkRed "Execution Error : $($_.Exception.Message)"
			$Failure = $true
		}
		$try ++
	} while ( $try -le $MaxTries -and $Failure )

	# Adding a type to our commands
	switch ($CalledBy) {
		"Get-JiraCloudField" { }
		"Find-JiraCloudSearch" { Format-JiraCloud $Result.issues }
		Default { Format-JiraCloud $Result }
	}

	return $Result
}
Export-ModuleMember Invoke-JiraCloud

Function Format-JiraCloud {
	[cmdletbinding()]
	param(
		[Parameter(Position=0,mandatory)][PsObject[]]$Result
	)
	Process {
		# $Conf = $Global:CiscoPowerTools.JiraCloud
		# Some fields will need a conversion, we are getting the translation table first
		if (!($Conf["StoredData"].containskey("JiraCloudField"))) {
			$Fields = Get-JiraCloudField
			$Fields | % {
				$_ | add-member -MemberType NoteProperty -Name "SwitchName" -Value ($_.name -replace "\s")
			}
			$Conf["StoredData"]["JiraCloudField"] = $Fields | group -Property key -AsHashTable
			$Conf["StoredData"]["SwitchName"]     = $Fields | group -Property SwitchName -AsHashTable
		}

		foreach ($issue in $Result) {
			$Type =  $issue.fields.issuetype.name
			$Fields = $null ; $ToShow = @()
			switch -Regex ($Type) {
				'^(Defect|Action|Story|Sub-task)$' {
					[string[]]$Columns = @("key")
					$Fields = "parent.key","summary","issuetype.name","status.name","resolution.name","creator.displayname","assignee.displayname","subtasks","comment.comments","Sprint","StoryPoints","labels","AgileTeam.value"
				}
			}

			# If we have set a list of fields we want to show
			if ($Fields) {
				# We don't want to calculate translation each time, so we store the matching
				if (!$Conf["StoredData"]["Columns"].containskey($Type)) {
					$Conf["StoredData"]["Columns"][$Type] = [ordered]@{}
					foreach ($F in $Fields) {
						$I,$T = $F -split "\.",2
						$S    = $I
						if ($I -notin $issue.fields.psobject.Properties.name) {
							$I = ($Conf["StoredData"]["SwitchName"][$I]).id
						}
						$Conf["StoredData"]["Columns"][$Type][$S] = (($I,$T) | ? { $_ } ) -join '.'
					}
				}

				# Now we know how to convert the fields, we just need to apply the forumla
				$Conf["StoredData"]["Columns"][$Type].GetEnumerator() | % {
					$V = $issue.fields
					$_.Value -split "\." | % { $V = $V."$_" }
					$issue | Add-Member -MemberType NoteProperty -Name $_.name -Value $V
				}

				$Columns += ($Conf["StoredData"]["Columns"][$Type].psbase.keys | % { "$_" } )
				# Now we are adding a Type and selecting the chosen columns to show
				$issue.PSObject.TypeNames.Insert(0,("JiraCloud3_" + $Type))
				$defaultDisplayPropertySet = New-Object System.Management.Automation.PSPropertySet("DefaultDisplayPropertySet",$Columns)
				$PSStandardMembers = [System.Management.Automation.PSMemberInfo[]]@($defaultDisplayPropertySet)
				$issue | Add-Member MemberSet PSStandardMembers $PSStandardMembers

			}
		}
	}
}