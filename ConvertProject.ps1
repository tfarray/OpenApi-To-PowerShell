<#
.SYNOPSIS
This script converts OpenAPI specifications into PowerShell modules.

.DESCRIPTION
The script processes OpenAPI JSON files to generate PowerShell modules with cmdlets that correspond to the API endpoints. It supports customization of cmdlet names, parameter sets, and other module configurations.

.PARAMETER ProjectName
MANDATORY : The name of the project or API being converted. This is used to locate the OpenAPI JSON file and name the generated module.

.PARAMETER MultipleFiles
Indicates whether multiple JSON files should be processed. Those files needs to have the same naming : ie : MyModule_1,MyModule_Z, etc.

.PARAMETER BoolAsSwitch
Converts boolean parameters into PowerShell switches.

.PARAMETER Force
Forces overwriting of existing files without prompting.

.PARAMETER LastNounToVern
A hashtable mapping the last noun in a cmdlet name to a specific verb. For example, multiple API calls end with update, and Actionrefresh would be one of them. @{ refresh = 'Update' }, Will change the associated command from Set-ActionRefresh to Update-Action.

.PARAMETER FunctionRename
A hashtable for renaming generated functions. example : @{ "Get-MyFunction" = "Get-MyNewFunction" }.

.PARAMETER FunctionRenamePattern
A hashtable for renaming functions using patterns. example : @{ "MyStupidNamedFunction" = "MyNamedFunction" }. The word "Stupid" will be removed from the command name.

.PARAMETER FunctionNeverRequired
An array of parameter names that should never be marked as mandatory.

.PARAMETER AdditionalParameters
A hashtable of additional parameters to include in ALL the generated cmdlets.

.PARAMETER DescriptionToVerb
A hashtable mapping descriptions to specific verbs for cmdlet naming.

.PARAMETER OutPath
Specifies the output path for the generated module.

.PARAMETER GenerateMainModule
Generates a main module file (.psm1) for the project.

.PARAMETER MainProtocol
Specifies the default protocol (e.g., "https") for the API.

.EXAMPLE
$Variables = @{
    ProjectName           = "MyP1"
    FunctionRenamePattern =  @{ "MyP1ApiSubF" = "MyP1" }
    # Get-MyP1ApiSubFPing
    # New-MyP1ApiDascodeHostDecommhost
    FunctionRename = @{
        "Get-MyP1ApiSubFPing" = "Test-MyP1API"
        "New-MyP1ApiSubFHostDecommhost" = "Remove-MyP1Host"
        "New-MyP1HostRemovefrombundle" = "Remove-MyP1HostFromBundle"
        "New-MyP1ApiStorageRemovefrombundle" = "Remove-StorageFromBundle"
        "New-MyP1HostRemovefrombundleProj" = "Remove-MyP1HostFromBundle"
    }
}
.\ConvertProject.ps1 @Variables

# As no output was mentioned, files will be created in .\output
# <ProjectName> : This will search for a file called MyP1.json as input from the folder .\Projects
# <FunctionRenamePattern> : Any command such as Get-MyP1ApiSubF will be renamed Get-MyP1. Same for all the other commands beneth



.EXAMPLE
$Variables = @{
    ProjectName = "GitHub"
    LastNounToVern = @{
        disable    = "Disable"
        enable     = "Enable"
    }
    FunctionRename = @{
        "New-GitHubReposActionsWorkflowsDispatches"   = "Start-GitHubReposActionsWorkflows"
    }
    AdditionalParameters = @{
        page = @{ GetAll = @{ Type = "Switch"  ; Parameter = @() }}
    }
    BoolAsSwitch = $true
}
.\ConvertProject.ps1 @Variables

