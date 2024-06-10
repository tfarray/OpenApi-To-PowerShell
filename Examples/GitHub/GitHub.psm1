################################################################################
# GitHub                 #
# OpenApi : https://github.com/github/rest-api-description/blob/main/descriptions/api.github.com/api.github.com.json
#
# IMPORTANT NOTE : This module is not finished, only GET functions are working
################################################################################


$GitHubConf = @{
    BaseURL       = "api.github.com"
    credential    = $null
    CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters) + "Force"
}



function Initialize-GitHub {
    [CmdletBinding()]
	param (
        [pscredential]$Credential
    )
    process {
		switch ($PSBoundParameters.Keys) {
			Credential { $Global:CiscoPowerTools.GitHub.Credential = $Credential }
		}

	}
}
Export-ModuleMember Initialize-GitHub

function Invoke-GitHub {
    [CmdletBinding()]
	param (
        [parameter(Mandatory,Position = 0)][string]$Function,
        [string[]]$Query=@(),
		$Method,
		$Json,
		[hashtable]$PsBP=@{}
    )

	$ToIgnore = $GitHubConf.CommonParameters + "GetAll"
	$TypeName = "GitHub_" + ( $Function -replace "/({.*?\}/?)?","_"   )

	if (!$GitHubConf.Credential) {
		Write-host 'No Credential found for GitHub API, please run :'
		Write-host ' Initialize-GitHub $Credential'
		write-host 'To inform the tool which credential are going to get used. $Credential is a PsCredential Object'
		return
	}

	# Transforming PsBoundParameters to API command
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
        Uri			  = ("https://$($GitHubConf.BaseURL)" + $Function )
		Headers		  = @{
			"Content-Type" = "application/vnd.github+json"
			"Authorization" = "Bearer $($GitHubConf.Credential.GetNetworkCredential().Password)"
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
			if (!($GetAll -and $key -in "page","per_page")) {
				$Query += ("$key=" + $PsBP[$key])
			}
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


	$Result       = @()
	$page         = 1
	$per_page     = 100
	$PropToExpand = $null
	$OriginalURI  = $RestM.Uri
	Do {
		$RestM.Uri = $OriginalURI
		$LQ  = @($Query)
		if ($GetAll) { $LQ += @("page=$page","per_page=$per_page") }
		if ($LQ)     { $RestM.Uri += "?" + ($LQ -join "&") }

		write-verbose ($RestM | out-string )
		if ($RestM["Body"]) { Write-verbose $RestM["Body"] }

		# Running the Local Command
		if ($RestM.Uri -match "/zip$") {
			$WR = Invoke-WebRequest @RestM
			$inputStream = [System.IO.MemoryStream]::new($Wr.Content)
			$zipArchive = [System.IO.Compression.ZipArchive]::new($inputStream, [System.IO.Compression.ZipArchiveMode]::Read)
			$LR = foreach ($entry in $zipArchive.Entries) {
				$entryStream = $entry.Open()
				$streamReader = [System.IO.StreamReader]::new($entryStream)
				$fileContent = $streamReader.ReadToEnd()
				[PSCustomObject]@{
				    FileName = $entry.FullName
				    Content  = $fileContent
				}
				$streamReader.Close()
				$entryStream.Close()
			}
		} else {
			$LR = Invoke-RestMethod @RestM
		}

		if (!$PropToExpand -and $LR.total_count) {
			$PropToExpand = $LR.psobject.members | ? {
				$_.MemberType -like "NoteProperty" -and $_.name -notlike "total_count"
			} | select -ExpandProperty name
		}

		if ($GetAll -and $LR.total_count) {
			if ($PropToExpand) {
				$Result += $LR."$PropToExpand"
				$Page ++
			} else {
				$GetAll = $false
				$Result = $LR
			}
		} elseif ($PropToExpand) {
			$Result = $LR."$PropToExpand"
		} else {
			$Result = $LR
		}
		# Write-host "page : $Page | GetAll : $Getall | prop To Exp : $PropToExpand | total $($LR.total_count)"
	} until ( !$GetAll -or (($Page - 1) * $per_page ) -ge $LR.total_count)
	if ($Result) {
		$Result | % { $_.psobject.typenames.insert(0,$TypeName) }
	}
	return $Result
}
Export-ModuleMember Invoke-GitHub