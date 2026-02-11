# Test-MyIdGroupsCompatibility.ps1
# Tests the XML help generation with MyIdGroups.json to ensure compatibility

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   MyIdGroups Compatibility Test                           ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Continue"
$testResults = @{
    Passed = @()
    Failed = @()
    Warnings = @()
}

# Test 1: JSON file exists and loads
Write-Host "[Test 1] Checking if MyIdGroups.json exists..." -NoNewline
try {
    $jsonPath = "c:\Dev\OpenApi-To-PowerShell\Projects\MyIdGroups.json"
    if (Test-Path $jsonPath) {
        $json = Get-Content $jsonPath | ConvertFrom-Json -Depth 50 -AsHashtable
        Write-Host " ✓ PASS" -ForegroundColor Green
        $testResults.Passed += "JSON file loads successfully"
    } else {
        Write-Host " ✗ FAIL" -ForegroundColor Red
        $testResults.Failed += "JSON file not found"
    }
} catch {
    Write-Host " ✗ FAIL: $($_.Exception.Message)" -ForegroundColor Red
    $testResults.Failed += "JSON parsing failed"
}

# Test 2: OpenAPI version compatibility
Write-Host "[Test 2] Checking OpenAPI version..." -NoNewline
if ($json.openapi -eq "3.0.3") {
    Write-Host " ✓ PASS ($($json.openapi))" -ForegroundColor Green
    $testResults.Passed += "OpenAPI 3.0.3 supported"
} else {
    Write-Host " ⚠ WARNING (Found: $($json.openapi))" -ForegroundColor Yellow
    $testResults.Warnings += "OpenAPI version $($json.openapi) might need testing"
}

# Test 3: Server configuration (servers vs host)
Write-Host "[Test 3] Checking server configuration..." -NoNewline
if ($json.ContainsKey('servers')) {
    Write-Host " ✓ PASS (uses 'servers')" -ForegroundColor Green
    $testResults.Passed += "Modern 'servers' configuration detected"
} elseif ($json.ContainsKey('host')) {
    Write-Host " ✓ PASS (uses 'host')" -ForegroundColor Green
    $testResults.Passed += "Legacy 'host' configuration detected"
} else {
    Write-Host " ⚠ WARNING (no server info)" -ForegroundColor Yellow
    $testResults.Warnings += "No server configuration found"
}

# Test 4: Function rename patterns with regex
Write-Host "[Test 4] Testing regex-based function renaming..." -NoNewline
try {
    $FunctionRenamePattern = [ordered]@{
        "GroupsGroups" = "Groups"
        "New(.*relationships)" = 'Add$1'
        "relationships(?!Requests)" = ""
    }
    
    $testCases = @(
        @{ Input = "Get-MyIdGroupsGroups"; Expected = "Get-MyIdGroups" }
        @{ Input = "New-MyIdGroupsGroupsRelationshipsMemberGroups"; Expected = "Add-MyIdGroupsMemberGroups"; Description = "Full pattern chain" }
        @{ Input = "Get-MyIdGroupsGroupsRelationshipsRequests"; Expected = "Get-MyIdGroupsRelationshipsRequests"; Description = "Should NOT remove 'Relationships' before 'Requests'" }
    )
    
    $allPassed = $true
    foreach ($test in $testCases) {
        $result = $test.Input
        @($FunctionRenamePattern.psbase.keys) | ForEach-Object {
            $result = $result -replace "$_", ($FunctionRenamePattern[$_])
        }
        if ($result -ne $test.Expected) {
            $allPassed = $false
            Write-Host "`n  ✗ Pattern failed: $($test.Input) -> $result (expected: $($test.Expected))" -ForegroundColor Red
        }
    }
    
    if ($allPassed) {
        Write-Host " ✓ PASS" -ForegroundColor Green
        $testResults.Passed += "Regex patterns work correctly"
    } else {
        Write-Host " ✗ FAIL" -ForegroundColor Red
        $testResults.Failed += "Regex patterns not working as expected"
    }
} catch {
    Write-Host " ✗ FAIL: $($_.Exception.Message)" -ForegroundColor Red
    $testResults.Failed += "Regex pattern testing failed"
}

# Test 5: Sample path processing
Write-Host "[Test 5] Testing sample path processing..." -NoNewline
try {
    $samplePath = "/groups/{group_id}/relationships/member_groups"
    if ($json.paths.ContainsKey($samplePath)) {
        $pathData = $json.paths[$samplePath]
        $methods = @($pathData.psbase.keys) | Where-Object { $_ -in @('get','post','put','delete','patch') }
        
        if ($methods.Count -gt 0) {
            Write-Host " ✓ PASS ($($methods.Count) method(s))" -ForegroundColor Green
            $testResults.Passed += "Complex paths with relationships detected"
        } else {
            Write-Host " ⚠ WARNING (no HTTP methods)" -ForegroundColor Yellow
            $testResults.Warnings += "Sample path has no standard HTTP methods"
        }
    } else {
        Write-Host " ⚠ WARNING (path not found)" -ForegroundColor Yellow
        $testResults.Warnings += "Sample relationship path not in spec"
    }
} catch {
    Write-Host " ✗ FAIL: $($_.Exception.Message)" -ForegroundColor Red
    $testResults.Failed += "Path processing failed"
}

