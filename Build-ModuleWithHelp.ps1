# Build-ModuleWithHelp.ps1
# Complete workflow: Generate module code + XML help + validation

<#
.SYNOPSIS
Builds a complete PowerShell module from OpenAPI specification including XML help.

.DESCRIPTION
This script orchestrates the entire module build process:
1. Generates PowerShell module code from OpenAPI spec (ConvertProject.ps1)
2. Generates MAML XML help files (ConvertToXmlHelp.ps1)  
3. Validates the generated help file (Test-XmlHelp.ps1)
4. Optionally copies files to a target module directory

Requires PowerShell 7.0 or later.

.PARAMETER ProjectName
The name of the API/project (matches OpenAPI JSON filename)

.PARAMETER ModuleConfig
Hashtable containing all configuration parameters for both ConvertProject.ps1 and ConvertToXmlHelp.ps1

.PARAMETER DestinationPath
Optional path to copy the completed module files

.PARAMETER SkipValidation
Skip the help file validation step

.PARAMETER Force
Force overwrite existing files without prompting

.EXAMPLE
$config = @{
    ProjectName = "GitHub"
    GenerateMainModule = $true
    LastNounToVern = @{ disable = "Disable"; enable = "Enable" }
    FunctionRename = @{
        "New-GitHubReposActionsWorkflowsDispatches" = "Start-GitHubReposActionsWorkflows"
    }
}
.\Build-ModuleWithHelp.ps1 -ModuleConfig $config

.EXAMPLE
.\Build-ModuleWithHelp.ps1 -ProjectName "Cadmium" -DestinationPath "C:\Modules\Cadmium"

#>

#Requires -Version 7.0

[CmdletBinding()]
param(
    [Parameter(Mandatory, Position=0)]
    [string]$ProjectName,
    
    [hashtable]$ModuleConfig = @{},
    
    [string]$DestinationPath,
    
    [switch]$SkipValidation,
    
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Ensure ProjectName is in config
if (!$ModuleConfig.ContainsKey('ProjectName')) {
    $ModuleConfig['ProjectName'] = $ProjectName
}

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   PowerShell Module Builder with XML Help                 ║" -ForegroundColor Cyan
Write-Host "║   Project: $($ProjectName.PadRight(47)) ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$buildSteps = @(
    @{ Name = "Generate Module Code"; Script = "ConvertProject.ps1"; Required = $true }
    @{ Name = "Generate XML Help"; Script = "ConvertToXmlHelp.ps1"; Required = $true }
    @{ Name = "Validate Help File"; Script = "Test-XmlHelp.ps1"; Required = $false }
)

$results = @{
    Success = $true
    Steps = @()
    Errors = @()
}

# Step 1: Generate Module Code
try {
    Write-Host "[ 1/3 ] Generating PowerShell module code..." -ForegroundColor Yellow
    Write-Host "         Running: ConvertProject.ps1" -ForegroundColor Gray
    
    $convertScript = Join-Path $ScriptPath "ConvertProject.ps1"
    if (!(Test-Path $convertScript)) {
        throw "ConvertProject.ps1 not found at $convertScript"
    }
    
    # Filter parameters for ConvertProject.ps1 (exclude help-specific parameters)
    $convertParams = @{}
    $convertProjectValidParams = @('ProjectName', 'MultipleFiles', 'BoolAsSwitch', 'Force', 
                                   'LastNounToVern', 'FunctionRename', 'FunctionRenamePattern',
                                   'AdditionalParameters', 'DescriptionToVerb', 'FunctionNeverRequired',
                                   'FunctionNeverAdded', 'OutPath', 'GenerateMainModule', 'MainProtocol')
    foreach ($key in $ModuleConfig.Keys) {
        if ($key -in $convertProjectValidParams) {
            $convertParams[$key] = $ModuleConfig[$key]
        }
    }
    
    & $convertScript @convertParams
    
    if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
        throw "ConvertProject.ps1 failed with exit code $LASTEXITCODE"
    }
    
    Write-Host "         ✓ Module code generated" -ForegroundColor Green
    $results.Steps += @{ Step = 1; Name = "Module Code"; Status = "Success" }
    
} catch {
    Write-Host "         ❌ Failed to generate module code" -ForegroundColor Red
    Write-Host "         Error: $($_.Exception.Message)" -ForegroundColor Red
    $results.Success = $false
    $results.Errors += $_.Exception.Message
    $results.Steps += @{ Step = 1; Name = "Module Code"; Status = "Failed" }
}

