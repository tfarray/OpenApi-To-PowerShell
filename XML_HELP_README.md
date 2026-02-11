# OpenAPI to PowerShell XML Help Generator

## Requirements

**PowerShell 7.0+** - This tool requires PowerShell 7 or later for ternary operator support and modern language features.

## Overview

The **ConvertToXmlHelp.ps1** script generates MAML (Microsoft Assistance Markup Language) XML help files from OpenAPI specifications. These XML files enable PowerShell's `Get-Help` cmdlet to display comprehensive documentation for your generated module functions.

## What is MAML?

MAML is Microsoft's XML-based format for PowerShell help documentation. When properly formatted and placed in your module directory, it provides:

- Full command documentation via `Get-Help`
- IntelliSense support in editors
- Parameter descriptions and types
- Usage examples
- Professional help documentation

## Features

✅ **Automatic Help Generation** - Extracts documentation from OpenAPI specs  
✅ **Parameter Documentation** - Includes types, descriptions, and requirements  
✅ **API Endpoint Info** - Shows HTTP method and path in description  
✅ **Tag Support** - Includes OpenAPI tags in related links  
✅ **Consistent Naming** - Uses same logic as ConvertProject.ps1  
✅ **Customizable** - Supports all ConvertProject.ps1 rename options  

## Quick Start

### 1. Generate Module Code (if not done)
```powershell
$vars = @{
    ProjectName = "GitHub"
    LastNounToVern = @{ disable = "Disable"; enable = "Enable" }
}
.\ConvertProject.ps1 @vars
```

### 2. Generate XML Help
```powershell
.\ConvertToXmlHelp.ps1 @vars
```

### 3. Install Help File
```powershell
# Copy to module directory
Copy-Item "Output\en-US\GitHub-Help.xml" "C:\Path\To\Module\GitHub\en-US\" -Force
```

### 4. Use Help
```powershell
Import-Module GitHub
Get-Help Get-GitHubRepos -Full
Get-Help Start-GitHubReposActionsWorkflows -Examples
```

## Parameters

### Required
- **`ProjectName`** - Name of the project/API (matches OpenAPI JSON filename)

### Optional
- **`MultipleFiles`** - Process multiple JSON files (MyModule_1.json, MyModule_2.json, etc.)
- **`LastNounToVern`** - Hashtable mapping last noun to specific verb
- **`FunctionRename`** - Hashtable for direct function name replacement
- **`FunctionRenamePattern`** - Hashtable for pattern-based renaming
- **`DescriptionToVerb`** - Map description keywords to verbs
- **`OutPath`** - Custom output directory
- **`ModuleVersion`** - Module version number (default: "1.0.0")
- **`Culture`** - Language/culture code (default: "en-US")- **`AdditionalParameters`** - Hashtable of parameters added programmatically (from ConvertProject.ps1)
- **`AdditionalParameterDescriptions`** - Descriptions for additional parameters not in OpenAPI spec
## Examples

### Example 1: Basic Usage
```powershell
.\ConvertToXmlHelp.ps1 -ProjectName "GitHub"
```

### Example 2: With Function Renaming
```powershell
$variables = @{
    ProjectName = "MyAPI"
    FunctionRename = @{
        "Get-MyAPIResourcesList" = "Get-MyAPIResources"
        "New-MyAPIResourcesCreate" = "New-MyAPIResource"
    }
    FunctionRenamePattern = [ordered]@{
        "MyAPIApi" = "MyAPI"
    }
}
.\ConvertToXmlHelp.ps1 @variables
```

### Example 3: Custom Output Path
```powershell
.\ConvertToXmlHelp.ps1 -ProjectName "GitHub" -OutPath "C:\MyModules\GitHub\Help"
```

### Example 4: Non-English Culture
```powershell
.\ConvertToXmlHelp.ps1 -ProjectName "GitHub" -Culture "fr-FR"
```
### Example 5: With Additional Parameters (MyIdGroups)
```powershell
$variables = @{
    ProjectName = \"MyIdGroups\"
    AdditionalParameters = @{
        page = @{ GetAll = @{ Type = \"Switch\"; Parameter = @() }}
    }
    AdditionalParameterDescriptions = @{
        GetAll = \"When specified, automatically retrieves all pages of results.\"
    }
    FunctionRenamePattern = [ordered]@{
        \"GroupsGroups\" = \"Groups\"
        \"New(.*relationships)\" = 'Add$1'
        \"relationships(?!Requests)\" = \"\"
    }
}
.\ConvertToXmlHelp.ps1 @variables
```
## File Structure

