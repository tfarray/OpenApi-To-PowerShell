
# This data is required for the module to work
# It stores information, such as the credential that is going to be used
$VrOps_Conf = @{
    EndPoint      = "mycompany.com"
    credential    = $null
    CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters)
}

# This command is requried to, at least, set the credential
function Initialize-VrOps {
    [CmdletBinding()]
	param (
		[parameter(Position = 0)][pscredential]$Credential,
		[ValidateSet('mycompany.com')][string]$EndPoint
    )
    process {
		switch ($PSBoundParameters.Keys) {
			Default { $VrOps_Conf[$_] = $PSBoundParameters[$_] }
		}
	}
}
Export-ModuleMember Initialize-VrOps

function Invoke-VrOps {
    [CmdletBinding()]
	param (
        [parameter(Mandatory,Position = 0)][string]$Function,
        [string[]]$Query=@(),
		$Method, # this variable can be used to manually force a method
		$Json,   # this variable can be used to manually  simulate a json payload
		[hashtable]$PsBP=@{}
    )

	# Verifying credentials, we consider the are mandatory
	if (!$VrOps_Conf.Credential) {
		Write-host 'No Credential found for VrOps API, please run :'
		Write-host ' Initialize-VrOps $Credential'
		write-host 'To inform the tool which credential are going to get used. $Credential is a PsCredential Object'
		return
	}

	# we want to make sure that {keys} in the URL are not considered as query inputs
	$FFunc = ($Function -split "/" | % {
		if ($_ -match "^{.*}$") {
			$key = $_ -replace "{|}"
			$VrOps_Conf.CommonParameters += $key
			if ($PsBP.containskey($key)) { $PsBP[$key] }
		} else { $_ }
	}) -join "/"

	############
	# Uncomment this if the API is using a generated token
	############
	if ($VrOps_Conf.token -and $VrOps_Conf.Token_Expires -lt (get-date)) {
		write-verbose "Token is still valid"
	} else {
		write-verbose "Getting a new token"
		$WebR = @{
			URI =  "https://$($VrOps_Conf.EndPoint)/suite-api/api/auth/token/acquire"
			ContentType = "application/json"
			Body = @{
				"authSource" = $VrOps_Conf.authSource
				"username"   = $VrOps_Conf.credential.username
				"password"   = $VrOps_Conf.credential.GetNetworkCredential().password
			} | convertto-json
			Method = "POST"
		}

		$Token = Invoke-RestMethod @WebR
		if ($Token -and $Token.'auth-token') {
			$VrOps_Conf.token = $Token.'auth-token'.token
			$VrOps_Conf.Token_Expires = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId(( $token.'auth-token'.validity | ConvertFrom-epoch), "Greenwich Standard Time").AddMinutes(-1)
			Write-Verbose "######## Token aquired"
		} else  {
			Write-host "Unable to get a token"
			return
		}
	}


    # Starting to build the Rest Method commands inputs
    $RestM = @{
        Method		  = "Get"
        Uri			  = ("https://$($VrOps_Conf.EndPoint)/suite-api" + $FFunc )
		Headers      = @{
			"Authorization" = "vRealizeOpsToken $($VrOps_Conf.token)"
			"Accept" = "application/json"
    		"Content-type"= "application/json"
		}
    }


	####################
	# Determining who called me > calculates the Method to use
	####################
	$CalledBy = (Get-PSCallStack)[1].command
	Write-verbose "Called By : $CalledBy;$Function"
	switch -regex ($CalledBy) {
		"^Remove-"        		 	{ $RestM["method"] = "DELETE" 	}
		"^(add|new|Export|start)-"  { $RestM["method"] = "POST"	}
		"^(Disable)-"     			{ $RestM["method"] = "PUT"	}
	}

	####################
	# Managing incoming Data
	####################
	$Query = @()
	$Body  = @{}
	foreach ($Key in @($PsBP.keys | ? { $_ -notin $VrOps_Conf.CommonParameters })) {
		$RealKey = $Key
		if ($ConvertAutomaticVariablesVrOps.count) {
			if ($ConvertAutomaticVariablesVrOps.containskey("$CalledBy;$Function")) {
				if ($ConvertAutomaticVariablesVrOps["$CalledBy;$Function"].containskey($Key)) {
					$RealKey = $ConvertAutomaticVariablesVrOps["$CalledBy;$Function"][$Key]
				}
			}
		}
		if ($RestM["method"] -match "GET|DELETE") {
			$Query += ("$RealKey=" + $PsBP[$key])
		} else {
			$Body[$RealKey] = $PsBP[$key]
		}
	}

	if ($VrOps_Conf."_no_links" -and $RestM["method"] -like "Get" ) { $Query += "_no_links=true" }


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
	$MaxTries = 0 ; $try = 0
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

	# Hiding out unecessary data when there is only one page
	if ($Result.pageInfo) {
		$Data = $Result.psobject.Members | ? { $_.MemberType -like "NoteProperty" -and  $_.name -match "List$" }
		if ($Data.Value.Count -lt $Result.pageInfo.pageSize) {
			$Result = $Data.Value
		}
	}

	# Adding a type to our commands
	$TypeName = "VrOps_" + ( $Function -replace "/({.*?\}/?)?","_"   )
	if ($Result) {
		$Result | % { $_.psobject.typenames.insert(0,$TypeName) }
	}

	return $Result
}
Export-ModuleMember Invoke-VrOps
