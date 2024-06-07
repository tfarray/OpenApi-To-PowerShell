[CmdletBinding()]
param(
    [Parameter(Mandatory,Position=0)][string]$ProjectName,
    [hashtable]$LastFunctionToVerb,
    [hashtable]$FunctionRename,
    [hashtable]$AdditionalParameters,
    [String]$OutPath

)
# $ProjectName = "GitHub"
$error.clear()

###############
# Working on initial path and json file
###############
$ScriptPath  = split-path -parent $MyInvocation.MyCommand.Definition
$JsonPath    = $ScriptPath + "\Projects\$ProjectName.json"
if ($OutPath) {
    $Output      = ($OutPath + "\$ProjectName.ps1") -replace  "\\\\","\"
} else {
    $Output      = $ScriptPath + "\Output\$ProjectName.ps1"
}

if (!(test-path $JsonPath)) {
    Write-Host "The file $JsonPath does not exist" -ForegroundColor red
    return
}

$Open =  get-content $JsonPath | ConvertFrom-Json -Depth 50 -AsHashtable

# Depending on the last word of a function, we will change the verb on Phase 1
$LastFunctionToVerb = @{
    disable    = "Disable"
    enable     = "Enable"
}

$FunctionRename = @{
    "New-GitHubReposActionsWorkflowsDispatches"   = "Start-GitHubReposActionsWorkflows"
}

# This will add the additional switch GetAll if the parameter page exists in the funtion
$AdditionalParameters = @{
    page = @{ GetAll = @{ Type = "Switch"  ; Parameter = @() }}
}

###################
# None costumable variables
###################
# Allows to switch the Verb based on the last word of the function
$DescriptionToVerb = @{
    get = @{
        search = "Find"
    }
    post = @{
        Check = "Test"
        search = "Search"
        delete = "Remove"
    }
}

###########################################
# Replacing all refs to the target values
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

Replace-References paths


$Open.paths.psbase.keys | % {
    $Open.paths[$_].psbase.keys | % {
        if ($Open.paths[$_].psbase.keys -like "schema") {
            $Open.paths[$_].schema = $Open.paths[$_].schema -replace "^#/definitions/",""
        }
    }
}