# Step 2: Generate XML Help
if ($results.Success) {
    try {
        Write-Host "`n[ 2/3 ] Generating XML help file..." -ForegroundColor Yellow
        Write-Host "         Running: ConvertToXmlHelp.ps1" -ForegroundColor Gray
        
        $helpScript = Join-Path $ScriptPath "ConvertToXmlHelp.ps1"
        if (!(Test-Path $helpScript)) {
            throw "ConvertToXmlHelp.ps1 not found at $helpScript"
        }
        
        # Filter parameters for ConvertToXmlHelp.ps1 (exclude code-gen-specific parameters)
        $helpParams = @{}
        $convertHelpValidParams = @('ProjectName', 'MultipleFiles', 'LastNounToVern', 
                                   'FunctionRename', 'FunctionRenamePattern', 'DescriptionToVerb',
                                   'OutPath', 'ModuleVersion', 'Culture', 'AdditionalParameters',
                                   'AdditionalParameterDescriptions')
        foreach ($key in $ModuleConfig.Keys) {
            if ($key -in $convertHelpValidParams) {
                $helpParams[$key] = $ModuleConfig[$key]
            }
        }
        
        & $helpScript @helpParams
        
        if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
            throw "ConvertToXmlHelp.ps1 failed with exit code $LASTEXITCODE"
        }
        
        Write-Host "         ✓ XML help generated" -ForegroundColor Green
        $results.Steps += @{ Step = 2; Name = "XML Help"; Status = "Success" }
        
    } catch {
        Write-Host "         ❌ Failed to generate XML help" -ForegroundColor Red
        Write-Host "         Error: $($_.Exception.Message)" -ForegroundColor Red
        $results.Success = $false
        $results.Errors += $_.Exception.Message
        $results.Steps += @{ Step = 2; Name = "XML Help"; Status = "Failed" }
    }
}

# Step 3: Validate Help File
if ($results.Success -and !$SkipValidation) {
    try {
        Write-Host "`n[ 3/3 ] Validating XML help file..." -ForegroundColor Yellow
        Write-Host "         Running: Test-XmlHelp.ps1" -ForegroundColor Gray
        
        $testScript = Join-Path $ScriptPath "Test-XmlHelp.ps1"
        if (!(Test-Path $testScript)) {
            Write-Host "         ⚠ Test-XmlHelp.ps1 not found, skipping validation" -ForegroundColor Yellow
        } else {
            $culture = $ModuleConfig.ContainsKey('Culture') ? $ModuleConfig.Culture : 'en-US'
            $outPath = $ModuleConfig.ContainsKey('OutPath') ? $ModuleConfig.OutPath : "$ScriptPath\Output"
            $helpFile = "$outPath\$culture\$ProjectName-Help.xml"
            
            if (!(Test-Path $helpFile)) {
                throw "Help file not found at $helpFile"
            }
            
            $validationResult = & $testScript -HelpFilePath $helpFile
            
            if ($validationResult.Valid) {
                Write-Host "         ✓ Help file validated successfully" -ForegroundColor Green
                Write-Host "         Commands: $($validationResult.Commands), Parameters: $($validationResult.Parameters)" -ForegroundColor Gray
                $results.Steps += @{ Step = 3; Name = "Validation"; Status = "Success" }
            } else {
                Write-Host "         ⚠ Help file has warnings ($($validationResult.Warnings) warnings)" -ForegroundColor Yellow
                $results.Steps += @{ Step = 3; Name = "Validation"; Status = "Warning" }
            }
        }
        
    } catch {
        Write-Host "         ⚠ Validation failed: $($_.Exception.Message)" -ForegroundColor Yellow
        $results.Steps += @{ Step = 3; Name = "Validation"; Status = "Warning" }
    }
} elseif ($SkipValidation) {
    Write-Host "`n[ 3/3 ] Validation skipped (-SkipValidation)" -ForegroundColor Gray
    $results.Steps += @{ Step = 3; Name = "Validation"; Status = "Skipped" }
}

