[CmdletBinding()]
param(
    [Parameter(Mandatory,Position=0)][string]$ProjectName,
    [switch]$GenerateMainModule,
    [switch]$Force,
    [hashtable]$LastNounToVern = @{},
    [hashtable]$FunctionRename = @{},
    [hashtable]$AdditionalParameters = @{},
    [hashtable]$DescriptionToVerb = @{},
    [String]$OutPath

)
$error.clear()


###############
# Working on initial path and Loading the json file
###############
$ScriptPath   = split-path -parent $MyInvocation.MyCommand.Definition


$Files = @{
    JsonPath     = $ScriptPath + "\Projects\$ProjectName*.json"
    TemplateFile = $ScriptPath + "\Template\Template.psm1"
    psm1File     = $ScriptPath + "\Output\$ProjectName.psm1"
    psd1File     = $ScriptPath + "\Output\$ProjectName.psd1"
    Output       = $ScriptPath + "\Output\$ProjectName.ps1"
}

if ($OutPath) {
    $Files.Output      = ($OutPath + "\$ProjectName.ps1") -replace  "\\\\","\"
}

if (!(test-path $Files.JsonPath)) {
    Write-Host "The file $($Files.JsonPath) does not exist" -ForegroundColor red
    return
}

$AllOpen =  get-item $Files.JsonPath | % { $_ | get-content | ConvertFrom-Json -Depth 50 -AsHashtable }
if (!$AllOpen) {
    Write-Host "Unable to ConvertFrom-Json the file $($Files.JsonPath)" -ForegroundColor red
    return
}



###############
# Generating main module file - if requested
###############

if ($GenerateMainModule -and !$force) {
    if (test-path $files.psm1File) {
        $R = Read-Host "The file $TemplateFile exists, if you type ""yes"" the file will be overwritten. Any other command will exit the script. Type ""Yes"" to rebuild the existing file"
        if ($R -notlike "yes") { return }
    }

    $psm1 = Get-content  $files.TemplateFile
    $URLInfo = ($open | % { $_.servers | ? { $_.containskey("url") } })
    $MainUrl = $URLInfo.url -replace "^https?://"
    $MainProtocol =  $URLInfo.url -replace "://.*"
    $psm1 = $psm1 -replace "!Project!",$ProjectName
    $psm1 = $psm1 -replace "!MainURL!",$MainUrl
    $psm1 = $psm1 -replace "!Protocol!",$MainProtocol
    $psm1 | out-file  $files.psm1File -force

    if (test-path $files.psd1File) { remove-item $files.psd1File -force | out-null }
    New-ModuleManifest -Path $files.psd1File -Author OpenApi-To-PowerShell -NestedModules "$ProjectName.ps1" -CmdletsToExport * -FunctionsToExport * -VariablesToExport * -AliasesToExport *
}


###########################################
# Recursive function to replace all references to the target values
###########################################
function Replace-References {
    param( [string[]]$kpath )
    # write-host $Kpath
    $Target = $Open
    $kpath | % {
        $LastTarget = $Target
        $LastKey    = "$_"
        $Target     = $Target["$_"]

    }
    # Write-Progress -Activity "Replacing References" -Status "Processing $kpath"

    if ($Target -is [array]) {
        $NewResults = @()
        foreach ($SingleT in $Target) {
            if ($SingleT.'$ref') {
                # Write-host "Found a ref in $kpath"
                $RefTarget = $Open
                $SingleT.'$ref' -replace '^#/' -split "/" | % { $RefTarget = $RefTarget["$_"] }
                $NewResults += $RefTarget
            } else {
                $NewResults += $SingleT
            }
        }
        $LastTarget["$LastKey"] = $NewResults
    } elseif ($Target -is [hashtable]) {
        if ($Target['$ref']) {
            $RefTarget = $Open
            $Target['$ref'] -replace '^#/' -split "/" | % { $RefTarget = $RefTarget["$_"] }
            $LastTarget["$LastKey"] = $RefTarget
        }
        @($Target.keys) | % {
            Replace-References -kpath ($kpath + $_)
        }
    }
}

foreach ($Open in $AllOpen) { Replace-References paths }

###########################################
# Interative function that replaces schema references to its definition
###########################################
foreach ($Open in $AllOpen) {
    $Open.paths.psbase.keys | % {
        $Open.paths[$_].psbase.keys | % {
            if ($Open.paths[$_].psbase.keys -like "schema") {
                $Open.paths[$_].schema = $Open.paths[$_].schema -replace "^#/definitions/",""
            }
        }
    }
}