After generation, your help files should be organized:

```
YourModule/
├── YourModule.psd1
├── YourModule.psm1
├── YourModule.ps1
└── en-US/
    └── YourModule-Help.xml    ← Generated help file
```

## What Gets Documented

The script extracts from OpenAPI specifications:

| OpenAPI Field | MAML Element | Get-Help Display |
|--------------|--------------|------------------|
| `summary` | Synopsis | Command description |
| `description` | Detailed description | -Full output |
| `parameters[].name` | Parameter name | Parameter list |
| `parameters[].description` | Parameter description | -Parameter output |
| `parameters[].schema.type` | Parameter type | Type information |
| `parameters[].required` | Required flag | [<Parameter>] vs [-Parameter] |
| `tags` | Related links | Related topics |
| `externalDocs` | Example remarks | -Examples output |

## Integration with ConvertProject.ps1

⚠️ **IMPORTANT**: The naming parameters (`LastNounToVern`, `FunctionRename`, `FunctionRenamePattern`) must **exactly match** those used in ConvertProject.ps1 to ensure help files correspond to the correct function names.

### Recommended Workflow

```powershell
# 1. Define your configuration once
$config = @{
    ProjectName = "GitHub"
    LastNounToVern = @{ disable = "Disable"; enable = "Enable" }
    FunctionRename = @{
        "New-GitHubReposActionsWorkflowsDispatches" = "Start-GitHubReposActionsWorkflows"
    }
    GenerateMainModule = $true
}

# 2. Generate module code
.\ConvertProject.ps1 @config

# 3. Generate help file
.\ConvertToXmlHelp.ps1 @config

# 4. Copy help to module directory
$modulePath = "Output"
Copy-Item "Output\en-US\GitHub-Help.xml" "$modulePath\en-US\" -Force
```

## Documenting Additional Parameters

When using `AdditionalParameters` in ConvertProject.ps1 to add extra parameters programmatically (like pagination switches), these parameters won't automatically have documentation because they don't exist in the OpenAPI specification. Use `AdditionalParameterDescriptions` to provide help text for them:

```powershell
$config = @{
    ProjectName = "MyIdGroups"
    # Define additional parameters (same as in ConvertProject.ps1)
    AdditionalParameters = @{
        page = @{ GetAll = @{ Type = "Switch"; Parameter = @() }}
    }
    # Provide help text for those additionalparameters
    AdditionalParameterDescriptions = @{
        GetAll = "Retrieves all pages of results automatically instead of returning a single page."
    }
}
.\ConvertToXmlHelp.ps1 @config
```

**How it works:**
1. `AdditionalParameters` mirrors the configuration from ConvertProject.ps1
2. `AdditionalParameterDescriptions` provides the help text for each additional parameter
3. If a command includes the base parameter (e.g., "page"), the additional parameter (e.g., "GetAll") will be documented in its help file
4. Without descriptions, additional parameters will show as "Additional parameter" in help

This ensures your dynamically-added parameters have proper documentation!

## MAML XML Structure

The generated XML follows PowerShell's MAML schema:

```xml
<?xml version="1.0" encoding="utf-8"?>
<helpItems schema="maml">
  <command:command>
    <command:details>
      <!-- Command name, verb, noun -->
    </command:details>
    <maml:description>
      <!-- Detailed description with API endpoint -->
    </maml:description>
    <command:syntax>
      <!-- Parameter syntax -->
    </command:syntax>
    <command:parameters>
      <!-- Detailed parameter documentation -->
    </command:parameters>
    <command:examples>
      <!-- Usage examples -->
    </command:examples>
  </command:command>
</helpItems>
```

## Customization Tips

### Adding Custom Examples

Edit the script to include custom examples based on specific endpoints:

```powershell
# In ConvertToXmlHelp.ps1, modify the examples section:
if ($MethodData.externalDocs) {
    $CommandInfo.Examples += @{
        Title = "Example 1: Basic Usage"
        Code  = "$FunctionName -Parameter Value"
        Remarks = "This example shows basic usage"
    }
}
```

### Adding Notes Section

To add additional notes to each command:

