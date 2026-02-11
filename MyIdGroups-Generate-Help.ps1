# MyIdGroups-Generate-Help.ps1
# Complete example for generating XML help for MyIdGroups

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   MyIdGroups XML Help Generation                          ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Configuration (matches MyIdGroups.ps1 settings)
$config = @{
    ProjectName = "MyIdGroups"
    
    # Additional parameters that are added programmatically
    AdditionalParameters = @{
        page = @{ GetAll = @{ Type = "Switch"; Parameter = @() }}
    }
    
    # Descriptions for those additional parameters
    AdditionalParameterDescriptions = @{
        GetAll = "Retrieves all pages of results automatically instead of requiring manual pagination."
    }
    
    # Function renaming patterns (same as in MyIdGroups.ps1)
    FunctionRenamePattern = [ordered]@{
        "GroupsGroups" = "Groups"
        "New(.*relationships)" = 'Add$1'
        "relationships(?!Requests)" = ""
    }
    
    Culture = "en-US"
}

Write-Host "Configuration:" -ForegroundColor Yellow
Write-Host "  Project: $($config.ProjectName)" -ForegroundColor Gray
Write-Host "  Additional Params: $($config.AdditionalParameters.Keys -join ', ')" -ForegroundColor Gray
Write-Host "  Rename Patterns: $($config.FunctionRenamePattern.Count)" -ForegroundColor Gray
Write-Host ""

# Generate help
try {
    Write-Host "Generating XML help..." -ForegroundColor Cyan
    .\ConvertToXmlHelp.ps1 @config
    
    Write-Host "`n✓ Help generation completed!" -ForegroundColor Green
    Write-Host "Help file: Output\en-US\MyIdGroups-Help.xml" -ForegroundColor Cyan
    
    # Check file was created
    if (Test-Path "Output\en-US\MyIdGroups-Help.xml") {
        $fileSize = (Get-Item "Output\en-US\MyIdGroups-Help.xml").Length
        Write-Host "File size: $([math]::Round($fileSize/1KB, 2)) KB" -ForegroundColor Gray
    }
    
} catch {
    Write-Host "`n✗ Error generating help:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Write-Host "`n" + "─" * 60 -ForegroundColor DarkGray
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Copy help to module: Copy-Item 'Output\en-US\MyIdGroups-Help.xml' '<ModulePath>\en-US\'" -ForegroundColor Gray
Write-Host "2. Import module and test: Get-Help <CommandName> -Full" -ForegroundColor Gray