After Downloading GitHub OpenApi Json Specification to GitHub.json
<LastNounToVern> : any API call ending with disable will be renamed. Originally, you would have this command : Set-GitHubSomethingDisable. Using this command, you will have Disable-GitHubSomething instead.
<FunctionRename> : The command New-GitHubReposActionsWorkflowsDispatches will be renamed Start-GitHubReposActionsWorkflows.
<AdditionalParameters> : Each time a command has a parameter <page>, another parameter called <GetAll> will also be added. This parameter will need to get processed in the .ps1m module manually, but as outcome, you will have to write this only once for all the commands that have multiple pages. This .psm1 file is in the git repoisitory if you want to have a look at it.

.NOTES
Author: OpenApi-To-PowerShell
Version: 1.0
#>
[CmdletBinding(DefaultParameterSetName='None')]
param(
    [Parameter(Mandatory,Position=0)][string]$ProjectName,
    [switch]$MultipleFiles,
    [switch]$BoolAsSwitch,
    [switch]$Force,
    [hashtable]$LastNounToVern = @{},
    [hashtable]$FunctionRename = @{},
    [System.Collections.Specialized.OrderedDictionary]$FunctionRenamePattern = @{},
    [hashtable]$AdditionalParameters = @{},
    [hashtable]$DescriptionToVerb = @{},
    [string[]]$FunctionNeverRequired = @(),
    [string[]]$FunctionNeverAdded = @(),
    [String]$OutPath,
    [Parameter(ParameterSetName='ps1m')][switch]$GenerateMainModule,
    [string]$MainProtocol = "https"
    # [Parameter(ParameterSetName='ps1m')][switch]$GenerateMainModule,

)
$error.clear()


###############
# Working on initial path and Loading the json file
###############
$ScriptPath   = split-path -parent $MyInvocation.MyCommand.Definition


$Files = @{
    JsonPath     = $ScriptPath + "\Projects\$ProjectName.json"
    TemplateFile = $ScriptPath + "\Template\Template.psm1"
    psm1File     = $ScriptPath + "\Output\$ProjectName.psm1"
    psd1File     = $ScriptPath + "\Output\$ProjectName.psd1"
    Output       = $ScriptPath + "\Output\$ProjectName.ps1"
}
if ($MultipleFiles) {
    $Files.JsonPath =$ScriptPath + "\Projects\$ProjectName*.json"
}

if ($OutPath) {
    $Files.Output      = ($OutPath + "\$ProjectName.ps1") -replace  "\\\\","\"
}

# Validate JSON file(s) exist
if ($MultipleFiles) {
    $jsonFiles = @(Get-Item $Files.JsonPath -ErrorAction SilentlyContinue)
    if ($jsonFiles.Count -eq 0) {
        Write-Host "No JSON files found matching pattern: $($Files.JsonPath)" -ForegroundColor red
        return
    }
    Write-Host "Found $($jsonFiles.Count) JSON file(s) to process" -ForegroundColor Cyan
} elseif (!(Test-Path $Files.JsonPath)) {
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

if ($GenerateMainModule) {
    if ((test-path $files.psm1File) -and !$force) {
        $R = Read-Host "The file $($files.psm1File) exists, if you type ""yes"" the file will be overwritten. Any other command will exit the script. Type ""Yes"" to rebuild the existing file"
        if ($R -notlike "yes") { return }
    }

    $psm1 = Get-content  $files.TemplateFile
    $Open = $AllOpen | ? { $_.ContainsKey("host") } | select -first 1
    if (!$open) { $open = $AllOpen | ? { $_.ContainsKey("servers") } | select -first 1 }
    if (!$open) { $open = $AllOpen | select -first 1 }
    if ($open.ContainsKey("host")) {
        $EndPoints = @($open.item("host"))
        $MainProtocol = "https"
    } else {
        $URLInfo = ($open | % { $_.servers | ? { $_.containskey("url") } })
        $EndPoints  = $URLInfo.url -replace "^https?://"
        $MainProtocol =  $URLInfo.url -replace "://.*" | select -first 1
    }
    $psm1 = $psm1 -replace "!Project!",$ProjectName
    $psm1 = $psm1 -replace "!MainEndPoint!",($EndPoints | select -first 1)
    $psm1 = $psm1 -replace "!EndPoints!",($EndPoints -join "','")
    $psm1 = $psm1 -replace "!Protocol!",$MainProtocol
    # $psm1 = $psm1 -replace "!AllURL!",
    $psm1 = $psm1 -replace "!ConvertAutomaticVariables!",""
    $psm1 | out-file  $files.psm1File -force

    if (test-path $files.psd1File) {
        remove-item $files.psd1File -force | out-null
        write-host "Removing psd1 previous psd1 file" -ForegroundColor DarkCyan
    }
    New-ModuleManifest -Path $files.psd1File -Author OpenApi-To-PowerShell -NestedModules "$ProjectName.ps1" -CmdletsToExport * -FunctionsToExport * -VariablesToExport * -AliasesToExport * -RootModule  "$ProjectName.psm1"
}


###########################################
# Recursive function to replace all references to the target values
###########################################
function Replace-References {
    param(
        [string[]]$kpath,
        $Target
    )
    # write-host $Kpath
    $Target = $Open
    $kpath | % {
        $LastTarget = $Target
        $LastKey    = "$_"
        $Target     = $Target["$_"]

    }

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
            $Target['$ref'] -replace '^#/' -split "/" | ? {
                $RefTarget["$_"]
            } | % { $RefTarget = $RefTarget["$_"] }
            $LastTarget["$LastKey"] = $RefTarget
        }
        @($Target.keys) | % {
            Replace-References -kpath ($kpath + $_)
        }
    }
}

