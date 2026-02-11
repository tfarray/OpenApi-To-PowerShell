
$Conf = @{
  	BaseURL    = "apix"
	Credential = $null
	Filters = @{
		eq         = "Equals. Finds exact match. Case-sensitive."
		neq        = "Not equal"
		lt         = "Less than"
		le         = "Less than or equal"
		gt         = "Greater than"
		ge         = "Greater than or equal"
		like       = "Pattern matching, case sensitive"
		ilike      = "Pattern matching, case insensitive"
		startswith = "Matches strings starting with input"
		endswith   = "Matches strings ending with input"
		contains   = "Substring matching"
		and        = "Logical AND. Requires 1 or more operands."
		or         = "Logical OR. Requires 1 or more operands."
		not        = "Logical NOT. Requires 1 or more operands."
	}
	CommonParameters = ([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters)
}

################################################################################
# My Id Groups
# https://cisco.sharepoint.com/sites/MyIdGroups/SitePages/API-Documentation.aspx
# API Examples : https://cisco.sharepoint.com/sites/MyIdGroups/SitePages/API-Examples.aspx
################################################################################

Function Initialize-MyIdGroups {
	[CmdletBinding()]
	Param(
		[System.Management.Automation.PSCredential]$Credential
	)
	Process {
		$Conf = $Conf
		switch ($PsBoundParameters.keys | ? { $_ -notin $Conf.CommonParameters }) {
			"Credential" {
				$Conf.credential = $Credential
			}
		}
	}
}
Export-ModuleMember -Function Initialize-MyIdGroups

Function Show-MyIdGroupsFilter {
	[CmdletBinding()]
	Param(	)
	Process {

		Write-host "Filtering is a great tool proposed by the API, which comes with a complexity when using it."
		Write-host "First, here are all the avaiable operators : `n"
		write-host ( $Conf.Filters | ft -AutoSize -HideTableHeaders | out-string )
		write-host "`nHere are some examples :"
		Write-host '-fields "[group]=membership_type,status,security,name'
	}
}
Export-ModuleMember -Function Show-MyIdGroupsFilter

Function Show-MyIdGroupsFields {
	[CmdletBinding()]
	Param(	)
	Process {

		Write-host " Examples : "
		Write-host " -fields ""[group]=status,security,name"""
	}
}
Export-ModuleMember -Function Show-MyIdGroupsFields

Function Show-MyIdGroupsInclude {
	[CmdletBinding()]
	Param(	)
	Process {
		Write-host "The filter 'include' is used to add related items to the results"
		Write-host " Example [you want to show members of a group] :"
		Write-Host " Get-MyIdGroupsGroup -include ""member_users"" -fields ""[group]=member_users"""
	}
}
Export-ModuleMember -Function Show-MyIdGroupsInclude

Function Show-MyIdGroupsPage {
	[CmdletBinding()]
	Param(	)
	Process {
		Write-host "When dealing with large numbers, you may have to use pagination"
		Write-host 'This switch has 3 parameters : limit,after,before'
		Write-host "`n Example : to show the items 50 to 60"
		Write-Host ' -page "[limit]=10",[after]50'
		Write-host "`n Example : to show the items 50 to 60"
		Write-Host ' -page "[limit]=10","[before]60"'
		Write-host "`n Example : if you are sorting"
		Write-Host ' -sort "[group]=name" -page "[after]=12,last_group_name"'
		Write-host "`n Example : using both after and before to find item 12 to 20"
		Write-Host ' -page "[after]=12","[before]=20"'
	}
}
Export-ModuleMember -Function Show-MyIdGroupsInclude

Function Show-MyIdGroupsPage {
	[CmdletBinding()]
	Param(	)
	Process {
		Write-host 'Sort the primary resource by a field. If the name of the field is prepended with "-", the resource is sorted using that field in reverse order.'
		Write-host "`n Example :"
		Write-Host ' -sort "[group]=name"'
		Write-host "`n Example : "
		Write-Host ' -sort "[group]=-name"'
	}
}
Export-ModuleMember -Function Show-MyIdGroupsPage


function Invoke-MyIdGroups {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)][string]$Function,
        [string[]]$Query=@(),
		[hashtable]$PsBP=@{}
	)
	Process {
		$Conf  = $Conf

		$Token = Request-MyIdSsoToken $Conf.Credential
		if (!$Token) {
			write-error "Unable to fetch a token from MyId using $($Conf.Credential.UserName)"
			return
		}

		$ToIgnore = $Conf.CommonParameters
		$Function = ($Function -split "/" | % {
			if ($_ -match "^{.*}$") {
				$key = $_ -replace "{|}"
				$PsBP[$key]
				$ToIgnore += $key
			} else {  $_ }
		}) -join "/"

		$RestM = @{
			Uri     =  "https://" + $Conf["BaseUrl"] + ".cisco.com/api/myid-groups" + $Function
			Headers = @{ Authorization = "Bearer $Token" }
			Content = "application/vnd.api+json"
			# Accept  = "application/vnd.api+json"
			method  = "GET"
		}

		$CalledBy = (Get-PSCallStack)[1].command
		switch -regex ($CalledBy) {
			"^Remove-"        { $RestM["method"] = "DELETE" 	}
			"^(add|new)-"     { $RestM["method"] = "POST"		}
		}

		$Query = @()
		Switch -regex (@($PsBP.keys) | ? { $_ -notin $ToIgnore }) {
			"XRequestID" { $RestM.Headers["X-Request-ID"] = $PsBP[$_] }
			"Body"		 { $RestM["Body"] = $PsBP["Body"] | ConvertTo-Json -Depth 10 -Compress }
			Default      {
				$Value = $PsBP.item($_)
				if ($Value -is [hashtable]) {
					# $LocalQ = @()
					foreach ($Key in @($Value.keys)) {
						# $LocalQ += ($_ + $key + "=" + $Value[$key])
						$Query += ($_ + $key + "=" + $Value[$key])
					}
					# $Query += ($LocalQ -join ",")
				} else {
					$Query += ($_ + "=" + $Value)
				}
			}
		}
		if ($Query) { $RestM.Uri += "?" + ($Query -join "&") }
		# This has no automation effect, it's just for testint
		switch ($PSBoundParameters.keys) {
			Method	{ $RestM["method"] = $Method }
			Json	{ $RestM["Body"] = $JSON }
		}

		write-verbose ($RestM | out-string )
		if ($RestM["Body"]) { Write-verbose $RestM["Body"] }

		try {
			$Response = Invoke-RestMethod @RestM
		} catch {
			if ($_.ErrorDetails.Message | Test-Json) {
				$LE = $_.ErrorDetails.Message | ConvertFrom-Json
				$global:Error.RemoveAt(0)
				write-error ($LE.errors.detail -join ',')
			}
		}

		# In case we have inclusions, we need to set mappings to get all data
		$Included = @{}
		if ($Response.included) {
			Write-host "We have included" -ForegroundColor green
			$Response.included.type | select -unique  | % {
				$Included.add($_,@{})
			}
			$Response.included | % {
				$Included[$_.type][$_.id] = $_.attributes
			}
		}

		# Now we can work on the result itself
		if ($Response.data) {
			[string[]]$Fields = $Response.data | Get-Member -MemberType NoteProperty | select -expand name | ? { $_ -notin "attributes","meta" }

			[string[]]$AllFields = $Fields
			if ($Response.data.attributes) {
				$AllFields += ($Response.data | select -first 1 -expand attributes | gm -MemberType NoteProperty | select -ExpandProperty name ) | ? { $_ }
			}
			$Set = New-Object System.Management.Automation.PSPropertySet("DefaultDisplayPropertySet",$AllFields)
			$PSStandardMembers = [System.Management.Automation.PSMemberInfo[]]@($Set)

			$FinalResult = foreach ($data in $Response.data) {
				$Local = $Data | select $Fields
				if ($Data.attributes) {
					# We are expanding all attributes to the main object output
					$Data.attributes | gm -MemberType NoteProperty | select -ExpandProperty name | % {
						$Local | Add-Member -MemberType NoteProperty -Name $_ -Value $Data.attributes.$_
					}

					# We need to inject included data back to the results to have advanced data
					if ($Data.relationships) {
						$Data.relationships  | gm -MemberType NoteProperty | select -ExpandProperty name | % {
							$Data.relationships."$_".data | ? {
								$included.ContainsKey($_.type)
							} | ? {
								$included[$_.type].ContainsKey($_.id)
							} | % {
								foreach ($field in ($included[$_.type][$_.id] | gm -MemberType NoteProperty | select -ExpandProperty name)) {
									$_ | Add-Member -MemberType NoteProperty -Name $field -Value $included[$_.type][$_.id]."$field"
								}
							}
						}
					}
				}

				# Now that we have our object, we are adding a type and hiding unwanted fields
				if ($CalledBy -match "-myidgroups") {
					$Local | Add-Member -MemberType NoteProperty -Name RawData -Value $Response
					$Local.PSObject.TypeNames.Insert(0,($CalledBy -split "\-")[1])
					$Local | Add-Member MemberSet PSStandardMembers $PSStandardMembers
				}
				$Local
			}
			return $FinalResult
		} else {
			Return $Response
		}
	}
}
Export-ModuleMember -Function Invoke-MyIdGroups