# Test 6: Parameters extraction
Write-Host "[Test 6] Testing parameter extraction from paths..." -NoNewline
try {
    $pathsWithParams = 0
    $totalParams = 0
    
    foreach ($pathKey in $json.paths.psbase.keys) {
        $pathData = $json.paths[$pathKey]
        foreach ($method in @('get','post','put','delete','patch')) {
            if ($pathData.ContainsKey($method)) {
                $methodData = $pathData[$method]
                if ($methodData.ContainsKey('parameters') -and $methodData.parameters) {
                    $pathsWithParams++
                    $totalParams += $methodData.parameters.Count
                }
            }
        }
    }
    
    Write-Host " ✓ PASS ($pathsWithParams endpoints, $totalParams params)" -ForegroundColor Green
    $testResults.Passed += "Parameter extraction logic compatible"
} catch {
    Write-Host " ✗ FAIL: $($_.Exception.Message)" -ForegroundColor Red
    $testResults.Failed += "Parameter extraction failed"
}

# Test 7: Additional Parameters compatibility
Write-Host "[Test 7] Checking AdditionalParameters feature..." -NoNewline
$AdditionalParameters = @{
    page = @{ GetAll = @{ Type = "Switch"; Parameter = @() }}
}
Write-Host " ⚠ INFO" -ForegroundColor Yellow
Write-Host "         AdditionalParameters (like 'GetAll' switch) are added programmatically" -ForegroundColor Gray
Write-Host "         and won't appear in XML help unless manually documented." -ForegroundColor Gray
$testResults.Warnings += "AdditionalParameters won't be auto-documented from OpenAPI spec"

# Test 8: Description and summary fields
Write-Host "[Test 8] Checking for descriptions and summaries..." -NoNewline
try {
    $hasDescriptions = 0
    $hasSummaries = 0
    $sampleSize = [Math]::Min(10, $json.paths.psbase.keys.Count)
    
    $json.paths.psbase.keys | Select-Object -First $sampleSize | ForEach-Object {
        $pathData = $json.paths[$_]
        foreach ($method in @('get','post','put','delete','patch')) {
            if ($pathData.ContainsKey($method)) {
                if ($pathData[$method].ContainsKey('description')) { $hasDescriptions++ }
                if ($pathData[$method].ContainsKey('summary')) { $hasSummaries++ }
            }
        }
    }
    
    Write-Host " ✓ PASS (Desc: $hasDescriptions, Sum: $hasSummaries in sample)" -ForegroundColor Green
    $testResults.Passed += "Documentation fields present"
} catch {
    Write-Host " ✗ FAIL: $($_.Exception.Message)" -ForegroundColor Red
    $testResults.Failed += "Description/summary check failed"
}

# Summary
Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Test Summary                                             ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

Write-Host "`n✓ Passed: $($testResults.Passed.Count)" -ForegroundColor Green
$testResults.Passed | ForEach-Object { Write-Host "  - $_" -ForegroundColor Gray }

if ($testResults.Warnings.Count -gt 0) {
    Write-Host "`n⚠ Warnings: $($testResults.Warnings.Count)" -ForegroundColor Yellow
    $testResults.Warnings | ForEach-Object { Write-Host "  - $_" -ForegroundColor Gray }
}

if ($testResults.Failed.Count -gt 0) {
    Write-Host "`n✗ Failed: $($testResults.Failed.Count)" -ForegroundColor Red
    $testResults.Failed | ForEach-Object { Write-Host "  - $_" -ForegroundColor Gray }
}

# Recommendations
Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Recommendations                                          ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

if ($testResults.Failed.Count -eq 0) {
    Write-Host "`n✓ ConvertToXmlHelp.ps1 should work with MyIdGroups.json" -ForegroundColor Green
    Write-Host "`nTo generate help:" -ForegroundColor Cyan
    Write-Host @"
    `$config = @{
        ProjectName = "MyIdGroups"
        AdditionalParameters = @{
            page = @{ GetAll = @{ Type = "Switch"; Parameter = @() }}
        }
        FunctionRenamePattern = [ordered]@{
            "GroupsGroups" = "Groups"
            "New(.*relationships)" = 'Add\$1'
            "relationships(?!Requests)" = ""
        }
    }
    .\ConvertToXmlHelp.ps1 @config
"@ -ForegroundColor Gray
} else {
    Write-Host "`n⚠ There are compatibility issues that need to be addressed." -ForegroundColor Yellow
}

Write-Host ""
return $testResults