foreach ($Open in $AllOpen) { Replace-References paths }

###########################################
# Iterative function that replaces schema references to its definition
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
            if ($Target -is [hashtable] -and $Target.containsKey("requestBody")) {
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
                                    # Write-host $key $Method $NewParam
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
        $PDetail,
        $Name
    )
    $Parameter = @()
    # write-host ($PDetail | out-string)
    switch (@($PDetail.psbase.keys)) {
        required {
            if ($PDetail["required"] -and $name -notin $FunctionNeverRequired) { # This is because required might be false
                $Parameter += "Mandatory"
                $Parameter += "Position=$($global:Position)"
                $global:Position++
            }
        }
        enum {
            $Parameters[$name]["ValidateSet"] = $PDetail["enum"]
        }
        format {
            $Parameters[$name]["ValidateScript"] = $ValidateScript[$PDetail["format"]]
        }
        "in" {
            $Parameters[$name]["In"] = $PDetail["in"]
        }
    }
    if ($Parameter) {
        $Parameters[$name]["Parameter"] += @($Parameter)
    }
    if ($PDetail.contains("type")) {
        if ($PDetail.type -like "array") {
            if ($PDetail.contains("items")) {
                $Parameters[$name]["Type"] =  (Convert-Type $PDetail."items"."type") + "[]"
            } else {
                $Parameters[$name]["Type"] = "PsObject[]"
            }
        } elseif ($PDetail.contains("type") -and $PDetail.type ) {
            $Parameters[$name]["Type"] = Convert-Type $PDetail."type"
        }
    }
    return $parameter
}

Function Convert-Parameter {
    param(
        $OpenApiParameters
    )
    foreach ($FParam in ($OpenApiParameters | ? { $_.name -notin $FunctionNeverAdded })) {
        if ($FParam.in -like "body" -and $FParam.schema) {
            $Parameters[$FParam.name] = @{}
            $Parameters[$FParam.name]["Type"] = "HashTable"
        } else {
            $Name = $FParam.name
            $Parameters[$name] = @{}

            $Parameter  += Convert-ParameterDetails $FParam $Name

            if ( $FParam.contains("schema")) {
                $Parameter  += Convert-ParameterDetails $FParam."schema" $Name
            }
        }
    }
}