```powershell
# Add after the examples section:
$xml += '    <maml:alertSet>'
$xml += '      <maml:alert>'
$xml += "        <maml:para>API Version: $($Open.info.version)</maml:para>"
$xml += '      </maml:alert>'
$xml += '    </maml:alertSet>'
```

### Parameter Position Numbers

Currently, all parameters are marked as "Named". To set positions:

```powershell
# Modify the parameter processing:
$position = 0
foreach ($param in $MethodData.parameters) {
    if ($param.required) {
        $paramInfo.Position = $position
        $position++
    } else {
        $paramInfo.Position = "Named"
    }
}
```

## Troubleshooting

### Help Not Showing

```powershell
# Verify help file location
Get-Module GitHub -ListAvailable | Select-Object ModuleBase
# Help file should be at: <ModuleBase>\en-US\GitHub-Help.xml

# Reload module
Remove-Module GitHub -Force
Import-Module GitHub -Force

# Check for XML errors
Get-Content "Output\en-US\GitHub-Help.xml" | Select-String -Pattern "<.*?>" | Measure-Object
```

### Function Names Don't Match

Ensure the same rename parameters are used for both scripts:

```powershell
# Save config to file
$config | Export-Clixml "config.xml"

# Use in both scripts
$config = Import-Clixml "config.xml"
.\ConvertProject.ps1 @config
.\ConvertToXmlHelp.ps1 @config
```

### XML Validation Errors

The script escapes special characters, but if you encounter issues:

```powershell
# Validate XML
[xml]$helpXml = Get-Content "Output\en-US\GitHub-Help.xml"
$helpXml.Schemas.Add($null, "http://schemas.microsoft.com/maml/2004/10") | Out-Null
$helpXml.Validate($null)
```

## Advanced Usage

### Batch Processing Multiple APIs

```powershell
$apis = @("GitHub", "Cadmium", "VrOps", "JiraCloud")

foreach ($api in $apis) {
    $config = @{ ProjectName = $api }
    
    Write-Host "Processing $api..." -ForegroundColor Cyan
    .\ConvertToXmlHelp.ps1 @config
    
    # Copy to module directory
    $modulePath = "C:\Modules\$api"
    if (Test-Path $modulePath) {
        Copy-Item "Output\en-US\$api-Help.xml" "$modulePath\en-US\" -Force
        Write-Host "  ✓ Help installed for $api" -ForegroundColor Green
    }
}
```

### Auto-Update Help

Create a scheduled task or CI/CD pipeline:

```powershell
# update-help.ps1
param([string]$ProjectName)

# Generate latest help
.\ConvertToXmlHelp.ps1 -ProjectName $ProjectName

# Deploy to module gallery or shared location
$source = "Output\en-US\$ProjectName-Help.xml"
$destination = "\\SharedDrive\Modules\$ProjectName\en-US\"

Copy-Item $source $destination -Force
Write-Host "Help updated for $ProjectName" -ForegroundColor Green
```

## Limitations

1. **No Code Examples** - OpenAPI specs rarely include usage examples; basic examples are auto-generated
2. **Simple Type Mapping** - Complex schema types are simplified to basic PowerShell types
3. **No Pipeline Info** - Pipeline input information is not extracted from OpenAPI
4. **Single Culture** - One culture per run (can be run multiple times for multi-language support)

## Future Enhancements

Potential improvements:

- [ ] Extract examples from OpenAPI `x-code-samples` extension
- [ ] Support for CBH (Comment-Based Help) as alternative to MAML
- [ ] Auto-generate better examples based on required parameters
- [ ] Support for `about_*` conceptual help files
- [ ] Multi-language generation in single run
- [ ] Integration with PlatyPS for help authoring

## Related Tools

- **PlatyPS** - Update and maintain MAML help files
- **Get-Help** - PowerShell built-in help viewer
- **Update-Help** - Download updatable help
- **New-ExternalHelp** (PlatyPS) - Convert markdown to MAML

## Support

For issues or questions:
1. Check that OpenAPI JSON is valid
2. Verify naming parameters match ConvertProject.ps1
3. Review generated XML for errors
4. Check PowerShell help system with `Get-Help about_Comment_Based_Help`

## Contributing

To improve the help generation:
1. Add support for additional OpenAPI fields
2. Enhance example generation logic
3. Improve type mapping accuracy
4. Add validation for generated XML

---

**Author**: OpenApi-To-PowerShell  
**Version**: 1.0  
**License**: Same as OpenApi-To-PowerShell project
