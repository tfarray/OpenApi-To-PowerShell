
# This data is required for the module to work
# It stores information, such as the credential that is going to be used
$!Project!_Conf = @{
    EndPoint      = "!MainEndPoint!"
    credential    = $null
    CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters)
	!ConvertAutomaticVariables!
}

# This command is requried to, at least, set the credential
function Initialize-!Project! {
    [CmdletBinding()]
	param (
		[parameter(Position = 0)][pscredential]$Credential,
		[ValidateSet('!EndPoints!')][string]$EndPoint
    )
    process {
		switch ($PSBoundParameters.Keys) {
			Default { $!Project!_Conf[$_] = $PSBoundParameters[$_] }
		}
	}
}
Export-ModuleMember Initialize-!Project!

function Invoke-!Project! {
    [CmdletBinding()]
	param (
        [parameter(Mandatory,Position = 0)][string]$Function,
        [string[]]$Query=@(),
		$Method, # this variable can be used to manually force a method
		$Json,   # this variable can be used to manually  simulate a json payload
		[hashtable]$PsBP=@{}
    )

	# Some inputs are not to be parsed by the command
	$Conf = $!Project!_Conf # Small Shortcut that makes the code easier to write
	$ToIgnore = $Conf.CommonParameters

	# Verifying credentials, we consider the are mandatory
	if (!$Conf.Credential) {
		Write-host 'No Credential found for !Project! API, please run :'
		Write-host ' Initialize-!Project! $Credential'
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
	# Uncomment this if the API is using a generated token
	############
	# if ($Conf.token -and $Conf.token.expires -lt (get-date)) {
	# 	write-verbose "Token is still valid"
	# } else {
	# 	write-verbose "Getting a new token"
	# 	$WebR = @{
	#		# You will need to specify here your token endpoint
	# 		URI = TO BE SPECIFIED BY YOU
	# 		Credential = $Conf.credential
	#       # Headers may change depending on the token endpoint specifications
	# 		header = @{
	# 			'Content-Type' = "application/x-www-form-urlencoded"
	# 			'Accept' = "application/json"
	# 		}
	#       # SAME HERE, the body may change depending on the token endpoint specifications
	# 		Body = @{ "grant_type" = "client_credentials" } | convertto-json
	# 	}
	# 		$Token = Invoke-RestMethod @WebR
	# 	if ($Token) {
	# 		$Conf.token = $Token
	# 		$Conf.token["expires"] = (get-date).AddSeconds($Token.expires_in)
	#    	$Headers = @{
	# 			'Authorization' = "$($Conf.token.token_type) $($Conf.token.access_token)"
	# 			'accept' = 'application/json'
	# 		}
	# 	} else  { return }
	# }

	############
	# Comment this if you are not using Basic Authentication
	############
	$Encoding = "UTF8" # You may need to change this depending on the API
	$Encoded  =  [Convert]::ToBase64String([System.Text.Encoding]::"$Encoding".GetBytes(($Conf.credential.username + ":" + $Conf.credential.GetNetworkCredential().password)))
	$headers =  @{
		'Authorization' =  "Basic $Encoded"
		'accept' = 'application/json' # this may change depending on your API
	}


    # Starting to build the Rest Method commands inputs
    $RestM = @{
        Method		  = "Get"
        Uri			  = ("!Protocol!://$($Conf.EndPoint)" + $FFunc )
		Headers		  = $headers
    }

	####################
	# Determining who called me > calculates the Method to use
	####################
	$CalledBy = (Get-PSCallStack)[1].command
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
	foreach ($Key in @($PsBP.keys | ? { $_ -notin $ToIgnore })) {
		if ($RestM["method"] -match "GET|DELETE") {
			$Query += ("$key=" + $PsBP[$key])
		} else {
			$Body[$key] = $PsBP[$key]
		}
	}

	foreach ($Key in @($PsBP.keys | ? { $_ -notin $ToIgnore })) {
		$RealKey = $Key
		if ($ConvertAutomaticVariables!Project!.count) {
			if ($ConvertAutomaticVariable!Project!.containskey("$CalledBy;$Function")) {
				if ($ConvertAutomaticVariable!Project!["$CalledBy;$Function"].containskey($Key)) {
					$RealKey = $ConvertAutomaticVariable!Project!["$CalledBy;$Function"][$Key]
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
	$TypeName = "!Project!_" + ( $Function -replace "/({.*?\}/?)?","_"   )
	if ($Result) {
		$Result | % { $_.psobject.typenames.insert(0,$TypeName) }
	}
	return $Result
}
Export-ModuleMember Invoke-!Project!