Function Convert-Type {
    [CmdletBinding()]
	param (
        [parameter(Position = 0)][string]$Type
    )
    process {
        switch -regex ($Type) {
            "^map"        { return "HashTable" }
            "^string$"    { return "String" }
            "^integer$"   { return "int" }
            "^number$"    { return "int" }
            "^boolean$"   { if ($BoolAsSwitch) { return "switch" } else { return "bool" } }
            "^file$"      { return "System.IO.FileInfo" }
            "^object$"    { return "HashTable" }
            "^date-time$" { return "DateTime" }
            default     { return "PsObject" }
        }
    }
}



###############
# Other Initial parameters
###############
# $InitialTrim = Get-LongestCommonString $Open.paths.keys
$indent = " " * 4  # Indentation for generated code

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
$WriteCommand = "Set","New","Update"


$ValidateScript = @{
    "uuid" = " $_ -as [guid]"
}

#
$AutomaticVariables = @(
    "args","ConsoleFileName","EnabledExperimentalFeatures","Error","Event","EventArgs","EventSubscriber","ExecutionContext","false","foreach","HOME","Host","input","IsCoreCLR","IsLinux","IsMacOS","IsWindows","LASTEXITCODE","Matches","MyInvocation","NestedPromptLevel","null","PID","PROFILE","PSBoundParameters","PSCmdlet","PSCommandPath","PSCulture","PSDebugContext","PSEdition","PSHOME","PSItem","PSScriptRoot","PSSenderInfo","PSUICulture","PSVersionTable","PWD","Sender","ShellId","StackTrace","switch","this","true") | group -AsHashTable

$FunctionToVerb            = @{}
$SchemaConversion          = @{}
$ConvertAutomaticVariables = @{}



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
                if ($LastNounToVern[$LastNoun] -is [hashtable]) {
                    if ($Method -like $LastNounToVern[$LastNoun]["Method"]) {
                        $Verb = $LastNounToVern[$LastNoun]["Verb"]
                    } else {
                        $LocalNoun = $OriginalNoun
                    }
                } else {
                    $Verb = $LastNounToVern[$LastNoun]
                }
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

            $Target = "$MKey"
            $FunctionName = "$Verb-$ProjectName$LocalNoun"

            if ($FunctionRename.containskey($FunctionName)) {
                $FunctionName = $FunctionRename[$FunctionName]
            }

            if ($FunctionRenamePattern) {
                @($FunctionRenamePattern.psbase.keys) | % {
                    Write-host " > Converting $FunctionName" -NoNewline
                    $FunctionName = $FunctionName -replace "$_",($FunctionRenamePattern[$_])
                    Write-host " >> $FunctionName"
                }
            }



            ###########################
            # Computing parameters of the function
            ###########################
            $Parameters = @{}
            $global:Position   = 0
            # $Parameter  = @()

            if ($open.paths[$MKey].ContainsKey("parameters")) {
                Convert-Parameter -OpenApi $open.paths[$MKey]["parameters"]
            }
            Convert-Parameter -OpenApi $open.paths[$MKey][$Method]["parameters"]

            if ($AllFunctions.containskey( $FunctionName)) {
                if($AllFunctions[$FunctionName].containskey($Target)) {
                    Write-host duplicated function found $MKey $LocalNoun -ForegroundColor yellow
                } else {
                    $AllFunctions[$FunctionName].add($Target, $Parameters)
                }
            } else {
                $AllFunctions[$FunctionName] = @{ "$Target" = $Parameters }
            }

             # Note : This shouldn't do anything as we reset the parameter below
             if ($open.paths[$MKey][$Method].ContainsKey("requestBody")) {
                $Parameters["Body"] = @{}
                $Parameters["Body"]["type"] = "HashTable"
            }
        }

    }
}

