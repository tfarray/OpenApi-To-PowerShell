[CmdletBinding()]
Param(
    [string]$Filename,
    [string]$OutputPath = ""
)

$M = "powershell-yaml"
if (!(get-module $m) -or !(get-module -ListAvailable $m)) {
    Write-host "you need to install the $m Module. Please run the command 'Install-Module $m -Force' to install the converter module."
}


dir $Filename | % {
    $_ | get-content |  ConvertFrom-Yaml | ConvertTo-Json -Depth 20 | out-file ($OutputPath +  ($_.name -replace "yaml","json") )
}