###########################################
# Replacing entries of type "requestBody"
###########################################
$Key = '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches'
$Method = 'post'
foreach ($Key in $Open.paths.psbase.keys) {
    foreach ($Method in $Open.paths[$key].psbase.keys) {
        $Target = $Open.paths[$key][$Method]
        if ($Target.containsKey("requestBody")) {
            if ($Target["requestBody"].containsKey("content")) {
                if ($Target["requestBody"]["content"].containsKey("application/json")) {
                    if ($Target["requestBody"]["content"]["application/json"].containsKey("schema")) {
                        $Schema = $Target["requestBody"]["content"]["application/json"]["schema"]
                        if ($schema.containskey("properties")) {
                            foreach ($prop in $schema.properties.psbase.keys) {
                                Write-host Schema : $prop
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
            $Parameter  = @()
            switch ($FParam.psbase.keys) {
                required {
                    if ($FParam["required"]) {
                        $Parameter += "Mandatory"
                        $Parameter += "Position=$Position"
                        $Position++
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
            if ($FParam."type") {
                $Parameters[$name]["Type"] = $ObjectTypeConversion[$FParam.type]
            }
            if ($FParam."schema"."type") {
                if ($FParam."schema"."type" -like "array") {
                    if ( $FParam."schema"."items"."type" ) {
                        try {
                        $Parameters[$name]["Type"] =  $ObjectTypeConversion[$FParam."schema"."items"."type"] + "[]"
                        } catch {
                        Write-host ParamConv $MKey $Method $name "(ignored)" -ForegroundColor yellow
                        }
                    }
                } else {
                    # Write-host Type 2 $FParam."schema"."type"
                    $Parameters[$name]["Type"] = $ObjectTypeConversion[$FParam."schema"."type"]
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
            write-host "$name >" $Parameters[$name]["Type"]
        } else {
            $Parameters[$name]["Type"] = "PsObject"
        }
        if ($FParam."type" -like "array") {
            $Parameters[$name]["Type"] += "[]"
        }

        switch ($FParam.psbase.keys) {
            type {
                if ($FParam."$_" -notlike "array") {
                    Write-host "OVER $_"
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
        write-host "$name >" $Parameters[$name]["Type"]
    }
}

###############
# Other Initial parameters
###############

$InitialTrim = Get-LongestCommonString $Open.paths.keys
$s = " " * 4

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
    "string"  = "String"
    "integer" = "Int"
    "boolean" = "Switch"
    "file"    = "System.IO.FileInfo"
    "object"  = "HashTable"
}

$SchemaConversion = @{}



###############
# Phase 1 : Converting OpenApi Data to a HashTable
###############
Write-Host Phase 1 : converting OpenApi to a Hashtable -ForegroundColor green
$AllFunctions = @{}
Foreach ($MKey in (@($open.paths.keys) | sort)) {

    # Building the Noun
    $Noun = $MKey -replace "^/|/\{.*?\}|_|-|/$"

    $Noun = ($Noun  -split "/" | ? { $_ } | % {
        $_.substring(0,1).toupper()+$_.substring(1).tolower()
    })

    $LastF =  $Noun | select -last 1
    $OriginalNoun = $Noun -join ""
    if ($LastF -and $LastFunctionToVerb.containskey($LastF)) {
        $Noun         = $Noun | select -skiplast 1
    }
    $Noun = $Noun -join "" # -replace $toIgnore

    if ($open.paths[$MKey].ContainsKey("parameters")) {
        Convert-Parameter -OpenApi $open.paths[$MKey]["parameters"]
    }

    foreach ($Method in (@($open.paths[$MKey].keys) | ? { $_ -in $(@($MethodToVerb.keys)) } | sort)) {
        # Building the Verb
        $LocalNoun = $Noun
        $Verb      = $MethodToVerb[$Method]

        if ($LastF -and $LastFunctionToVerb.containskey($LastF)) {
            Write-host " > LastFunctionToVerb [$MKey] $Verb-$ProjectName$OriginalNoun > $($LastFunctionToVerb[$LastF])-$ProjectName$LocalNoun"
            $Verb = $LastFunctionToVerb[$LastF]
        } else {
            $LocalNoun = $OriginalNoun
        }

        if ($DescriptionToVerb.containskey($Method)) {
            $FirstWord = $open.paths[$MKey][$Method].summary -split "\s" | select -First 1
            if ($DescriptionToVerb[$Method].containskey($FirstWord)) {
                Write-host " > DescriptionToVerb [$MKey] $Verb-$ProjectName$LocalNoun > $($DescriptionToVerb[$Method][$FirstWord])-$ProjectName$($LocalNoun -replace ("$Verb" + '$'))"
                $Verb = $DescriptionToVerb[$Method][$FirstWord]
                $LocalNoun = $LocalNoun -replace ("$Verb" + '$')
            }
        }

        if ($FunctionToVerb.containskey($MKey)) {
            if ($FunctionToVerb[$MKey].containskey($Method)) {
                $Verb = $FunctionToVerb[$MKey][$Method]
            }
        }

        # Building the Parameter List
        $Parameters = @{}
        $Position   = 0

        if ($open.paths[$MKey].ContainsKey("parameters")) {
            Convert-Parameter -OpenApi $open.paths[$MKey]["parameters"]
        }
        Convert-Parameter -OpenApi $open.paths[$MKey][$Method]["parameters"]


        if ($open.paths[$MKey][$Method].ContainsKey("requestBody")) {
            $Parameters["Body"] = @{}
            $Parameters["Body"]["type"] = "HashTable"
        }

        # Target
        $Target = $MKey -replace "^$InitialTrim"
        $FunctionName = "$Verb-$ProjectName$LocalNoun"
        if ($FunctionRename.containskey($FunctionName)) {
            write-host " > FunctionRename [$Mkey] $FunctionName > $($FunctionRename[$FunctionName])"
            $FunctionName = $FunctionRename[$FunctionName]
        }

        if ($AllFunctions.containskey( $FunctionName)) {
            if($AllFunctions[ $FunctionName].containskey($Target)) {
                Write-host duplicated function found $MKey $LocalNoun -ForegroundColor yellow
            } else {
                $AllFunctions[ $FunctionName].add($Target, $Parameters)
            }
        } else {
            $AllFunctions[ $FunctionName] = @{ "$Target" = $Parameters }
        }
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
            Write-host " $F InAllFunctions : $($InAllFunctions -join ',') || $LGS"
        }
        # $InAllFunctions += ($LGS -split "/" | ? { $_ -match "{" }) -replace "{|}"
        # $InAllFunctions = $InAllFunctions | select -unique
        # if ($f -like "Get-GitHubReposActionsWorkflows") {
        #     Write-host " $F InAllFunctions : $($InAllFunctions -join ',')"
        # }

        foreach ($K in @($AllFunctions[$F].keys)) {
            if ($k -like $Lgs) {
                $FunctionPSN[$F][$k] = "Search"
            } else {
                $FunctionPSN[$F][$k] = $k.Substring($Lgs.length) -replace "{|}|/"
            }
            $PSN_ToAdd = @($AllFunctions[$F][$k].keys) | ? { $_ -notin $InAllFunctions }
            if ($f -like "Get-GitHubReposActionsWorkflows") {
                Write-host " ToChan : $($PSN_ToAdd -join ',')"
            }

            # Adding Extra parameters if wanted
            @($AdditionalParameters.keys) | ? { $AllFunctions[$F][$K].containskey($_) } | % {
                $Clone = [System.Management.Automation.PSSerializer]::Serialize($AdditionalParameters[$_])
                $AllFunctions[$F][$K] +=  [System.Management.Automation.PSSerializer]::Deserialize($Clone)
                if ($PSN_ToAdd.Contains($_)) { $PSN_ToAdd += @($AdditionalParameters[$_].keys) }
            }

            # Setting ParameterSetName
            foreach ($P in $PSN_ToAdd) {
                Write-host "$F|$k|$p"
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

    $InAllFunctions = $AllFunctions[$F].values.keys | group | ? { $_.count -like $Multiple } | select -ExpandProperty Name

    $AllParams = @()
    foreach ($p in $UniqueP.psbase.keys) {
        $String = ""
        $MPS = $false ; $LT = $null ; $MP = $false
        foreach ($T in ($UniqueP[$p])) {
            # $Types | % { $ShortT = $ShortT -replace ("^$ShortRemove") }
            if ( $AllFunctions[$F][$T][$p].containskey("Parameter") -and !$MP) {
                $String += "[Parameter(" +  ($AllFunctions[$F][$T][$p]["Parameter"] -join ",") + ")]"
                $MP = $true
            }

            if ( $AllFunctions[$F][$T][$p].containskey("ValidateSet") -and !$MPS) {
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
Write-Host Phase 5 : Exporting the module -foregroundcolor green

if ($Output) {
    $Module -join "`n"  | out-file $Output
}


return