###########
# Fixes/small tweaks :
#  - excluding parameters that are already in query for another path
# Issue First seen in JiraAlign API
###########
foreach ($F in @($AllFunctions.psbase.keys)) {

    # Excluding parameters that are elsewhere in the path
    $PresentIn = @()
    $ToExclude = @()
    if ($AllFunctions[$F].count -gt 1) {
        foreach ($K in @($AllFunctions[$F].psbase.keys)) {
            foreach ($P in @($AllFunctions[$F][$K].psbase.keys)) {
                if ($AllFunctions[$F][$K][$P]["in"] -like "path") {
                    $PresentIn += $k
                    $ToExclude += $p
                }
            }
        }

        if ($ToExclude.count) {
            foreach ($K in (@($AllFunctions[$F].psbase.keys) | ? { $_ -notin $PresentIn })) {
                $ToExclude | ? { $AllFunctions[$F][$K].containskey($_)} | %{

                    $AllFunctions[$F][$K].remove($_)
                }
            }
        }
    }

    foreach ($K in @($AllFunctions[$F].psbase.keys)) {
        @($AdditionalParameters.keys) | ? { $AllFunctions[$F][$K].containskey($_) } | % {
            $Serialize   = [System.Management.Automation.PSSerializer]::Serialize($AdditionalParameters[$_])
            $Deserialize = [System.Management.Automation.PSSerializer]::Deserialize($Serialize)

            foreach ($d in @($Deserialize.psbase.keys)) {
                if (!$AllFunctions[$F][$K].ContainsKey($d)) {
                    $AllFunctions[$F][$K][$d] = $Deserialize[$d]
                }
            }
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


        foreach ($K in @($AllFunctions[$F].psbase.keys)) {
            $PSN_ToAdd = @()
            if ($k -like $Lgs) {
                $FunctionPSN[$F][$k] = "Search"
            } else {
                $FunctionPSN[$F][$k] = $k.Substring($Lgs.length) -replace "{|}|/"
            }
            $PSN_ToAdd += @($AllFunctions[$F][$k].psbase.keys) | ? { $_ -notin $InAllFunctions }

            # Setting ParameterSetName
            foreach ($P in $PSN_ToAdd) {
                # Write-host "$F|$k|$p -- "
                $AllFunctions[$F][$k][$P]["Parameter"] += "ParameterSetName='$($FunctionPSN[$F][$k])'"
            }
        }
    }
}

###########
# Fixes/small tweaks :
#  - Built-in protected variables
#  - Adding AdditionalParameters
###########
foreach ($F in @($AllFunctions.psbase.keys)) {
    # Replacing AutomaticVariables Powershell Variables
    foreach ($K in @($AllFunctions[$F].psbase.keys)) {
        @($AllFunctions[$F][$k].psbase.keys) | % {
            if ($AutomaticVariables.ContainsKey($_)) {
                $NewName = $_
                while ($NewName -in @($AllFunctions[$F][$k].psbase.keys)) {
                     $NewName += "X"
                }
                $AllFunctions[$F][$k].add($NewName,$AllFunctions[$F][$k][$_])
                $AllFunctions[$F][$k].Remove($_)
                if ($ConvertAutomaticVariables.ContainsKey("$F;$k")) {
                    $ConvertAutomaticVariables["$F;$k"].Add($NewName,$_)
                } else {
                    $ConvertAutomaticVariables["$F;$k"] = @{ $NewName = $_ }
                }
                Write-host " > [$F][$K] replacing $_ >> $NewName"
                ### To Do add ConvertAutomaticVariables to the module configuration
                ### To Do add in the invoke the replacement of the variables
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
        $Function += $indent + "[CmdletBinding(DefaultParameterSetName='Search')]"
    } else {
        $Function += $indent + "[CmdletBinding()]"
    }

    $UniqueP = @{}
    foreach ($key in @($AllFunctions[$F].psbase.keys)) {
        $AllFunctions[$F][$key].psbase.keys | % {
            $UniqueP[$_] += @($key)
        }
    }

    $InAllFunctions = $AllFunctions[$F].values.keys | group | ? { $_.count -like  $AllFunctions[$F].count       } | select -ExpandProperty Name

    $AllParams = @()
    foreach ($paramName in $UniqueP.psbase.keys) {
        $paramString = ""
        $hasValidateSet = $false
        $paramType = $null
        $isInAllFunctions = $InAllFunctions -contains "$paramName"
        
        foreach ($targetPath in ($UniqueP[$paramName])) {
            $paramDetails = $AllFunctions[$F][$targetPath][$paramName]
            
            if ($paramDetails.containskey("Parameter")) {
                if ($InAllFunctions -notcontains $paramName) {
                    if ($isInAllFunctions) { $paramString += "`n" + $indent*2 } else { $isInAllFunctions = $true }
                    $paramString += "[Parameter(" + ($paramDetails["Parameter"] -join ",") + ")]"
                } elseif ($isInAllFunctions) {
                    $paramString += "[Parameter(" + ($paramDetails["Parameter"] -join ",") + ")]"
                    $isInAllFunctions = $false
                }
            }

            if ($paramDetails.containskey("ValidateSet") -and !$hasValidateSet) {
                $paramString += "[ValidateSet('$($paramDetails["ValidateSet"] -join ''',''')')]"
                $hasValidateSet = $true
            }

            if ($paramDetails.containskey("type") -and !$paramType) {
                $paramType = '[' + $paramDetails["type"] + "]"
            }
        }
        $paramString += $paramType + ('$' + ($paramName -replace ' |-|\$'))
        $AllParams += $indent*2 + $paramString
    }

    if ($AllParams) {
        $Function += $indent + "param ("
        $Function += ($AllParams | sort) -join ",`n"
        $Function += $indent + ")"
    } else {
        $Function += ($indent + "param ( )")
    }

    if ($AllFunctions[$F].count -gt 1) {
        $Function += $indent + "Switch (`$PsCmdlet.ParameterSetName) {"
    }

    # Process each API path for this function
    @($AllFunctions[$F].keys) | % {
        $currentPath = $_
        $queryParametersArg = ""
        
        # For write commands, identify query parameters
        if (($F -replace "-.*") -in $WriteCommand) {
            $queryParams = @($AllFunctions[$F][$currentPath].keys) | Where-Object {
                $AllFunctions[$F][$currentPath][$_]["in"] -like "query"
            }
            if ($queryParams) { 
                $queryParametersArg = '-InQuery "' + ($queryParams -join '","') + '"' 
            }
        }

        if ($AllFunctions[$F].count -gt 1) {
            $Function += $indent*2 + "'$($FunctionPSN[$F][$currentPath])' { Invoke-$ProjectName -PsBP `$PsBoundParameters '$currentPath' $queryParametersArg} "
        } else {
            $Function += $indent + "Invoke-$ProjectName -PsBP `$PsBoundParameters '$currentPath' $queryParametersArg"
        }
    }
    if ($AllFunctions[$F].count -gt 1) { $Function += $indent + "}" }
    $Function += "}"
    $Function += "Export-ModuleMember $F"

    $Module += ($Function -join "`n") + "`n"
}

Write-Host Phase 4 : Adding Meta Data -foregroundcolor green
# Adding the Schema conversion when there is one
if ($SchemaConversion.count) {
    $Module += '$Schema = '''
    $Module +=  ($SchemaConversion | ConvertTo-Json -Depth 10) + "' | convertfrom-Json -Depth 10"
}

# Adding the conversion of Automatic Variables
if ($ConvertAutomaticVariables.count) {
    $Module += '$ConvertAutomaticVariables' + $ProjectName + ' = (''' + ($ConvertAutomaticVariables | ConvertTo-Json -Compress) + ''') | convertfrom-Json -AsHashtable'
}


###########
# Converting the module to a .ps1 file
###########
Write-Host Phase 5 : Exporting the module to $Files.Output -foregroundcolor green

if ($Files.Output) {
    $Module -join "`n"  | out-file $Files.Output
}

# Exit successfully
exit 0