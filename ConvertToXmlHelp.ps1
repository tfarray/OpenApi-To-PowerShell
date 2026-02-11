<#
.SYNOPSIS
Generates PowerShell XML help files (MAML format) from OpenAPI specifications.

.DESCRIPTION
This script processes OpenAPI JSON files to generate MAML-formatted XML help files that can be used
with PowerShell's Get-Help cmdlet. It extracts summaries, descriptions, parameters, and examples
from the OpenAPI specification and formats them according to PowerShell help standards.

Requires PowerShell 7.0 or later.

.PARAMETER ProjectName
MANDATORY: The name of the project or API. This is used to locate the OpenAPI JSON file.

.PARAMETER MultipleFiles
Indicates whether multiple JSON files should be processed (files named MyModule_1, MyModule_2, etc.)

.PARAMETER OutPath
Specifies the output path for the generated XML help file.

.PARAMETER LastNounToVern
A hashtable mapping the last noun in a cmdlet name to a specific verb (must match ConvertProject.ps1 settings).

.PARAMETER FunctionRename
A hashtable for renaming generated functions (must match ConvertProject.ps1 settings).

.PARAMETER FunctionRenamePattern
A hashtable for renaming functions using patterns (must match ConvertProject.ps1 settings).

.PARAMETER ModuleVersion
Version number for the module. Default: "1.0.0"

.PARAMETER Culture
The culture/language code for the help file. Default: "en-US"

.PARAMETER AdditionalParameters
A hashtable of additional parameters included in generated cmdlets (from ConvertProject.ps1).
These won't have descriptions from OpenAPI. Use AdditionalParameterDescriptions for help text.

.PARAMETER AdditionalParameterDescriptions
A hashtable providing descriptions for additional parameters that aren't in the OpenAPI spec.
Example: @{ GetAll = "Retrieves all pages of results automatically" }

.EXAMPLE
$Variables = @{
    ProjectName = "GitHub"
    LastNounToVern = @{
        disable = "Disable"
        enable  = "Enable"
    }
    FunctionRename = @{
        "New-GitHubReposActionsWorkflowsDispatches" = "Start-GitHubReposActionsWorkflows"
    }
}
.\ConvertToXmlHelp.ps1 @Variables

.NOTES
Author: OpenApi-To-PowerShell
Version: 1.0
Generates MAML (Microsoft Assistance Markup Language) XML format
#>

#Requires -Version 7.0

[CmdletBinding()]
param(
    [Parameter(Mandatory, Position=0)]
    [string]$ProjectName,
    
    [switch]$MultipleFiles,
    
    [hashtable]$LastNounToVern = @{},
    
    [hashtable]$FunctionRename = @{},
    
    [System.Collections.Specialized.OrderedDictionary]$FunctionRenamePattern = @{},
    
    [hashtable]$DescriptionToVerb = @{},
    
    [string]$OutPath,
    
    [string]$ModuleVersion = "1.0.0",
    
    [string]$Culture = "en-US",
    
    [hashtable]$AdditionalParameters = @{},
    
    [hashtable]$AdditionalParameterDescriptions = @{}
)

$ErrorActionPreference = "Stop"
$error.clear()

###############
# Initialize Paths
###############
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$Files = @{
    JsonPath = "$ScriptPath\Projects\$ProjectName.json"
    Output   = "$ScriptPath\Output\$Culture\$ProjectName-Help.xml"
}

if ($MultipleFiles) {
    $Files.JsonPath = "$ScriptPath\Projects\$ProjectName*.json"
}

if ($OutPath) {
    $Files.Output = ($OutPath + "\$Culture\$ProjectName-Help.xml") -replace "\\\\", "\"
}

# Ensure output directory exists
$outputDir = Split-Path -Parent $Files.Output
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

###############
# Load OpenAPI JSON
###############
if (!(Test-Path $Files.JsonPath)) {
    Write-Error "The file $($Files.JsonPath) does not exist"
    return
}

$AllOpen = Get-Item $Files.JsonPath | ForEach-Object { 
    $_ | Get-Content | ConvertFrom-Json -Depth 50 -AsHashtable 
}

if (!$AllOpen) {
    Write-Error "Unable to ConvertFrom-Json the file $($Files.JsonPath)"
    return
}

###############
# Mapping Variables (same as ConvertProject.ps1)
###############
$MethodToVerb = @{
    "get"    = "Get"
    "post"   = "New"
    "put"    = "Set"
    "delete" = "Remove"
    "patch"  = "Update"
}

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