# Copy to destination if specified
if ($results.Success -and $DestinationPath) {
    try {
        Write-Host "`n[ + ] Copying files to destination..." -ForegroundColor Yellow
        Write-Host "      Destination: $DestinationPath" -ForegroundColor Gray
        
        if (!(Test-Path $DestinationPath)) {
            New-Item -ItemType Directory -Path $DestinationPath -Force | Out-Null
        }
        
        $outputPath = $ModuleConfig.ContainsKey('OutPath') ? $ModuleConfig.OutPath : "$ScriptPath\Output"
        $culture = $ModuleConfig.ContainsKey('Culture') ? $ModuleConfig.Culture : 'en-US'
        
        # Copy module files
        $filesToCopy = @(
            "$outputPath\$ProjectName.ps1"
            "$outputPath\$ProjectName.psm1"
            "$outputPath\$ProjectName.psd1"
        )
        
        $copiedCount = 0
        foreach ($file in $filesToCopy) {
            if (Test-Path $file) {
                Copy-Item $file $DestinationPath -Force
                Write-Host "      ✓ $(Split-Path $file -Leaf)" -ForegroundColor Green
                $copiedCount++
            }
        }
        
        # Copy help file
        $helpFile = "$outputPath\$culture\$ProjectName-Help.xml"
        if (Test-Path $helpFile) {
            $destHelpDir = Join-Path $DestinationPath $culture
            if (!(Test-Path $destHelpDir)) {
                New-Item -ItemType Directory -Path $destHelpDir -Force | Out-Null
            }
            Copy-Item $helpFile $destHelpDir -Force
            Write-Host "      ✓ $culture\$ProjectName-Help.xml" -ForegroundColor Green
            $copiedCount++
        }
        
        Write-Host "      Total files copied: $copiedCount" -ForegroundColor Cyan
        
    } catch {
        Write-Host "      ⚠ Error copying files: $($_.Exception.Message)" -ForegroundColor Yellow
    }
}

# Summary
Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Build Summary                                            ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

foreach ($step in $results.Steps) {
    $statusColor = switch ($step.Status) {
        "Success" { "Green" }
        "Warning" { "Yellow" }
        "Failed"  { "Red" }
        "Skipped" { "Gray" }
    }
    
    $icon = switch ($step.Status) {
        "Success" { "✓" }
        "Warning" { "⚠" }
        "Failed"  { "❌" }
        "Skipped" { "○" }
    }
    
    Write-Host "$icon Step $($step.Step): $($step.Name.PadRight(30)) [$($step.Status)]" -ForegroundColor $statusColor
}

if ($results.Success) {
    Write-Host "`n✓ Build completed successfully!" -ForegroundColor Green
    Write-Host "`nGenerated files:" -ForegroundColor Cyan
    
    $outputPath = $ModuleConfig.ContainsKey('OutPath') ? $ModuleConfig.OutPath : "$ScriptPath\Output"
    $culture = $ModuleConfig.ContainsKey('Culture') ? $ModuleConfig.Culture : 'en-US'
    
    Write-Host "  • Module code:  $outputPath\$ProjectName.ps1" -ForegroundColor Gray
    Write-Host "  • Module main:  $outputPath\$ProjectName.psm1" -ForegroundColor Gray
    Write-Host "  • Module manif: $outputPath\$ProjectName.psd1" -ForegroundColor Gray
    Write-Host "  • Help file:    $outputPath\$culture\$ProjectName-Help.xml" -ForegroundColor Gray
    
    if ($DestinationPath) {
        Write-Host "`nFiles also copied to: $DestinationPath" -ForegroundColor Cyan
    }
    
    Write-Host "`nNext steps:" -ForegroundColor Yellow
    Write-Host "  1. Import-Module $outputPath\$ProjectName.psd1" -ForegroundColor Gray
    Write-Host "  2. Get-Help <CommandName> -Full" -ForegroundColor Gray
    
} else {
    Write-Host "`n❌ Build failed. See errors above." -ForegroundColor Red
    exit 1
}
