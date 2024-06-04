# Step By Step instructions
# Download the json file and copy it to the Projects Folder
# Run the commands below, a new .ps1 file will be generated in the output folder
# copy the manually built GitHub.psm1 to the OutPut Folder
# Generate (only to be done once) the manifest file :
    # New-ModuleManifest -Path E:\OpenApi-To-PowerShell\Examples\GitHub\GitHub.psd1 -Author OpenApi-To-PowerShell -NestedModules GitHub.ps1 -CmdletsToExport * -FunctionsToExport * -VariablesToExport * -AliasesToExport *

# Actual configuration used to generate the .ps1 file
$Variables = @{
    ProjectName = "GitHub"
    LastFunctionToVerb = @{
        disable    = "Disable"
        enable     = "Enable"
    }
    FunctionRename = @{
        "New-GitHubReposActionsWorkflowsDispatches"   = "Start-GitHubReposActionsWorkflows"
    }
    AdditionalSwitches = @{
        page = @{ GetAll = @{ Type = "Switch"  ; Parameter = @() }}
    }
}

ConvertProject.ps1 @Variables