###############
# Helper Functions
###############
Function Get-LongestCommonString {
    param([string[]]$Strings)
    
    $Ans = $Strings | Select-Object -First 1
    $Strings | Select-Object -Skip 1 | ForEach-Object {
        for ($l = [math]::Min($Ans.length, $_.length); $l -ge 1; $l--) {
            if ($Ans.substring(0, $l) -like $_.substring(0, $l)) {
                $Ans = $Ans.substring(0, $l)
                break
            }
        }
    }
    return $Ans
}

Function Convert-Type {
    param([string]$Type)
    
    switch -regex ($Type) {
        "^map"        { return "Hashtable" }
        "^string$"    { return "String" }
        "^integer$"   { return "Int32" }
        "^number$"    { return "Int32" }
        "^boolean$"   { return "Boolean" }
        "^file$"      { return "String (FilePath)" }
        "^object$"    { return "Hashtable" }
        "^date-time$" { return "DateTime" }
        "^array$"     { return "Array" }
        default       { return "Object" }
    }
}

Function New-XmlElement {
    param(
        [string]$Name,
        [string]$Content,
        [hashtable]$Attributes = @{}
    )
    
    $attrStr = ""
    foreach ($key in $Attributes.Keys) {
        $attrStr += " $key=`"$($Attributes[$key])`""
    }
    
    if ($Content) {
        $escapedContent = [System.Security.SecurityElement]::Escape($Content)
        return "  <$Name$attrStr>$escapedContent</$Name>"
    } else {
        return "  <$Name$attrStr />"
    }
}

Function Get-ParameterType {
    param($ParamDetails)
    
    if ($ParamDetails.type -eq "array") {
        if ($ParamDetails.items.type) {
            return (Convert-Type $ParamDetails.items.type) + "[]"
        }
        return "Array"
    }
    
    if ($ParamDetails.type) {
        return Convert-Type $ParamDetails.type
    }
    
    return "Object"
}

###############
# Build Function Name (same logic as ConvertProject.ps1)
###############
Function Get-FunctionName {
    param(
        [string]$Path,
        [string]$Method,
        [hashtable]$PathData
    )
    
    # Build Noun
    $Noun = $Path -replace "^/|/\{.*?\}|_|-|/$"
    $Noun = ($Noun -split "/" | Where-Object { $_ } | ForEach-Object {
        $_.substring(0,1).toupper() + $_.substring(1).tolower()
    })
    
    $LastNoun = $Noun | Select-Object -Last 1
    $OriginalNoun = $Noun -join ""
    
    if ($LastNoun -and $LastNounToVern.containskey($LastNoun)) {
        $Noun = $Noun | Select-Object -SkipLast 1
    }
    $Noun = $Noun -join ""
    
    # Build Verb
    $LocalNoun = $Noun
    $Verb = $MethodToVerb[$Method]
    
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
    
    if ($Method -and $DescriptionToVerb.containskey($Method)) {
        $FirstWord = $PathData[$Method].summary -split "\s" | Select-Object -First 1
        if ($FirstWord -and $DescriptionToVerb[$Method].containskey($FirstWord)) {
            $Verb = $DescriptionToVerb[$Method][$FirstWord]
            $LocalNoun = $LocalNoun -replace ("$Verb" + '$')
        }
    }
    
    $FunctionName = "$Verb-$ProjectName$LocalNoun"
    
    # Apply renames
    if ($FunctionRename.containskey($FunctionName)) {
        $FunctionName = $FunctionRename[$FunctionName]
    }
    
    if ($FunctionRenamePattern) {
        @($FunctionRenamePattern.psbase.keys) | ForEach-Object {
            $FunctionName = $FunctionName -replace "$_", ($FunctionRenamePattern[$_])
        }
    }
    
    return $FunctionName
}

###############
# Generate MAML XML Content
###############
Write-Host "Phase 1: Parsing OpenAPI specifications..." -ForegroundColor Green

$AllCommands = @{}

foreach ($Open in $AllOpen) {
    foreach ($PathKey in (@($open.paths.psbase.keys) | Sort-Object)) {
        $PathData = $open.paths[$PathKey]
        
        foreach ($Method in (@($PathData.psbase.keys) | Where-Object { $_ -in @($MethodToVerb.keys) } | Sort-Object)) {
            $MethodData = $PathData[$Method]
            
            # Get function name using same logic as ConvertProject.ps1
            $FunctionName = Get-FunctionName -Path $PathKey -Method $Method -PathData $PathData
            
            # Build command info
            $CommandInfo = @{
                Name        = $FunctionName
                Synopsis    = $MethodData.summary
                Description = $MethodData.description
                Parameters  = @()
                Examples    = @()
                Path        = $PathKey
                Method      = $Method.ToUpper()
                Tags        = $MethodData.tags
            }
            
            # Process parameters from OpenAPI
            if ($MethodData.parameters) {
                foreach ($param in $MethodData.parameters) {
                    # Skip parameters with no name
                    if (-not $param.name) {
                        continue
                    }
                    
                    $paramInfo = @{
                        Name          = $param.name
                        Type          = Get-ParameterType ($param.schema ? $param.schema : $param)
                        Required      = $param.required ? $param.required : $false
                        Description   = $param.description
                        Position      = "Named"
                        PipelineInput = $false
                    }
                    
                    $CommandInfo.Parameters += $paramInfo
                }
            }
            
            # Add additional parameters if this command has any qualifying base parameters
            if ($AdditionalParameters.Count -gt 0 -and $MethodData.parameters) {
                foreach ($baseParam in $MethodData.parameters) {
                    if ($baseParam.name -and $AdditionalParameters.ContainsKey($baseParam.name)) {
                        foreach ($additionalParamName in $AdditionalParameters[$baseParam.name].Keys) {
                            $additionalParam = $AdditionalParameters[$baseParam.name][$additionalParamName]
                            
                            $description = "Additional parameter"
                            if ($additionalParamName -and $AdditionalParameterDescriptions.ContainsKey($additionalParamName)) {
                                $description = $AdditionalParameterDescriptions[$additionalParamName]
                            }
                            
                            $paramInfo = @{
                                Name          = $additionalParamName
                                Type          = $additionalParam.Type ? $additionalParam.Type : "Object"
                                Required      = $false
                                Description = $description
                                Position    = "Named"
                                PipelineInput = $false
                            }
                            
                            $CommandInfo.Parameters += $paramInfo
                        }
                    }
                }
            }
            
            # Extract examples from externalDocs if available
            if ($MethodData.externalDocs) {
                $CommandInfo.Examples += @{
                    Title = "Example 1"
                    Code  = "$FunctionName"
                    Remarks = "See documentation: $($MethodData.externalDocs.url)"
                }
            }
            
            $AllCommands[$FunctionName] = $CommandInfo
        }
    }
}

Write-Host "Phase 2: Generating MAML XML..." -ForegroundColor Green

###############
# Generate MAML XML
###############
$xml = @()
$xml += '<?xml version="1.0" encoding="utf-8"?>'
$xml += '<helpItems schema="maml" xmlns="http://msh">'

foreach ($cmdName in ($AllCommands.Keys | Sort-Object)) {
    $cmd = $AllCommands[$cmdName]
    
    $xml += ''
    $xml += '  <command:command xmlns:maml="http://schemas.microsoft.com/maml/2004/10" xmlns:command="http://schemas.microsoft.com/maml/dev/command/2004/10" xmlns:dev="http://schemas.microsoft.com/maml/dev/2004/10" xmlns:MSHelp="http://msdn.microsoft.com/mshelp">'
    
    # Command details
    $xml += '    <command:details>'
    $xml += "      <command:name>$cmdName</command:name>"
    $xml += "      <command:verb>$($cmdName -replace '-.*')</command:verb>"
    $xml += "      <command:noun>$($cmdName -replace '.*?-')</command:noun>"
    $xml += '      <maml:description>'
    if ($cmd.Synopsis) {
        $xml += "        <maml:para>$([System.Security.SecurityElement]::Escape($cmd.Synopsis))</maml:para>"
    }
    $xml += '      </maml:description>'
    $xml += '    </command:details>'
    
    # Description
    $xml += '    <maml:description>'
    if ($cmd.Description) {
        # Keep newlines as separate paragraphs but skip empty lines
        $descLines = $cmd.Description -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ }
        foreach ($line in $descLines) {
            $xml += "      <maml:para>$([System.Security.SecurityElement]::Escape($line))</maml:para>"
        }
    } else {
        $xml += "      <maml:para>$([System.Security.SecurityElement]::Escape($cmd.Synopsis))</maml:para>"
    }
    $xml += "      <maml:para></maml:para>"
    $xml += "      <maml:para>API Endpoint: $($cmd.Method) $($cmd.Path)</maml:para>"
    $xml += '    </maml:description>'
    
    # Syntax
    $xml += '    <command:syntax>'
    $xml += "      <command:syntaxItem>"
    $xml += "        <maml:name>$cmdName</maml:name>"
    
    foreach ($param in $cmd.Parameters) {
        $xml += '        <command:parameter required="' + ($param.Required ? 'true' : 'false') + '" position="' + $param.Position + '">'
        $xml += "          <maml:name>$($param.Name)</maml:name>"
        $xml += '          <maml:description>'
        if ($param.Description) {
            $xml += "            <maml:para>$([System.Security.SecurityElement]::Escape($param.Description))</maml:para>"
        }
        $xml += '          </maml:description>'
        $xml += "          <command:parameterValue required='true'>$($param.Type)</command:parameterValue>"
        $xml += '        </command:parameter>'
    }
    
    $xml += '      </command:syntaxItem>'
    $xml += '    </command:syntax>'
    
    # Parameters (detailed)
    $xml += '    <command:parameters>'
    foreach ($param in $cmd.Parameters) {
        $xml += '      <command:parameter required="' + ($param.Required ? 'true' : 'false') + '" position="' + $param.Position + '">'
        $xml += "        <maml:name>$($param.Name)</maml:name>"
        $xml += '        <maml:description>'
        if ($param.Description) {
            $xml += "          <maml:para>$([System.Security.SecurityElement]::Escape($param.Description))</maml:para>"
        }
        $xml += '        </maml:description>'
        $xml += "        <command:parameterValue required='true'>$($param.Type)</command:parameterValue>"
        $xml += '        <dev:type>'
        $xml += "          <maml:name>$($param.Type)</maml:name>"
        $xml += '          <maml:uri />'
        $xml += '        </dev:type>'
        $xml += '        <dev:defaultValue />'
        $xml += '      </command:parameter>'
    }
    $xml += '    </command:parameters>'
    
    # Input types
    $xml += '    <command:inputTypes>'
    $xml += '      <command:inputType>'
    $xml += '        <dev:type>'
    $xml += '          <maml:name>None</maml:name>'
    $xml += '        </dev:type>'
    $xml += '        <maml:description>'
    $xml += '          <maml:para>This cmdlet does not accept pipeline input.</maml:para>'
    $xml += '        </maml:description>'
    $xml += '      </command:inputType>'
    $xml += '    </command:inputTypes>'
    
    # Return types
    $xml += '    <command:returnValues>'
    $xml += '      <command:returnValue>'
    $xml += '        <dev:type>'
    $xml += '          <maml:name>Object</maml:name>'
    $xml += '        </dev:type>'
    $xml += '        <maml:description>'
    $xml += '          <maml:para>Returns API response as object.</maml:para>'
    $xml += '        </maml:description>'
    $xml += '      </command:returnValue>'
    $xml += '    </command:returnValues>'
    
    # Examples
    $xml += '    <command:examples>'
    if ($cmd.Examples.Count -gt 0) {
        $exampleNum = 1
        foreach ($example in $cmd.Examples) {
            $xml += '      <command:example>'
            $xml += "        <maml:title>Example $exampleNum</maml:title>"
            $xml += '        <dev:code>' + [System.Security.SecurityElement]::Escape($example.Code) + '</dev:code>'
            $xml += '        <dev:remarks>'
            $xml += "          <maml:para>$([System.Security.SecurityElement]::Escape($example.Remarks))</maml:para>"
            $xml += '        </dev:remarks>'
            $xml += '      </command:example>'
            $exampleNum++
        }
    } else {
        $xml += '      <command:example>'
        $xml += '        <maml:title>Example 1</maml:title>'
        $xml += "        <dev:code>$cmdName</dev:code>"
        $xml += '        <dev:remarks>'
        $xml += "          <maml:para>$([System.Security.SecurityElement]::Escape($cmd.Synopsis))</maml:para>"
        $xml += '        </dev:remarks>'
        $xml += '      </command:example>'
    }
    $xml += '    </command:examples>'
    
    # Related links
    $xml += '    <command:relatedLinks>'
    if ($cmd.Tags) {
        $xml += '      <maml:navigationLink>'
        $xml += "        <maml:linkText>Tags: $($cmd.Tags -join ', ')</maml:linkText>"
        $xml += '        <maml:uri />'
        $xml += '      </maml:navigationLink>'
    }
    $xml += '    </command:relatedLinks>'
    
    $xml += '  </command:command>'
}

$xml += '</helpItems>'

###############
# Write XML File
###############
Write-Host "Phase 3: Writing XML help file to $($Files.Output)..." -ForegroundColor Green

$xml -join "`n" | Out-File -FilePath $Files.Output -Encoding UTF8 -Force

Write-Host ""
Write-Host "Successfully generated XML help file!" -ForegroundColor Green
Write-Host "  File: $($Files.Output)" -ForegroundColor Cyan
Write-Host "  Commands: $($AllCommands.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "To use this help file:" -ForegroundColor Yellow
Write-Host "  1. Copy to module directory: <ModulePath>\$Culture\" -ForegroundColor Gray
Write-Host "  2. Test with: Get-Help <CommandName> -Full" -ForegroundColor Gray

if ($error.Count -gt 0) {
    Write-Host "`nWarnings/Errors encountered:" -ForegroundColor Yellow
    $error | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
}

# Exit successfully
exit 0
