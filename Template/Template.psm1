
!Project!Conf = @{
    BaseURL       = "!MainURL!"
    credential    = $null
    CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters) + "Force"
}



function Initialize-!Project! {
    [CmdletBinding()]
	param (
        [pscredential]$Credential
    )
    process {
		switch ($PSBoundParameters.Keys) {
			Credential { $!Project!.Credential = $Credential }
		}

	}
}
Export-ModuleMember Initialize-!Project!

function Invoke-!Project! {
    [CmdletBinding()]
	param (
        [parameter(Mandatory,Position = 0)][string]$Function,
        [string[]]$Query=@(),
		$Method,
		$Json,
		[hashtable]$PsBP=@{}
    )

	$ToIgnore = $!Project!Conf.CommonParameters
	$TypeName = "!Project!_" + ( $Function -replace "/({.*?\}/?)?","_"   )

	if (!$!Project!Conf.Credential) {
		Write-host 'No Credential found for !Project! API, please run :'
		Write-host ' Initialize-!Project! $Credential'
		write-host 'To inform the tool which credential are going to get used. $Credential is a PsCredential Object'
		return
	}

	$Function = ($Function -split "/" | % {
		if ($_ -match "^{.*}$") {
			$key = $_ -replace "{|}"
			$ToIgnore += $key
			if ($PsBP.containskey($key)) { $PsBP[$key] }
		} else { $_ }
	}) -join "/"

    # Setting Header
    $RestM = @{
        Method		  = "Get"
        Uri			  = ("!Protocol!://$($!Project!Conf.BaseURL)" + $Function )
		Headers		  = @{
			# Example : "Authorization" = "Bearer $($!Project!Conf.Credential.GetNetworkCredential().Password)"
		}
    }

	# Determining who called me and which Method to use
	$CalledBy = (Get-PSCallStack)[1].command
	switch -regex ($CalledBy) {
		"^Remove-"        		 	{ $RestM["method"] = "DELETE" 	}
		"^(add|new|Export|start)-"  { $RestM["method"] = "POST"	}
		"^(Disable)-"     			{ $RestM["method"] = "PUT"	}
	}

	# Preparaing items
	switch ($PSBoundParameters.keys) {
		GetAll	{ $GetAll = $true }
	}

	# Managing incoming Data
	$Query = @()
	$Body  = @{}
	foreach ($Key in @($PsBP.keys | ? { $_ -notin $ToIgnore })) {
		if ($RestM["method"] -match "GET|DELETE") {
			$Query += ("$key=" + $PsBP[$key])
		} else {
			$Body[$key] = $PsBP[$key]
		}
	}

	# Section only if custom Json or method is used
	switch ($PSBoundParameters.keys) {
		Method	{ $RestM["method"] = $Method }
		Json	{ $RestM["Body"]   = $JSON }
	}


	if ($Body.count) {
		$RestM["Body"] = ($Body | ConvertTo-Json -Depth 20 -Compress)
	}

	if ($Query) { $RestM.Uri += "?" + ($Query -join "&") }

	write-verbose ($RestM | out-string )
	if ($RestM["Body"]) { Write-verbose $RestM["Body"] }

	# Running the Local Command
	$Result = Invoke-RestMethod @RestM

	if ($Result) {
		$Result | % { $_.psobject.typenames.insert(0,$TypeName) }
	}
	return $Result
}
Export-ModuleMember Invoke-!Project!