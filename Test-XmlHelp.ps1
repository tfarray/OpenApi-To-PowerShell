# Test-XmlHelp.ps1
# Validates generated MAML XML help files

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$HelpFilePath,
    
    [switch]$Detailed
)

Write-Host "`n=== XML Help File Validator ===" -ForegroundColor Cyan
Write-Host "File: $HelpFilePath`n" -ForegroundColor Gray

$errors = @()
$warnings = @()
$stats = @{
    Commands = 0
    Parameters = 0
    Examples = 0
}

# Check file exists
if (!(Test-Path $HelpFilePath)) {
    Write-Host "❌ ERROR: File not found: $HelpFilePath" -ForegroundColor Red
    return
}

# Validate XML structure
Write-Host "Validating XML structure..." -ForegroundColor Yellow
try {
    [xml]$helpXml = Get-Content $HelpFilePath -ErrorAction Stop
    Write-Host "✓ XML is well-formed" -ForegroundColor Green
} catch {
    Write-Host "❌ ERROR: Invalid XML - $($_.Exception.Message)" -ForegroundColor Red
    return
}

# Validate root element
if ($helpXml.DocumentElement.LocalName -ne 'helpItems') {
    $errors += "Root element should be 'helpItems', found '$($helpXml.DocumentElement.LocalName)'"
}

# Get namespace manager
$nsManager = New-Object System.Xml.XmlNamespaceManager($helpXml.NameTable)
$nsManager.AddNamespace("command", "http://schemas.microsoft.com/maml/dev/command/2004/10")
$nsManager.AddNamespace("maml", "http://schemas.microsoft.com/maml/2004/10")
$nsManager.AddNamespace("dev", "http://schemas.microsoft.com/maml/dev/2004/10")

# Get all commands
$commands = $helpXml.SelectNodes("//command:command", $nsManager)
$stats.Commands = $commands.Count

Write-Host "Found $($commands.Count) command(s)" -ForegroundColor Cyan

foreach ($cmd in $commands) {
    $cmdName = $cmd.SelectSingleNode("command:details/command:name", $nsManager).'#text'
    
    if ($Detailed) {
        Write-Host "`n--- $cmdName ---" -ForegroundColor White
    }
    
    # Validate command name
    if (!$cmdName) {
        $errors += "Command missing name element"
        continue
    }
    
    if ($cmdName -notmatch '^[A-Z][a-z]+-[A-Z]') {
        $warnings += "$cmdName : Name doesn't follow PowerShell convention (Verb-Noun)"
    }
    
    # Check for synopsis
    $synopsis = $cmd.SelectSingleNode("command:details/maml:description/maml:para", $nsManager)
    if (!$synopsis -or !$synopsis.'#text') {
        $warnings += "$cmdName : Missing synopsis"
    } elseif ($Detailed) {
        Write-Host "  Synopsis: $($synopsis.'#text'.Substring(0, [Math]::Min(60, $synopsis.'#text'.Length)))..." -ForegroundColor Gray
    }
    
    # Check for description
    $description = $cmd.SelectNodes("maml:description/maml:para", $nsManager)
    if (!$description -or $description.Count -eq 0) {
        $warnings += "$cmdName : Missing description"
    } elseif ($Detailed) {
        Write-Host "  Description: $($description.Count) paragraph(s)" -ForegroundColor Gray
    }
    
    # Check parameters
    $parameters = $cmd.SelectNodes("command:parameters/command:parameter", $nsManager)
    $stats.Parameters += $parameters.Count
    
    if ($Detailed -and $parameters.Count -gt 0) {
        Write-Host "  Parameters: $($parameters.Count)" -ForegroundColor Gray
    }
    
    foreach ($param in $parameters) {
        $paramName = $param.SelectSingleNode("maml:name", $nsManager).'#text'
        $paramType = $param.SelectSingleNode("dev:type/maml:name", $nsManager).'#text'
        $paramDesc = $param.SelectSingleNode("maml:description/maml:para", $nsManager)
        
        if (!$paramName) {
            $errors += "$cmdName : Parameter missing name"
        }
        
        if (!$paramType) {
            $warnings += "$cmdName : Parameter '$paramName' missing type"
        }
        
        if (!$paramDesc -or !$paramDesc.'#text') {
            $warnings += "$cmdName : Parameter '$paramName' missing description"
        }
        
        if ($Detailed) {
            Write-Host "    - $paramName [$paramType]" -ForegroundColor DarkGray
        }
    }
    
    # Check examples
    $examples = $cmd.SelectNodes("command:examples/command:example", $nsManager)
    $stats.Examples += $examples.Count
    
    if ($examples.Count -eq 0) {
        $warnings += "$cmdName : No examples provided"
    } elseif ($Detailed) {
        Write-Host "  Examples: $($examples.Count)" -ForegroundColor Gray
    }
    
    # Validate syntax section exists
    $syntax = $cmd.SelectSingleNode("command:syntax", $nsManager)
    if (!$syntax) {
        $errors += "$cmdName : Missing syntax section"
    }
}