###########################################
# Replacing entries of type "requestBody"
###########################################
# $Key = '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches'
# $Method = 'post'
foreach ($Open in $AllOpen) {
    foreach ($Key in @($Open.paths.psbase.keys)) {
        foreach ($Method in $Open.paths[$key].psbase.keys) {
            $Target = $Open.paths[$key][$Method]
            if ($Target.containsKey("requestBody")) {
                if ($Target["requestBody"].containsKey("content")) {
                    if ($Target["requestBody"]["content"].containsKey("application/json")) {
                        if ($Target["requestBody"]["content"]["application/json"].containsKey("schema")) {
                            $Schema = $Target["requestBody"]["content"]["application/json"]["schema"]
                            if ($schema.containskey("properties")) {
                                foreach ($prop in $schema.properties.psbase.keys) {
                                    $NewParam = [ordered]@{}
                                    $NewParam["name"] = "$Prop"
                                    $NewParam["description"] = $schema.properties[$Prop]["description"]
                                    $NewParam["schema"] = @{ "Type" = $schema.properties[$Prop]["type"] }
                                    $Target["parameters"] += @($NewParam)
                                }
                            }
                            if ($schema.containskey("oneOf")) {
                                $schema.oneOf | % {
                                    foreach ($prop in $_.properties.psbase.keys) {
                                        $NewParam = [ordered]@{}
                                        $NewParam["name"] = "$Prop"
                                        $NewParam["description"] = $_.properties[$Prop]["description"]
                                        $NewParam["schema"] = @{ "Type" = $_.properties[$Prop]["type"] }
                                        $Target["parameters"] += @($NewParam)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            # if ($Error) { write-host Key : $Key Methd : $Method ; return }
        }
    }
}
###############
# Functions
###############

Function Get-LongestCommonString {
    param(
        [string[]]$Strings
    )
    $Ans = $Strings | select -first 1
    $Strings | select -skip 1 | % {
        for ($l = [math]::Min($Ans.length,$_.length); $l -ge 1; $l--) {
            if ($Ans.substring(0, $l) -like $_.substring(0, $l)) {
                $Ans = $Ans.substring(0, $l)
                break
            }
        }
    }
    return $Ans
}

Function Convert-ParameterDetails {
    param(
        $PDetail
    )
    $Parameter = @()
    switch (@($PDetail.psbase.keys)) {
        required {
            if ($PDetail["required"]) { # This is because required might be false
                $Parameter += "Mandatory"
                $Parameter += "Position=$Position"
                $Position++
            }
        }
        enum {
            $Parameters[$name]["ValidateSet"] = $PDetail["enum"]
        }
        format {
            $Parameters[$name]["ValidateScript"] = $ValidateScript[$PDetail["format"]]
        }
    }
    if ($Parameter) {
        $Parameters[$name]["Parameter"] += @($Parameter)
    }
    if ($PDetail.contains("type")) {
        if ($PDetail.type -like "array") {
            if ($PDetail.contains("items")) {
                $Parameters[$name]["Type"] =  $ObjectTypeConversion[$PDetail."items"."type"] + "[]"
            } else {
                $Parameters[$name]["Type"] = "PsObject[]"
            }
        } elseif ($PDetail.contains("type") -and $PDetail.type ) {
            $Parameters[$name]["Type"] = $ObjectTypeConversion[$PDetail."type"]
        }
    }
    return $parameter
}

Function Convert-Parameter {
    param(
        $OpenApiParameters
    )
    foreach ($FParam in $OpenApiParameters) {
        if ($FParam.in -like "body" -and $FParam.schema) {
            $Parameters[$FParam.name] = @{}
            $Parameters[$FParam.name]["Type"] = "HashTable"
            if ($error) { exit }
        } else {
            $Name = $FParam.name
            $Parameters[$name] = @{}

            $Parameter  += Convert-ParameterDetails $FParam
            if ($FunctionName -like "Get-GitHubissues") {
                Write-host -ForegroundColor yellow " > [1] $FunctionName $($FParam.name) Schema : $( $Parameters[$name].keys -join ',')"
            }

            if ( $FParam.contains("schema")) {
                $Parameter  += Convert-ParameterDetails $FParam."schema"
                if ($FunctionName -like "Get-GitHubissues") {
                    Write-host -ForegroundColor yellow "  > [2] $FunctionName $($FParam.name) Schema : $( $Parameters[$name].keys -join ',')"
                }
            }
        }
    }
}

Function Convert-DataSchemaToParameters {
    param(
        $OpenApiParameters
    )
    $Position = 0
    foreach ($name in $OpenApiParameters["properties"].keys) {
        $Parameters[$name] = @{}
        $Parameter  = @()
        $FParam = $OpenApiParameters["properties"][$name]

        if ($name -in $OpenApiParameters.required) {
            $Parameter += "Mandatory"
            $Parameter += "Position=$Position"
            $Position++
        }
        if ($FParam.items.type) {
            $Parameters[$name]["Type"] =  $ObjectTypeConversion[$FParam.items.type]
            # write-host "$name >" $Parameters[$name]["Type"]
        } else {
            $Parameters[$name]["Type"] = "PsObject"
        }
        if ($FParam."type" -like "array") {
            $Parameters[$name]["Type"] += "[]"
        }

        switch ($FParam.psbase.keys) {
            type {
                if ($FParam."$_" -notlike "array") {
                    # Write-host "OVER $_"
                    $Parameters[$name]["Type"] = $ObjectTypeConversion[$FParam."$_"]
                }
            }
            enum {
                $Parameters[$name]["ValidateSet"] = $FParam["enum"]
            }
            format {
                $Parameters[$name]["ValidateScript"] = $ValidateScript[$FParam["format"]]
            }
        }
        if ($Parameter) {
            $Parameters[$name]["Parameter"] = $Parameter
        }
        # write-host "$name >" $Parameters[$name]["Type"]
    }
}

###############
# Other Initial parameters
###############
# $InitialTrim = Get-LongestCommonString $Open.paths.keys
$s = " " * 4

###################
# None costumable variables
###################
# Allows to switch the Verb based on the last word of the function
$DescriptionToVerb = @{
    get = @{
        search = "Find"
    }
    post = @{
        Check  = "Test"
        search = "Search"
        delete = "Remove"
    }
}


# Aligns the Rest Method to a Powershell Verb
$MethodToVerb = @{
    "get"    = "Get"
    "post"   = "New"
    "put"    = "Set"
    "delete" = "Remove"
    "patch"  = "Update"
}


$ValidateScript = @{
    "uuid" = " $_ -as [guid]"
}

$FunctionToVerb     = @{}

$ObjectTypeConversion = @{
    "string"    = "String"
    "integer"   = "BigInt"
    "number"    = "BigInt"
    "boolean"   = "Switch"
    "file"      = "System.IO.FileInfo"
    "object"    = "HashTable"
    "date-time" = "DateTime"
}

$SchemaConversion = @{}



###############
# Phase 1 : Converting OpenApi Data to a HashTable
###############
Write-Host Phase 1 : converting OpenApi to a Hashtable -ForegroundColor green
$AllFunctions = @{}
foreach ($Open in $AllOpen) {
    Foreach ($MKey in (@($open.paths.psbase.keys) | sort)) {

        ########################################
        # Building : Noun|LastNoun|OriginalNoun
        ########################################
        $Noun = $MKey -replace "^/|/\{.*?\}|_|-|/$"

        $Noun = ($Noun  -split "/" | ? { $_ } | % {
            $_.substring(0,1).toupper()+$_.substring(1).tolower()
        })

        $LastNoun =  $Noun | select -last 1
        $OriginalNoun = $Noun -join ""
        if ($LastNoun -and $LastNounToVern.containskey($LastNoun)) {
            $Noun         = $Noun | select -skiplast 1
        }
        $Noun = $Noun -join "" # -replace $toIgnore

        ########################################
        # Sorting Global Parameters for the function
        ########################################

        # Building the Parameter List

        foreach ($Method in (@($open.paths[$MKey].psbase.keys) | ? { $_ -in $(@($MethodToVerb.keys)) } | sort)) {
            # Building the Verb
            $LocalNoun  = $Noun
            $Verb       = $MethodToVerb[$Method]

            if ($LastNoun -and $LastNounToVern.containskey($LastNoun)) {
                # Write-host " > LastNounToVern [$MKey] $Verb-$ProjectName$OriginalNoun > $($LastNounToVern[$LastNoun])-$ProjectName$LocalNoun"
                $Verb = $LastNounToVern[$LastNoun]
            } else {
                $LocalNoun = $OriginalNoun
            }

            if ($DescriptionToVerb.containskey($Method)) {
                $FirstWord = $open.paths[$MKey][$Method].summary -split "\s" | select -First 1
                if ($DescriptionToVerb[$Method].containskey($FirstWord)) {
                    # Write-host " > DescriptionToVerb [$MKey] $Verb-$ProjectName$LocalNoun > $($DescriptionToVerb[$Method][$FirstWord])-$ProjectName$($LocalNoun -replace ("$Verb" + '$'))"
                    $Verb = $DescriptionToVerb[$Method][$FirstWord]
                    $LocalNoun = $LocalNoun -replace ("$Verb" + '$')
                }
            }

            if ($FunctionToVerb.containskey($MKey)) {
                if ($FunctionToVerb[$MKey].containskey($Method)) {
                    $Verb = $FunctionToVerb[$MKey][$Method]
                }
            }

            if ($open.paths[$MKey][$Method].ContainsKey("requestBody")) {
                $Parameters["Body"] = @{}
                $Parameters["Body"]["type"] = "HashTable"
            }

            $Target = "$MKey"
            $FunctionName = "$Verb-$ProjectName$LocalNoun"
            if ($FunctionRename.containskey($FunctionName)) {
                # write-host " > FunctionRename [$Mkey] $FunctionName > $($FunctionRename[$FunctionName])"
                $FunctionName = $FunctionRename[$FunctionName]
            }

            ###########################
            # Computing parameters of the function
            ###########################
            $Parameters = @{}
            $Position   = 0
            $Parameter  = @()

            if ($open.paths[$MKey].ContainsKey("parameters")) {
                Convert-Parameter -OpenApi $open.paths[$MKey]["parameters"]
            }
            Convert-Parameter -OpenApi $open.paths[$MKey][$Method]["parameters"]
            if ($FunctionName -like "Get-GitHubissues") {
                Write-host -ForegroundColor Cyan "  > $FunctionName $($FParam.name) Schema : $( $Parameters[$name].keys -join ',')"
            }


            if ($AllFunctions.containskey( $FunctionName)) {
                if($AllFunctions[$FunctionName].containskey($Target)) {
                    Write-host duplicated function found $MKey $LocalNoun -ForegroundColor yellow
                } else {
                    $AllFunctions[$FunctionName].add($Target, $Parameters)
                }
            } else {
                $AllFunctions[$FunctionName] = @{ "$Target" = $Parameters }
            }
        }
        if ($Error) { write-host $MKey $FunctionRename ; return }
    }
}

###########
# Adding multiple parameter set parameters
###########
Write-Host Phase 2 : Computing all functions to settle parameters "&" parameter set -foregroundcolor green
$FunctionPSN = @{}
foreach ($F in $AllFunctions.psbase.keys) {
    $Multiple = $AllFunctions[$F].count
    if ($Multiple -gt 1) {
        $FunctionPSN[$F] = @{}
        $LGS = (Get-LongestCommonString $AllFunctions[$F].psbase.keys)
        $InAllFunctions = $AllFunctions[$F].values.keys | group | ? { $_.count -like $Multiple } | select -ExpandProperty Name
        if ($f -like "Get-GitHubReposActionsWorkflows") {
            # Write-host " $F InAllFunctions : $($InAllFunctions -join ',') || $LGS"
        }

        foreach ($K in @($AllFunctions[$F].psbase.keys)) {
            if ($k -like $Lgs) {
                $FunctionPSN[$F][$k] = "Search"
            } else {
                $FunctionPSN[$F][$k] = $k.Substring($Lgs.length) -replace "{|}|/"
            }
            $PSN_ToAdd = @($AllFunctions[$F][$k].psbase.keys) | ? { $_ -notin $InAllFunctions }

            # Adding Extra parameters if wanted
            @($AdditionalParameters.keys) | ? { $AllFunctions[$F][$K].containskey($_) } | % {
                $Clone = [System.Management.Automation.PSSerializer]::Serialize($AdditionalParameters[$_])
                $AllFunctions[$F][$K] +=  [System.Management.Automation.PSSerializer]::Deserialize($Clone)
                if ($PSN_ToAdd.Contains($_)) { $PSN_ToAdd += @($AdditionalParameters[$_].keys) }
            }

            # Setting ParameterSetName
            foreach ($P in $PSN_ToAdd) {
                # Write-host "$F|$k|$p"
                $AllFunctions[$F][$k][$P]["Parameter"] += "ParameterSetName='$($FunctionPSN[$F][$k])'"
            }
        }
    }
}

###########
# Generating code from the HashTable
###########
Write-Host Phase 3 : Generating code from the hashtable -foregroundcolor green
$Module = @()
foreach ($F in $AllFunctions.psbase.keys) {
    $Function = @()

    $Function += "Function $F {"
    if ($FunctionPSN.ContainsKey($F)) {
        $Function += $s + "[CmdletBinding(DefaultParameterSetName='Search')]"
    } else {
        $Function += $s + "[CmdletBinding()]"
    }

    $UniqueP = @{}
    foreach ($key in @($AllFunctions[$F].psbase.keys)) {
        $AllFunctions[$F][$key].psbase.keys | % {
            $UniqueP[$_] += @($key)
        }
    }

    $InAllFunctions = $AllFunctions[$F].values.keys | group | ? { $_.count -like  $AllFunctions[$F].count       } | select -ExpandProperty Name

    $AllParams = @()
    foreach ($p in $UniqueP.psbase.keys) {
        $String = ""
        $MPS = $false ; $LT = $null ; $IAF = $InAllFunctions -contains "$p"
        # if ($F -like 'Get-GitHubReposActionsArtifacts') {
        #     Write-host "$F|$p|$IAF ... $($InAllFunctions -join ',')" -ForegroundColor yellow
        # }
        foreach ($T in ($UniqueP[$p])) {
            # $Types | % { $ShortT = $ShortT -replace ("^$ShortRemove") }
            # if ($F -like 'Get-GitHubReposActionsArtifacts') {
            #     Write-host " > $T|$IAF" -ForegroundColor blue
            # }
            if ( $AllFunctions[$F][$T][$p].containskey("Parameter")) {
                if ($InAllFunctions -notcontains $p) {
                    if ($IAF) { $String += "`n" + $s*2 } else { $IAF = $true }
                    $String += "[Parameter(" +  ($AllFunctions[$F][$T][$p]["Parameter"] -join ",") + ")]"
                } elseif ($IAF) {
                    $String += "[Parameter(" +  ($AllFunctions[$F][$T][$p]["Parameter"] -join ",") + ")]"
                    $IAF = $false
                }
            }

            if ( $AllFunctions[$F][$T][$p].containskey("ValidateSet") -and !$MPS) {
                if ($F -like "Get-GitHubissues") { Write-host TESQFDQSDFQSDF : $t $p}
                $String += "[ValidateSet('$($AllFunctions[$F][$T][$p]["ValidateSet"] -join ''',''')')]"
                $MPS = $true
            }

            if ($AllFunctions[$F][$T][$p].containskey("type") -and !$LT) {
                # write-host type 2 $AllFunctions[$F][$T][$p]["type"]
                $LT = '[' + $AllFunctions[$F][$T][$p]["type"] + "]"
            }
            # note : This is not dealt as of today ... replacement will fail if there is a replacement in the parameter name
        }
        $String += $LT + ('$' + ($p -replace " |-"))
        $AllParams += $s*2 + $String
    }

    if ($AllParams) {
        $Function += $s + "param ("
        $Function += ($AllParams | sort) -join ",`n"
        $Function += $s + ")"
    } else {
        $Function += ($s + "param ( )")
    }

    if ($AllFunctions[$F].count -gt 1) {  $Function += $s + "Switch (`$PsCmdlet.ParameterSetName) {" }
    @($AllFunctions[$F].keys) | % {
        if ($AllFunctions[$F].count -gt 1) {
            $Function += $s*2 + "'$($FunctionPSN[$F][$_])' { Invoke-$ProjectName -PsBP `$PsBoundParameters '$_' } "
        } else {
            $Function += $s + "Invoke-$ProjectName -PsBP `$PsBoundParameters '$_'"
        }
    }
    if ($AllFunctions[$F].count -gt 1) { $Function += $s + "}" }
    $Function += "}"
    $Function += "Export-ModuleMember $F"

    $Module += ($Function -join "`n") + "`n"
}

Write-Host Phase 4 : Adding the Schema conversion when there is one -foregroundcolor green
if ($SchemaConversion.count) {
    $Module += '$Schema = '''
    $Module +=  ($SchemaConversion | ConvertTo-Json -Depth 10) + "' | convertfrom-Json -Depth 10"
}

###########
# Converting the module to a .ps1 file
###########
Write-Host Phase 5 : Exporting the module to $Files.Output -foregroundcolor green

if ($Files.Output) {
    $Module -join "`n"  | out-file $Files.Output
}


return