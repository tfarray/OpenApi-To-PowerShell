# All modified sections will be Marked
# Note : This file was generated with those commands :
# .\ConvertProject.ps1 -ProjectName Amp1 -MultipleFiles -AdditionalParameters  @{
# 	limit = @{
# 		GetAll = @{ Type = "Switch"  ; Parameter = @() } # MODIFIED : Added this
# 		offset = @{ Type = "BigInt"  ; Parameter = @() }
# 	}
# 	} -FunctionRenamePattern @{ "Amp1V1" = "Amp1" }

$Amp1_Conf = @{
    EndPoint      = "api.amp.cisco.com"
    credential    = $null
    CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters)
}

# This command is requried to, at least, set the credential
function Initialize-Amp1 {
    [CmdletBinding()]
	param (
        [parameter(Position = 0)][pscredential]$Credential,
		[ValidateSet('api.amp.cisco.com','api.apjc.amp.cisco.com','api.consumer.amp.cisco.com','api.eu.amp.cisco.com')][string]$EndPoint
    )
    process {
		switch ($PSBoundParameters.Keys) {
			Default { $Amp1_Conf[$_] = $PSBoundParameters[$_] }
		}
	}
}
Export-ModuleMember Initialize-Amp1

function Invoke-Amp1 {
    [CmdletBinding()]
	param (
        [parameter(Mandatory,Position = 0)][string]$Function,
        [string[]]$Query=@(),
		$Method, # this variable can be used to manually force a method
		$Json,   # this variable can be used to manually  simulate a json payload
		[hashtable]$PsBP=@{}
    )

	# MODIFIED : The GetAll Switch is added to get all the results when required
	$ToIgnore = @($Amp1_Conf.CommonParameters) + 'GetAll'
	$Conf = $Amp1_Conf # Small Shortcut that makes the code easier to write

	# Verifying credentials, we consider the are mandatory
	if (!$Conf.Credential) {
		Write-host 'No Credential found for Amp1 API, please run :'
		Write-host ' Initialize-Amp1 $Credential'
		write-host 'To inform the tool which credential are going to get used. $Credential is a PsCredential Object'
		return
	}

	# we want to make sure that {keys} in the URL are not considered as query inputs
	$Function = ($Function -split "/" | % {
		if ($_ -match "^{.*}$") {
			$key = $_ -replace "{|}"
			$ToIgnore += $key
			if ($PsBP.containskey($key)) { $PsBP[$key] }
		} else { $_ }
	}) -join "/"

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
        Uri			  = ("https://$($Conf.EndPoint)" + $Function )
		Headers		  = $headers
    }

	# MODIFIED : Adding the ResponseHeadersVariable for powershell 6 and above
	# Reason : if too many queries are made, this will prevent rejection
	if ($PSVersionTable.PSVersion.Major -ge 6) {
		Write-verbose " > Adding ResponseHeadersVariable"
		$RestM.add("ResponseHeadersVariable","RHV")
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

	# Manual inputs - used to test
	switch ($PSBoundParameters.keys) {
		Method	{ $RestM["method"] = $Method }
		Json	{ $RestM["Body"]   = $JSON }
	}

	if ($Body.count) {
		# Note : the Depth parameter will not work on powershell 5
		$RestM["Body"] = ($Body | ConvertTo-Json -Depth 100 -Compress)
	}



	# MODIFY : Prompting for confirmation when there is a change
	if ($RestM.Method -notlike "get") {
		if (!$PsBoundParameters.containskey("force") -and !$force)  {
			$Ans = $null
			$Text = "You are about to run a`n Method = [$Method]`n URI    = [$($RestM.uri)]"
			if ($RestM.containskey("body")) {
				$Text += "`n--- payload ------------------ `n$($RestM.body)`n-------------------------------"
			}
			write-host $text
			While ($Ans -notmatch "^(y|n)$") {
				Write-host  "Confirm ? (y/n)" -ForegroundColor Cyan -NoNewline
				$Ans = Read-host
			}
			if ($Ans -like "n") { return }
		}
	}

	if ($Query) { $RestM.Uri += "?" + ($Query -join "&") }

	write-verbose ($RestM | out-string )
	if ($RestM["Body"]) { Write-verbose $RestM["Body"] }

	# MODIFIED :
	# Prention of too many request in a short period of time
	# GetAll will get all the data without having to make multiple calls with offset ...
	$try = 0 ; $retry = $false ; $MaxPages = 1 ; $ActualPage = 0 ; $Message = $Null
	$Activity = "Invoking AMP [$($RestM.URI)]"
	$Results = @()

	do {
		$Message = $Null
		$Status =  "Page $ActualPage/$MaxPages"

		if ($Conf["X-RateLimit-Remaining"] -in 0..2 ) {
			Write-verbose "X-RateLimit-Remaining = $($Conf['X-RateLimit-Remaining'])"
			start-sleep -s [Math]::Ceiling(($Conf["X-RateLimit-Reset"] - (get-date)).totalseconds)
		}

		try {
			$Result = invoke-restmethod @RestM
		} catch {
			$Message = $_.Exception.Message
			$retry = $Message -like "*(503) Server Unavailable*"
			if ($retry) {
				$try++
				$Status += " => got a [(503) Server Unavailable], waiting $(10*($try)) seconds"
			} else {
				$Status += " => got an error : $message"
				Write-host -ForegroundColor Red $message
			}
		}

		Write-Progress -Activity $Activity -Status $Status -PercentComplete (($ActualPage + $try) * 100 / ($MaxPages*4) )
		$RestM.URI = $null # No next page per default
		if ($Message) {
			if ($retry) {
				$error.remove($error[0])
				start-sleep -s (10*($try))
			}
		} else {
			$try = 0
			if ($PsBP.containskey("GetAll")) {
				$RestM.URI = $Result.metadata.links.next
				$MaxPages = $Result.metadata.results.total
				$ActualPage = $Result.metadata.results.index
				Write-verbose "GETALL : Adding $($Result.data.count) items"
				$Results += $Result.data
			} else {
				$RestM.URI = $null
				$Results = $Result
			}
		}
		write-verbose "try[$try] Retry[$retry] URI[$($RestM.URI)] || Max/Actual Pages : [$MaxPages/$ActualPage]"
	} while ( $try -lt 5 -and ($retry -or $RestM.URI) )

	if ($try -ge 5 -and !$Results) {
		return write-error "Failed to get the query [$($RestM.URI)] after 5 tries with message [$message]"
	}

	if ($RHV) {
		$Conf["RHV"] = $RHV
		if ($RHV["X-RateLimit-Reset"]) {
			$Conf["X-RateLimit-Reset"] = [int]($RHV["X-RateLimit-Reset"][0])
		}
		if ($RHV["X-RateLimit-Remaining"]) {
			$Conf["X-RateLimit-Remaining"] = (get-date).AddSeconds($RHV["X-RateLimit-Remaining"][0])
		}
		Write-verbose "Rest/X-RateLimit-Remaining $($Conf["X-RateLimit-Reset"])/$($Conf["X-RateLimit-Remaining"])"
	}

	# MODIFIED : Outputting directly the results
	if ($Results.metadata -and $Results.metadata.results) {
		if ($Results.metadata.results.total -like $Results.metadata.results.current_item_count) {
			if ($Results.data) {
				$results = $results.data
			}
		}
	}


	# Adding a type to our commands
	$TypeName = "Amp1_" + ( $Function -replace "/({.*?\}/?)?","_"   )
	if ($Results) {
		$Results | % { $_.psobject.typenames.insert(0,$TypeName) }
	}
	return $Results
}
Export-ModuleMember Invoke-Amp1