# Display results
Write-Host "`n=== Validation Results ===" -ForegroundColor Cyan
Write-Host "Commands:   $($stats.Commands)" -ForegroundColor White
Write-Host "Parameters: $($stats.Parameters)" -ForegroundColor White
Write-Host "Examples:   $($stats.Examples)" -ForegroundColor White

if ($errors.Count -eq 0 -and $warnings.Count -eq 0) {
    Write-Host "`n✓ No issues found! Help file is valid." -ForegroundColor Green
} else {
    if ($errors.Count -gt 0) {
        Write-Host "`n❌ ERRORS ($($errors.Count)):" -ForegroundColor Red
        $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    }
    
    if ($warnings.Count -gt 0) {
        Write-Host "`n⚠ WARNINGS ($($warnings.Count)):" -ForegroundColor Yellow
        $warnings | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
    }
}

# Test if it can be loaded by PowerShell
Write-Host "`n=== PowerShell Compatibility Test ===" -ForegroundColor Cyan
try {
    # Try to validate against PowerShell's expectations
    $tempModule = Join-Path $env:TEMP "TestModule_$(Get-Random)"
    New-Item -ItemType Directory -Path $tempModule -Force | Out-Null
    New-Item -ItemType Directory -Path "$tempModule\en-US" -Force | Out-Null
    
    Copy-Item $HelpFilePath "$tempModule\en-US\TestModule-Help.xml" -Force
    
    # Create minimal module files
    "@{ ModuleVersion = '1.0'; RootModule = 'TestModule.psm1' }" | Out-File "$tempModule\TestModule.psd1"
    "" | Out-File "$tempModule\TestModule.psm1"
    
    # Try to import
    Import-Module $tempModule -Force -ErrorAction Stop
    
    # Get first command name from help
    $firstCmd = $commands[0].SelectSingleNode("command:details/command:name", $nsManager).'#text'
    
    if ($firstCmd) {
        # This won't actually show help since the function doesn't exist, 
        # but it validates the XML can be parsed by PowerShell
        $help = Get-Help $firstCmd -ErrorAction SilentlyContinue
        
        if ($help) {
            Write-Host "✓ Help file can be loaded by PowerShell" -ForegroundColor Green
        } else {
            Write-Host "⚠ Help file loaded but commands not found (expected - test module)" -ForegroundColor Yellow
        }
    }
    
    Remove-Module TestModule -ErrorAction SilentlyContinue
    Remove-Item $tempModule -Recurse -Force -ErrorAction SilentlyContinue
    
} catch {
    Write-Host "⚠ Could not test PowerShell compatibility: $($_.Exception.Message)" -ForegroundColor Yellow
}

Write-Host "`n=== Validation Complete ===" -ForegroundColor Cyan

# Return summary object
[PSCustomObject]@{
    FilePath = $HelpFilePath
    Valid = ($errors.Count -eq 0)
    Commands = $stats.Commands
    Parameters = $stats.Parameters
    Examples = $stats.Examples
    Errors = $errors.Count
    Warnings = $warnings.Count
}
