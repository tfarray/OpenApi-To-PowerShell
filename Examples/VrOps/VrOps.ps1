Function Search-VrOpsApiAuthSourcesUsers {
    [CmdletBinding()]
    param (
        [HashTable]$query,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/{id}/users/search'
}
Export-ModuleMember Search-VrOpsApiAuthSourcesUsers

Function Get-VrOpsApiContentOperationsImport {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/operations/import'
}
Export-ModuleMember Get-VrOpsApiContentOperationsImport

Function New-VrOpsApiContentOperationsExport {
    [CmdletBinding()]
    param (
        [HashTable]$contentExport,
        [String]$EncryptionPassword
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/operations/export'
}
Export-ModuleMember New-VrOpsApiContentOperationsExport

Function Remove-VrOpsApiResourcesCustomdatacenters {
    [CmdletBinding()]
    param (
        [HashTable]$customDatacenterIds
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/customdatacenters'
}
Export-ModuleMember Remove-VrOpsApiResourcesCustomdatacenters

Function Set-VrOpsApiApplicationsAgentsUpgrade {
    [CmdletBinding()]
    param (
        [HashTable]$resourceIDs
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/upgrade'
}
Export-ModuleMember Set-VrOpsApiApplicationsAgentsUpgrade

Function Remove-VrOpsApiCredentials {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials/{id}'
}
Export-ModuleMember Remove-VrOpsApiCredentials

Function Get-VrOpsApiActiondefinitions {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable[]]$others,
        [Switch]$scheduleEnabled
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/actiondefinitions'
}
Export-ModuleMember Get-VrOpsApiActiondefinitions

Function New-VrOpsApiAuthTokenRelease {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/token/release'
}
Export-ModuleMember New-VrOpsApiAuthTokenRelease

Function Remove-VrOpsApiApplicationsVccpmappings {
    [CmdletBinding()]
    param (
        [HashTable]$vCenterIds
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/vccpmappings'
}
Export-ModuleMember Remove-VrOpsApiApplicationsVccpmappings

Function Set-VrOpsApiResourcesMonitoringstateStart {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String[]]$adapterId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idmonitoringstatestart' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/monitoringstate/start' } 
        'monitoringstatestart' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/monitoringstate/start' } 
    }
}
Export-ModuleMember Set-VrOpsApiResourcesMonitoringstateStart

Function Set-VrOpsApiOptimizationWorkloadplacementCrossdcmoveEnable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/crossdcmove/enable'
}
Export-ModuleMember Set-VrOpsApiOptimizationWorkloadplacementCrossdcmoveEnable

Function Get-VrOpsApiResourcesStatsDt {
    [CmdletBinding()]
    param (
        [BigInt]$begin,
        [BigInt]$end,
        [BigInt]$smoothFactor,
        [Parameter(Mandatory,Position=0)][String[]]$resourceIds,
        [Parameter(Mandatory,Position=0)][String[]]$statKeys,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$showSmooth
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats/dt'
}
Export-ModuleMember Get-VrOpsApiResourcesStatsDt

Function Get-VrOpsApiResourcesRelationships {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][ValidateSet('PARENT','CHILD','ALL')][String]$relationshipType
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/relationships' } 
        'relationshipType' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/relationships/{relationshipType}' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesRelationships

Function Remove-VrOpsApiAuthUsergroupsPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$groupId,
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups/{groupId}/permissions/{roleName}'
}
Export-ModuleMember Remove-VrOpsApiAuthUsergroupsPermissions

Function Remove-VrOpsApiLogsConfigurationSettings {
    [CmdletBinding()]
    param (
        [HashTable]$classNames,
        [Parameter(Mandatory,Position=0)][ValidateSet('ANALYTICS','COLLECTOR','WEB','VIEW_BRIDGE','VCOPS_BRIDGE','SUITEAPI')][String]$logtype
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/configuration/{logtype}/settings'
}
Export-ModuleMember Remove-VrOpsApiLogsConfigurationSettings

Function Get-VrOpsApiChargebackBills {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/bills/{id}'
}
Export-ModuleMember Get-VrOpsApiChargebackBills

Function New-VrOpsApiCostconfigCurrency {
    [CmdletBinding()]
    param (
        [HashTable]$config
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/costconfig/currency'
}
Export-ModuleMember New-VrOpsApiCostconfigCurrency

Function Set-VrOpsApiChargebackEmailconfigurations {
    [CmdletBinding()]
    param (
        [HashTable]$resourceEmailConfigurations
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/emailconfigurations'
}
Export-ModuleMember Set-VrOpsApiChargebackEmailconfigurations

Function New-VrOpsApiApplicationsVccpmappings {
    [CmdletBinding()]
    param (
        [HashTable]$vCenterMappings
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/vccpmappings'
}
Export-ModuleMember New-VrOpsApiApplicationsVccpmappings

Function Set-VrOpsApiNotificationsTemplates {
    [CmdletBinding()]
    param (
        [HashTable]$notificationTemplate
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/templates'
}
Export-ModuleMember Set-VrOpsApiNotificationsTemplates

Function New-VrOpsApiEventsAdapterkinds {
    [CmdletBinding()]
    param (
        [HashTable]$eventX,
        [Parameter(Mandatory,Position=0)][String]$adapterKind
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/events/adapterkinds/{adapterKind}'
}
Export-ModuleMember New-VrOpsApiEventsAdapterkinds

Function Get-VrOpsApiAdapters {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='adapterId')][String]$adapterId,
        [Parameter(ParameterSetName='Search')][String]$adapterKindKey
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters' } 
        'adapterId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAdapters

Function Remove-VrOpsApiCertificate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$thumbprint,
        [Switch]$force
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/certificate'
}
Export-ModuleMember Remove-VrOpsApiCertificate

Function Get-VrOpsApiReportsDownload {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$format
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/reports/{id}/download'
}
Export-ModuleMember Get-VrOpsApiReportsDownload

Function Remove-VrOpsApiResourcesProfiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$profileId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/profiles/{profileId}'
}
Export-ModuleMember Remove-VrOpsApiResourcesProfiles

Function Get-VrOpsApiCredentials {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id,
        [Parameter(ParameterSetName='Search')][HashTable[]]$others,
        [Parameter(ParameterSetName='Search')][String[]]$adapterKind
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiCredentials

Function Get-VrOpsApiContentRestoreResult {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/restore/result'
}
Export-ModuleMember Get-VrOpsApiContentRestoreResult

Function New-VrOpsApiResourcesStatsDtQuery {
    [CmdletBinding()]
    param (
        [HashTable]$dsq
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats/dt/query'
}
Export-ModuleMember New-VrOpsApiResourcesStatsDtQuery

Function Remove-VrOpsApiDeploymentLicenses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/licenses/{id}'
}
Export-ModuleMember Remove-VrOpsApiDeploymentLicenses

Function Remove-VrOpsApiAdaptersMaintained {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$adapterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}/maintained'
}
Export-ModuleMember Remove-VrOpsApiAdaptersMaintained

Function New-VrOpsApiChargebackReportdefinitionsSchedules {
    [CmdletBinding()]
    param (
        [HashTable]$reportSchedule,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$XOpsAPITimezone
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reportdefinitions/{id}/schedules'
}
Export-ModuleMember New-VrOpsApiChargebackReportdefinitionsSchedules

Function New-VrOpsApiResourcesBulkRelationships {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$query
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/bulk/relationships'
}
Export-ModuleMember New-VrOpsApiResourcesBulkRelationships

Function New-VrOpsApiResourcesAdapters {
    [CmdletBinding()]
    param (
        [HashTable]$resourceRequest,
        [Parameter(Mandatory,Position=0)][String]$adapterInstanceId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/adapters/{adapterInstanceId}'
}
Export-ModuleMember New-VrOpsApiResourcesAdapters

Function Get-VrOpsApiPricing {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][ValidateSet('VRA','TA','TA_VCD','TA_VC','VROPS','VCD','UNKNOWN')][String[]]$createdBy
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/pricing' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/pricing/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiPricing

Function Remove-VrOpsApiChargebackReportdefinitionsSchedules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$scheduleId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reportdefinitions/{id}/schedules/{scheduleId}'
}
Export-ModuleMember Remove-VrOpsApiChargebackReportdefinitionsSchedules

Function Set-VrOpsApiAlertdefinitionsDisable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$policyId,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions/{id}/disable'
}
Export-ModuleMember Set-VrOpsApiAlertdefinitionsDisable

Function Remove-VrOpsApiResourcesRelationships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$relatedId,
        [Parameter(Mandatory,Position=0)][String]$relationshipType
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/relationships/{relationshipType}/{relatedId}'
}
Export-ModuleMember Remove-VrOpsApiResourcesRelationships

Function Get-VrOpsApiPricingHistory {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/pricing/{id}/history'
}
Export-ModuleMember Get-VrOpsApiPricingHistory

Function Get-VrOpsApiAdapterkindsResourcekindsResources {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$identifiers,
        [Parameter(Mandatory,Position=0)][String]$adapterKindKey,
        [Parameter(Mandatory,Position=0)][String]$resourceKindKey,
        [String]$name
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}/resources'
}
Export-ModuleMember Get-VrOpsApiAdapterkindsResourcekindsResources

Function Set-VrOpsApiLogsConfiguration {
    [CmdletBinding()]
    param (
        [HashTable]$logConfiguration,
        [Parameter(Mandatory,Position=0)][ValidateSet('ANALYTICS','COLLECTOR','WEB','VIEW_BRIDGE','VCOPS_BRIDGE','SUITEAPI')][String]$logtype,
        [Switch]$allowAddingNewSettings
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/configuration/{logtype}'
}
Export-ModuleMember Set-VrOpsApiLogsConfiguration

Function Remove-VrOpsApiAuthUsersPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$roleName,
        [Parameter(Mandatory,Position=0)][String]$userId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/{userId}/permissions/{roleName}'
}
Export-ModuleMember Remove-VrOpsApiAuthUsersPermissions

Function New-VrOpsApiActionsQuery {
    [CmdletBinding()]
    param (
        [HashTable]$actionPopulation,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/actions/{id}/query'
}
Export-ModuleMember New-VrOpsApiActionsQuery

Function Set-VrOpsApiLogsForwarding {
    [CmdletBinding()]
    param (
        [HashTable]$logForwardingConfiguration
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/forwarding'
}
Export-ModuleMember Set-VrOpsApiLogsForwarding

Function Set-VrOpsApiResourcesCustomdatacenters {
    [CmdletBinding()]
    param (
        [HashTable]$customDatacenter
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/customdatacenters'
}
Export-ModuleMember Set-VrOpsApiResourcesCustomdatacenters

Function Remove-VrOpsApiAuthUsers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users' } 
    }
}
Export-ModuleMember Remove-VrOpsApiAuthUsers

Function Get-VrOpsApiTasks {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][String[]]$taskId,
        [Parameter(ParameterSetName='Search')][ValidateSet('INITIATED','STOPPED','RUNNING','FINISHED','ERROR','ABORTED','UNKNOWN')][String[]]$taskState
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/tasks/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/tasks' } 
    }
}
Export-ModuleMember Get-VrOpsApiTasks

Function Get-VrOpsApiAlertplugins {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='pluginId')][String]$pluginId,
        [Parameter(ParameterSetName='Search')][String]$pluginTypeId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'pluginId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/{pluginId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins' } 
    }
}
Export-ModuleMember Get-VrOpsApiAlertplugins

Function New-VrOpsApiAuthSourcesUsers {
    [CmdletBinding()]
    param (
        [HashTable]$userList,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/{id}/users'
}
Export-ModuleMember New-VrOpsApiAuthSourcesUsers

Function Get-VrOpsApiResourcesProfiles {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='profileId')][String]$profileId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'profileId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/profiles/{profileId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/profiles' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesProfiles

Function Update-VrOpsApiCredentials {
    [CmdletBinding()]
    param (
        [HashTable]$dto
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials'
}
Export-ModuleMember Update-VrOpsApiCredentials

Function Remove-VrOpsApiApplicationsAgentsServices {
    [CmdletBinding()]
    param (
        [HashTable]$serviceConfigurationDeleteParameters,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/{id}/services'
}
Export-ModuleMember Remove-VrOpsApiApplicationsAgentsServices

Function Get-VrOpsApiApplicationsClientcertificate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$clientId,
        [Parameter(Mandatory,Position=0)][String]$collectorIpOrGroupName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/clientCertificate/{collectorIpOrGroupName}'
}
Export-ModuleMember Get-VrOpsApiApplicationsClientcertificate

Function New-VrOpsApiResourcesCustomdatacenters {
    [CmdletBinding()]
    param (
        [HashTable]$customDatacenter
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/customdatacenters'
}
Export-ModuleMember New-VrOpsApiResourcesCustomdatacenters

Function New-VrOpsApiAuthSourcesTest {
    [CmdletBinding()]
    param (
        [HashTable]$authSource
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/test'
}
Export-ModuleMember New-VrOpsApiAuthSourcesTest

Function Set-VrOpsApiPoliciesPriorities {
    [CmdletBinding()]
    param (
        [HashTable]$policyPriorities
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/priorities'
}
Export-ModuleMember Set-VrOpsApiPoliciesPriorities

Function New-VrOpsApiSupermetrics {
    [CmdletBinding()]
    param (
        [HashTable]$superMetric
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/supermetrics'
}
Export-ModuleMember New-VrOpsApiSupermetrics

Function Get-VrOpsApiContentBackupResult {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/backup/result'
}
Export-ModuleMember Get-VrOpsApiContentBackupResult

Function Set-VrOpsApiAdapters {
    [CmdletBinding()]
    param (
        [HashTable]$info
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters'
}
Export-ModuleMember Set-VrOpsApiAdapters

Function Get-VrOpsApiReportdefinitions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][HashTable[]]$others,
        [Parameter(ParameterSetName='Search')][String[]]$name,
        [Parameter(ParameterSetName='Search')][String[]]$owner,
        [Parameter(ParameterSetName='Search')][String[]]$subject
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiReportdefinitions

Function New-VrOpsApiOptimizationWorkloadplacementHistoryQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$wlpHistoryQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/history/query'
}
Export-ModuleMember New-VrOpsApiOptimizationWorkloadplacementHistoryQuery

Function Get-VrOpsApiResourcesGroupsMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$groupId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups/{groupId}/members'
}
Export-ModuleMember Get-VrOpsApiResourcesGroupsMembers

Function Set-VrOpsApiApplicationsAgentsServices {
    [CmdletBinding()]
    param (
        [HashTable]$services,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/{id}/services'
}
Export-ModuleMember Set-VrOpsApiApplicationsAgentsServices

Function Remove-VrOpsApiAlertsBulk {
    [CmdletBinding()]
    param (
        [HashTable]$alertQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/bulk'
}
Export-ModuleMember Remove-VrOpsApiAlertsBulk

Function Remove-VrOpsApiAuthScopes {
    [CmdletBinding()]
    param (
        [HashTable]$scopeIds
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/scopes'
}
Export-ModuleMember Remove-VrOpsApiAuthScopes

Function Get-VrOpsApiAlerts {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][String[]]$resourceId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAlerts

Function Get-VrOpsApiDeploymentLicenses {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/licenses'
}
Export-ModuleMember Get-VrOpsApiDeploymentLicenses

Function Set-VrOpsApiOptimizationWorkloadplacementCrossdcmoveDisable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/crossdcmove/disable'
}
Export-ModuleMember Set-VrOpsApiOptimizationWorkloadplacementCrossdcmoveDisable

Function Set-VrOpsApiPoliciesAssign {
    [CmdletBinding()]
    param (
        [HashTable]$policyAssignmentParam,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/{id}/assign'
}
Export-ModuleMember Set-VrOpsApiPoliciesAssign

Function Set-VrOpsApiSymptomdefinitions {
    [CmdletBinding()]
    param (
        [HashTable]$symptomDefinition
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/symptomdefinitions'
}
Export-ModuleMember Set-VrOpsApiSymptomdefinitions

Function Set-VrOpsApiAuthRoles {
    [CmdletBinding()]
    param (
        [HashTable]$role
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles'
}
Export-ModuleMember Set-VrOpsApiAuthRoles

Function Remove-VrOpsApiAuthRolesPrivileges {
    [CmdletBinding()]
    param (
        [HashTable]$privileges,
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles/{roleName}/privileges'
}
Export-ModuleMember Remove-VrOpsApiAuthRolesPrivileges

Function Remove-VrOpsApiChargebackNotificationsRules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/notifications/rules/{id}'
}
Export-ModuleMember Remove-VrOpsApiChargebackNotificationsRules

Function Search-VrOpsApiAuthSourcesUsergroups {
    [CmdletBinding()]
    param (
        [HashTable]$query,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/{id}/usergroups/search'
}
Export-ModuleMember Search-VrOpsApiAuthSourcesUsergroups

Function New-VrOpsApiReportdefinitionsSchedules {
    [CmdletBinding()]
    param (
        [HashTable]$reportSchedule,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$XOpsAPITimezone
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions/{id}/schedules'
}
Export-ModuleMember New-VrOpsApiReportdefinitionsSchedules

Function New-VrOpsApiNotificationsTemplates {
    [CmdletBinding()]
    param (
        [HashTable]$notificationTemplate
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/templates'
}
Export-ModuleMember New-VrOpsApiNotificationsTemplates

Function Set-VrOpsApiResourcesGroups {
    [CmdletBinding()]
    param (
        [HashTable]$customGroup
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups'
}
Export-ModuleMember Set-VrOpsApiResourcesGroups

Function New-VrOpsApiChargebackReports {
    [CmdletBinding()]
    param (
        [HashTable]$report
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reports'
}
Export-ModuleMember New-VrOpsApiChargebackReports

Function New-VrOpsApiAlertsNotes {
    [CmdletBinding()]
    param (
        [HashTable]$noteContent,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/{id}/notes'
}
Export-ModuleMember New-VrOpsApiAlertsNotes

Function Remove-VrOpsApiPoliciesSettings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][ValidateSet('VCD_PRICING_POLICY_TYPE','VCD_COMPUTE_RATE','VCD_STORAGE_RATE','VCD_CLOUDIAN_STORAGE','VCD_NETWORK_RATE','VCD_ADVANCED_NETWORK_RATE','VCD_GUEST_OS_RATE','VCD_CLOUD_DIRECTOR_AVAILABILITY','VCD_VCENTER_TAG_RATE','VCD_METADATA_RATE','VCD_ONE_TIME_FIXED_COST','VCD_RATE_FACTORS','VCD_TANZU_KUBERNETES_CLUSTERS','VCD_CSE_KUBERNETES_CLUSTERS','VCD_ADDITIONAL_FIXED_COST','VC_PRICING_POLICY_STATUS','VC_PRICING_BASIC_CHARGES','VC_PRICING_GUEST_OS_RATE','VC_PRICING_TAGS','VC_PRICING_OVERALL_CHARGES','WORKLOAD_AUTOMATION_OPTIMIZATION','WORKLOAD_AUTOMATION_MINIMUM_HEADROOM','WORKLOAD_AUTOMATION_CHANGE_DATASTORE','WORKLOAD_AUTOMATION_NETWORK','CAPACITY_ALLOCATION_MODEL','CAPACITY_CUSTOM_PROFILE','CAPACITY_BUFFER','TIME_REMAINING','CAPACITY_REMAINING','WORKLOAD')][String[]]$type,
        [String[]]$resourceKind,
        [String]$adapterKind
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/{id}/settings'
}
Export-ModuleMember Remove-VrOpsApiPoliciesSettings

Function Remove-VrOpsApiAdapters {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$adapterId,
        [Parameter(Mandatory,Position=0)][Switch]$deleteResources
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}'
}
Export-ModuleMember Remove-VrOpsApiAdapters

Function Remove-VrOpsApiAlertdefinitions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions/{id}'
}
Export-ModuleMember Remove-VrOpsApiAlertdefinitions

Function Get-VrOpsApiAdaptersResources {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [Parameter(Mandatory,Position=0)][String]$adapterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}/resources'
}
Export-ModuleMember Get-VrOpsApiAdaptersResources

Function Set-VrOpsApiMaintenanceschedules {
    [CmdletBinding()]
    param (
        [HashTable]$schedule
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/maintenanceschedules'
}
Export-ModuleMember Set-VrOpsApiMaintenanceschedules

Function Get-VrOpsApiContentProgress {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/progress'
}
Export-ModuleMember Get-VrOpsApiContentProgress

Function Remove-VrOpsApiChargebackBills {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/bills/{id}'
}
Export-ModuleMember Remove-VrOpsApiChargebackBills

Function Remove-VrOpsApiAuthSources {
    [CmdletBinding()]
    param (
        [HashTable]$authSourcePropertiesList,
        [Parameter(Mandatory,Position=0)][String]$sourceId,
        [Switch]$force
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/{sourceId}'
}
Export-ModuleMember Remove-VrOpsApiAuthSources

Function Set-VrOpsApiAdaptersMonitoringstateStop {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$adapterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}/monitoringstate/stop'
}
Export-ModuleMember Set-VrOpsApiAdaptersMonitoringstateStop

Function Set-VrOpsApiAuthUsersPasswordchange {
    [CmdletBinding()]
    param (
        [HashTable]$passwordChange
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/passwordchange'
}
Export-ModuleMember Set-VrOpsApiAuthUsersPasswordchange

Function New-VrOpsApiResourcesProfiles {
    [CmdletBinding()]
    param (
        [HashTable]$customProfile
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/profiles'
}
Export-ModuleMember New-VrOpsApiResourcesProfiles

Function Get-VrOpsApiCredentialkinds {
    [CmdletBinding()]
    param (
        [String[]]$adapterKind
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentialkinds'
}
Export-ModuleMember Get-VrOpsApiCredentialkinds

Function Get-VrOpsApiAlertsContributingsymptoms {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/contributingsymptoms'
}
Export-ModuleMember Get-VrOpsApiAlertsContributingsymptoms

Function Set-VrOpsApiResources {
    [CmdletBinding()]
    param (
        [HashTable]$resource
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources'
}
Export-ModuleMember Set-VrOpsApiResources

Function Get-VrOpsApiAuthPrivilegegroups {
    [CmdletBinding()]
    param (
        [String[]]$key
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/privilegegroups'
}
Export-ModuleMember Get-VrOpsApiAuthPrivilegegroups

Function Set-VrOpsApiPoliciesDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/default'
}
Export-ModuleMember Set-VrOpsApiPoliciesDefault

Function New-VrOpsApiApplicationsVccpmappingsQuery {
    [CmdletBinding()]
    param (
        [HashTable]$vCenterToCloudProxyQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/vccpmappings/query'
}
Export-ModuleMember New-VrOpsApiApplicationsVccpmappingsQuery

Function Remove-VrOpsApiReportdefinitionsSchedules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$scheduleId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions/{id}/schedules/{scheduleId}'
}
Export-ModuleMember Remove-VrOpsApiReportdefinitionsSchedules

Function Set-VrOpsApiAuthUsergroupsPermissions {
    [CmdletBinding()]
    param (
        [HashTable]$body,
        [Parameter(Mandatory,Position=0)][String]$groupId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups/{groupId}/permissions'
}
Export-ModuleMember Set-VrOpsApiAuthUsergroupsPermissions

Function Get-VrOpsApiOptimizationWorkloadplacementSettings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/settings'
}
Export-ModuleMember Get-VrOpsApiOptimizationWorkloadplacementSettings

Function Get-VrOpsApiAdapterkindsResources {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [Parameter(Mandatory,Position=0)][String]$adapterKindKey
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{adapterKindKey}/resources'
}
Export-ModuleMember Get-VrOpsApiAdapterkindsResources

Function New-VrOpsApiEvents {
    [CmdletBinding()]
    param (
        [HashTable]$eventX
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/events'
}
Export-ModuleMember New-VrOpsApiEvents

Function Set-VrOpsApiResourcesProfiles {
    [CmdletBinding()]
    param (
        [HashTable]$customProfile
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/profiles'
}
Export-ModuleMember Set-VrOpsApiResourcesProfiles

Function Get-VrOpsApiPoliciesSettings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][ValidateSet('VCD_PRICING_POLICY_TYPE','VCD_COMPUTE_RATE','VCD_STORAGE_RATE','VCD_CLOUDIAN_STORAGE','VCD_NETWORK_RATE','VCD_ADVANCED_NETWORK_RATE','VCD_GUEST_OS_RATE','VCD_CLOUD_DIRECTOR_AVAILABILITY','VCD_VCENTER_TAG_RATE','VCD_METADATA_RATE','VCD_ONE_TIME_FIXED_COST','VCD_RATE_FACTORS','VCD_TANZU_KUBERNETES_CLUSTERS','VCD_CSE_KUBERNETES_CLUSTERS','VCD_ADDITIONAL_FIXED_COST','VC_PRICING_POLICY_STATUS','VC_PRICING_BASIC_CHARGES','VC_PRICING_GUEST_OS_RATE','VC_PRICING_TAGS','VC_PRICING_OVERALL_CHARGES','WORKLOAD_AUTOMATION_OPTIMIZATION','WORKLOAD_AUTOMATION_MINIMUM_HEADROOM','WORKLOAD_AUTOMATION_CHANGE_DATASTORE','WORKLOAD_AUTOMATION_NETWORK','CAPACITY_ALLOCATION_MODEL','CAPACITY_CUSTOM_PROFILE','CAPACITY_BUFFER','TIME_REMAINING','CAPACITY_REMAINING','WORKLOAD')][String[]]$type,
        [String[]]$resourceKind,
        [String]$adapterKind,
        [Switch]$includeInherited
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/{id}/settings'
}
Export-ModuleMember Get-VrOpsApiPoliciesSettings

Function Remove-VrOpsApiResources {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}'
}
Export-ModuleMember Remove-VrOpsApiResources

Function New-VrOpsApiAlerts {
    [CmdletBinding()]
    param (
        [BigInt]$minutes,
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$alertIdList,
        [Parameter(Mandatory,Position=0)][String]$action,
        [String]$userAccountID
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts'
}
Export-ModuleMember New-VrOpsApiAlerts

Function Get-VrOpsApiAdapterkindsResourcekindsProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$adapterKindKey,
        [Parameter(Mandatory,Position=0)][String]$resourceKindKey,
        [String[]]$properties,
        [Switch]$retrieveAllLocalizations,
        [Switch]$retrieveAttributeKeys
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}/properties'
}
Export-ModuleMember Get-VrOpsApiAdapterkindsResourcekindsProperties

Function Get-VrOpsApiProductLicensingEdition {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/product/licensing/edition'
}
Export-ModuleMember Get-VrOpsApiProductLicensingEdition

Function New-VrOpsApiResourcesGroupsTypes {
    [CmdletBinding()]
    param (
        [HashTable]$groupType
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups/types'
}
Export-ModuleMember New-VrOpsApiResourcesGroupsTypes

Function New-VrOpsApiAlertplugins {
    [CmdletBinding()]
    param (
        [HashTable]$notificationPlugin
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins'
}
Export-ModuleMember New-VrOpsApiAlertplugins

Function New-VrOpsApiCertificate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][System.IO.FileInfo]$certificateFile
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/certificate'
}
Export-ModuleMember New-VrOpsApiCertificate

Function Set-VrOpsApiReportdefinitionsSchedules {
    [CmdletBinding()]
    param (
        [HashTable]$reportSchedule,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions/{id}/schedules'
}
Export-ModuleMember Set-VrOpsApiReportdefinitionsSchedules

Function New-VrOpsApiContentBackup {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/backup'
}
Export-ModuleMember New-VrOpsApiContentBackup

Function New-VrOpsApiAuthTokenAcquire {
    [CmdletBinding()]
    param (
        [HashTable]$userPassword
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/token/acquire'
}
Export-ModuleMember New-VrOpsApiAuthTokenAcquire

Function Remove-VrOpsApiResourcesMaintained {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idmaintained' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/maintained' } 
        'maintained' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/maintained' } 
    }
}
Export-ModuleMember Remove-VrOpsApiResourcesMaintained

Function Set-VrOpsApiAlertdefinitionsEnable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$policyId,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions/{id}/enable'
}
Export-ModuleMember Set-VrOpsApiAlertdefinitionsEnable

Function Set-VrOpsApiAuthSources {
    [CmdletBinding()]
    param (
        [HashTable]$authSource
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources'
}
Export-ModuleMember Set-VrOpsApiAuthSources

Function Get-VrOpsApiCredentialsAdapters {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials/{id}/adapters'
}
Export-ModuleMember Get-VrOpsApiCredentialsAdapters

Function New-VrOpsApiApplicationsAgents {
    [CmdletBinding()]
    param (
        [HashTable]$resourceCredentials
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents'
}
Export-ModuleMember New-VrOpsApiApplicationsAgents

Function Get-VrOpsApiDeploymentNodeStatus {
    [CmdletBinding()]
    param (
        [String[]]$services
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/node/status'
}
Export-ModuleMember Get-VrOpsApiDeploymentNodeStatus

Function Get-VrOpsApiChargebackReportdefinitionsSchedules {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='scheduleId')][String]$scheduleId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][Switch]$includeResourcelessSchedules
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reportdefinitions/{id}/schedules' } 
        'scheduleId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reportdefinitions/{id}/schedules/{scheduleId}' } 
    }
}
Export-ModuleMember Get-VrOpsApiChargebackReportdefinitionsSchedules

Function Get-VrOpsApiMaintenanceschedules {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [String[]]$id,
        [String[]]$name,
        [String[]]$resourceId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/maintenanceschedules'
}
Export-ModuleMember Get-VrOpsApiMaintenanceschedules

Function Get-VrOpsApiDeploymentNodeServicesInfo {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='nameinfo')][ValidateSet('UI','ADMINUI','CASA','ANALYTICS','COLLECTOR','API','CASSANDRA','LOCATOR','UNKNOWN')][String]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'nameinfo' { Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/node/services/{name}/info' } 
        'info' { Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/node/services/info' } 
    }
}
Export-ModuleMember Get-VrOpsApiDeploymentNodeServicesInfo

Function New-VrOpsApiPoliciesApply {
    [CmdletBinding()]
    param (
        [HashTable]$policyGroup
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/apply'
}
Export-ModuleMember New-VrOpsApiPoliciesApply

Function Get-VrOpsApiAlertdefinitions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][String]$adapterKind,
        [Parameter(ParameterSetName='Search')][String]$resourceKind
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAlertdefinitions

Function Set-VrOpsApiAuthUsergroupsTraversalspecs {
    [CmdletBinding()]
    param (
        [HashTable]$instance,
        [Parameter(Mandatory,Position=0)][String]$groupId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups/{groupId}/traversalspecs'
}
Export-ModuleMember Set-VrOpsApiAuthUsergroupsTraversalspecs

Function Get-VrOpsApiResourcesStats {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$begin,
        [BigInt]$end,
        [BigInt]$intervalQuantifier,
        [BigInt]$latestMaxSamples,
        [Parameter(Mandatory,Position=0,ParameterSetName='idstats')][String]$id,
        [String[]]$resourceId,
        [String[]]$statKey,
        [Switch]$currentOnly,
        [Switch]$dt,
        [Switch]$metrics,
        [Switch]$wrapStatValues,
        [ValidateSet('HOURS','MINUTES','SECONDS','DAYS','WEEKS','MONTHS','YEARS')][String]$intervalType,
        [ValidateSet('SUM','AVG','MIN','MAX','NONE','LATEST','COUNT')][String]$rollUpType
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idstats' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats' } 
        'stats' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesStats

Function New-VrOpsApiMaintenanceschedules {
    [CmdletBinding()]
    param (
        [HashTable]$schedule
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/maintenanceschedules'
}
Export-ModuleMember New-VrOpsApiMaintenanceschedules

Function Get-VrOpsApiAuthRolesPrivileges {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles/{roleName}/privileges'
}
Export-ModuleMember Get-VrOpsApiAuthRolesPrivileges

Function Set-VrOpsApiApplicationsVcenterRemove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$appMonitoringUrl,
        [Parameter(Mandatory,Position=0)][String]$vcUrl
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/vcenter/remove'
}
Export-ModuleMember Set-VrOpsApiApplicationsVcenterRemove

Function Set-VrOpsApiAuthRolesPrivileges {
    [CmdletBinding()]
    param (
        [HashTable]$privileges,
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles/{roleName}/privileges'
}
Export-ModuleMember Set-VrOpsApiAuthRolesPrivileges

Function New-VrOpsApiPolicies {
    [CmdletBinding()]
    param (
        [HashTable]$policy
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies'
}
Export-ModuleMember New-VrOpsApiPolicies

Function New-VrOpsApiChargebackNotificationsRules {
    [CmdletBinding()]
    param (
        [HashTable]$rule
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/notifications/rules'
}
Export-ModuleMember New-VrOpsApiChargebackNotificationsRules

Function Set-VrOpsApiApplicationsSubscribe {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$ostype,
        [Parameter(Mandatory,Position=0)][String]$vmIp,
        [String]$collectorIP_or_GroupNm
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/subscribe'
}
Export-ModuleMember Set-VrOpsApiApplicationsSubscribe

Function Set-VrOpsApiAuthSourcesUsergroupsSynchronize {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/{id}/usergroups/synchronize'
}
Export-ModuleMember Set-VrOpsApiAuthSourcesUsergroupsSynchronize

Function Set-VrOpsApiResourcesRelationships {
    [CmdletBinding()]
    param (
        [HashTable]$relatedIds,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][ValidateSet('parents','children')][String]$relationshipType
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/relationships/{relationshipType}'
}
Export-ModuleMember Set-VrOpsApiResourcesRelationships

Function Get-VrOpsApiDeploymentConfigGlobalsettingsMetadata {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/config/globalsettings/metadata'
}
Export-ModuleMember Get-VrOpsApiDeploymentConfigGlobalsettingsMetadata

Function Get-VrOpsApiChargebackReports {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][HashTable[]]$others,
        [Parameter(ParameterSetName='Search')][String[]]$name,
        [Parameter(ParameterSetName='Search')][String[]]$resourceId,
        [Parameter(ParameterSetName='Search')][String[]]$status,
        [Parameter(ParameterSetName='Search')][String[]]$subject
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reports/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reports' } 
    }
}
Export-ModuleMember Get-VrOpsApiChargebackReports

Function Set-VrOpsApiAuthUsersTraversalspecs {
    [CmdletBinding()]
    param (
        [HashTable]$instance,
        [Parameter(Mandatory,Position=0)][String]$userId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/{userId}/traversalspecs'
}
Export-ModuleMember Set-VrOpsApiAuthUsersTraversalspecs

Function Get-VrOpsApiResourcesGroupsTypes {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups/types'
}
Export-ModuleMember Get-VrOpsApiResourcesGroupsTypes

Function Get-VrOpsApiAuthUsergroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][String[]]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups' } 
    }
}
Export-ModuleMember Get-VrOpsApiAuthUsergroups

Function Get-VrOpsApiContentOperationsExportZip {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/operations/export/zip'
}
Export-ModuleMember Get-VrOpsApiContentOperationsExportZip

Function Get-VrOpsApiAuthRoles {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$roleName
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles' } 
        'roleName' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles/{roleName}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAuthRoles

Function Get-VrOpsApiContentOperationsExport {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/operations/export'
}
Export-ModuleMember Get-VrOpsApiContentOperationsExport

Function Get-VrOpsApiSolutionsAdapterkinds {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$solutionId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/solutions/{solutionId}/adapterkinds'
}
Export-ModuleMember Get-VrOpsApiSolutionsAdapterkinds

Function Remove-VrOpsApiMaintenanceschedules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/maintenanceschedules'
}
Export-ModuleMember Remove-VrOpsApiMaintenanceschedules

Function New-VrOpsApiResourcesStatsLatestQuery {
    [CmdletBinding()]
    param (
        [HashTable]$latestStatQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats/latest/query'
}
Export-ModuleMember New-VrOpsApiResourcesStatsLatestQuery

Function New-VrOpsApiDeploymentLicenses {
    [CmdletBinding()]
    param (
        [HashTable]$solutionLicenseKeys
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/licenses'
}
Export-ModuleMember New-VrOpsApiDeploymentLicenses

Function Get-VrOpsApiApplicationsServices {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$name
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/services/{name}'
}
Export-ModuleMember Get-VrOpsApiApplicationsServices

Function Get-VrOpsApiResourcesStatsLatest {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$maxSamples,
        [Parameter(Mandatory,Position=0,ParameterSetName='idstatslatest')][String]$id,
        [String[]]$resourceId,
        [String[]]$statKey,
        [Switch]$currentOnly,
        [Switch]$metrics,
        [Switch]$wrapStatValues
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'statslatest' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats/latest' } 
        'idstatslatest' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats/latest' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesStatsLatest

Function Get-VrOpsApiAuthCurrentuserPermissions {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/currentuser/permissions'
}
Export-ModuleMember Get-VrOpsApiAuthCurrentuserPermissions

Function New-VrOpsApiAlertsQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$alertQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/query'
}
Export-ModuleMember New-VrOpsApiAlertsQuery

Function New-VrOpsApiAdaptersTestconnection {
    [CmdletBinding()]
    param (
        [HashTable]$connectionRequest
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/testConnection'
}
Export-ModuleMember New-VrOpsApiAdaptersTestconnection

Function Get-VrOpsApiVersionsCurrent {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/versions/current'
}
Export-ModuleMember Get-VrOpsApiVersionsCurrent

Function New-VrOpsApiResourcesProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idproperties')][String]$id,
        [Parameter(ParameterSetName='idproperties')][HashTable]$contents,
        [Parameter(ParameterSetName='properties')][HashTable]$resourcesProperties
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idproperties' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/properties' } 
        'properties' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/properties' } 
    }
}
Export-ModuleMember New-VrOpsApiResourcesProperties

Function Get-VrOpsApiApplicationsAgentsServices {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='name')][String]$name,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/{id}/services' } 
        'name' { Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/{id}/services/{name}' } 
    }
}
Export-ModuleMember Get-VrOpsApiApplicationsAgentsServices

Function Set-VrOpsApiAdaptersMonitoringstateStart {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$adapterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}/monitoringstate/start'
}
Export-ModuleMember Set-VrOpsApiAdaptersMonitoringstateStart

Function New-VrOpsApiAuthScopes {
    [CmdletBinding()]
    param (
        [HashTable]$scope
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/scopes'
}
Export-ModuleMember New-VrOpsApiAuthScopes

Function New-VrOpsApiCredentials {
    [CmdletBinding()]
    param (
        [HashTable]$dto
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials'
}
Export-ModuleMember New-VrOpsApiCredentials

Function Get-VrOpsApiAdapterkinds {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][String[]]$adapterKindKey,
        [Switch]$retrieveResourceKindInfos
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAdapterkinds

Function Get-VrOpsApiAdapterkindsResourcekindsStatkeys {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$adapterKindKey,
        [Parameter(Mandatory,Position=0)][String]$resourceKindKey,
        [String[]]$attributeKeys,
        [Switch]$retrieveAllLocalizations,
        [Switch]$retrieveAttributeKeys,
        [Switch]$statOnly
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}/statkeys'
}
Export-ModuleMember Get-VrOpsApiAdapterkindsResourcekindsStatkeys

Function Update-VrOpsApiAdaptersTestconnection {
    [CmdletBinding()]
    param (
        [HashTable]$patchRequest
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/testConnection'
}
Export-ModuleMember Update-VrOpsApiAdaptersTestconnection

Function New-VrOpsApiEventsBulkAdapterkinds {
    [CmdletBinding()]
    param (
        [HashTable]$eventList,
        [Parameter(Mandatory,Position=0)][String]$adapterKind
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/events/bulk/adapterkinds/{adapterKind}'
}
Export-ModuleMember New-VrOpsApiEventsBulkAdapterkinds

Function New-VrOpsApiApplicationsAgentsServices {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$services,
        [Parameter(Mandatory,Position=0,ParameterSetName='idservices')][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idservices' { Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/{id}/services' } 
        'services' { Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/services' } 
    }
}
Export-ModuleMember New-VrOpsApiApplicationsAgentsServices

Function Remove-VrOpsApiAuthUsergroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups' } 
    }
}
Export-ModuleMember Remove-VrOpsApiAuthUsergroups

Function New-VrOpsApiResourcesStatsAdapterkinds {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$contents,
        [Parameter(Mandatory,Position=0,ParameterSetName='idstatsadapterkindsadapterKind')][String]$id,
        [Parameter(Mandatory,Position=0)][String]$adapterKind,
        [Switch]$disableAnalyticsProcessing
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idstatsadapterkindsadapterKind' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats/adapterkinds/{adapterKind}' } 
        'statsadapterkindsadapterKind' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats/adapterkinds/{adapterKind}' } 
    }
}
Export-ModuleMember New-VrOpsApiResourcesStatsAdapterkinds

Function Get-VrOpsApiSolutionsLicenses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$solutionId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/solutions/{solutionId}/licenses'
}
Export-ModuleMember Get-VrOpsApiSolutionsLicenses

Function Get-VrOpsApiAuthSources {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='sourceId')][String]$sourceId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources' } 
        'sourceId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/{sourceId}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAuthSources

Function Set-VrOpsApiLogsForwardingEnable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][ValidateSet('ANALYTICS','COLLECTOR','WEB','GEMFIRE','VIEW_BRIDGE','VCOPS_BRIDGE','SUITEAPI','ADMIN_UI','TOMCAT_WEBAPP','VPOSTGRES','WATCHDOG','UPGRADE','CALL_STACK','OTHER')][String[]]$entity
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/forwarding/enable'
}
Export-ModuleMember Set-VrOpsApiLogsForwardingEnable

Function New-VrOpsApiResourcesStats {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$contents,
        [Parameter(Mandatory,Position=0,ParameterSetName='idstats')][String]$id,
        [Switch]$disableAnalyticsProcessing
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idstats' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats' } 
        'stats' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats' } 
    }
}
Export-ModuleMember New-VrOpsApiResourcesStats

Function Get-VrOpsApiAuthScopes {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='scopeId')][String]$scopeId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'scopeId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/scopes/{scopeId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/scopes' } 
    }
}
Export-ModuleMember Get-VrOpsApiAuthScopes

Function New-VrOpsApiAlertsNotesQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$alertNotesQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/notes/query'
}
Export-ModuleMember New-VrOpsApiAlertsNotesQuery

Function Set-VrOpsApiChargebackNotificationsRules {
    [CmdletBinding()]
    param (
        [HashTable]$rule
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/notifications/rules'
}
Export-ModuleMember Set-VrOpsApiChargebackNotificationsRules

Function Get-VrOpsApiCostconfigCurrency {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/costconfig/currency'
}
Export-ModuleMember Get-VrOpsApiCostconfigCurrency

Function New-VrOpsApiResourcesRelationships {
    [CmdletBinding()]
    param (
        [HashTable]$relatedIds,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][ValidateSet('parents','children')][String]$relationshipType
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/relationships/{relationshipType}'
}
Export-ModuleMember New-VrOpsApiResourcesRelationships

Function Set-VrOpsApiAuthUsersPermissions {
    [CmdletBinding()]
    param (
        [HashTable]$rolePermission,
        [Parameter(Mandatory,Position=0)][String]$userId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/{userId}/permissions'
}
Export-ModuleMember Set-VrOpsApiAuthUsersPermissions

Function Remove-VrOpsApiPricing {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/pricing/{id}'
}
Export-ModuleMember Remove-VrOpsApiPricing

Function Set-VrOpsApiAlertdefinitions {
    [CmdletBinding()]
    param (
        [HashTable]$alertDefinition
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions'
}
Export-ModuleMember Set-VrOpsApiAlertdefinitions

Function Remove-VrOpsApiRecommendations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$force
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/recommendations/{id}'
}
Export-ModuleMember Remove-VrOpsApiRecommendations

Function Set-VrOpsApiResourcesMaintained {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$duration,
        [BigInt]$end,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idmaintained' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/maintained' } 
        'maintained' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/maintained' } 
    }
}
Export-ModuleMember Set-VrOpsApiResourcesMaintained

Function Set-VrOpsApiDeploymentConfigGlobalsettings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$key,
        [Parameter(Mandatory,Position=0)][String]$value
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/config/globalsettings/{key}/{value}'
}
Export-ModuleMember Set-VrOpsApiDeploymentConfigGlobalsettings

Function Get-VrOpsApiLogsForwarding {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/forwarding'
}
Export-ModuleMember Get-VrOpsApiLogsForwarding

Function New-VrOpsApiEventsBulk {
    [CmdletBinding()]
    param (
        [HashTable]$eventList
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/events/bulk'
}
Export-ModuleMember New-VrOpsApiEventsBulk

Function Get-VrOpsApiAuthCurrentuserRolesPrivileges {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/currentuser/roles/{roleName}/privileges'
}
Export-ModuleMember Get-VrOpsApiAuthCurrentuserRolesPrivileges

Function New-VrOpsApiPricing {
    [CmdletBinding()]
    param (
        [HashTable]$policy
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/pricing'
}
Export-ModuleMember New-VrOpsApiPricing

Function Get-VrOpsApiAdapterkindsResourcekinds {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='adapterKindKeyresourcekindsresourceKindKey')][String]$adapterKindKey,
        [Parameter(Mandatory,Position=0,ParameterSetName='adapterKindKeyresourcekindsresourceKindKey')][String]$resourceKindKey,
        [Parameter(Mandatory,Position=0,ParameterSetName='keyresourcekinds')][String]$key,
        [Parameter(ParameterSetName='keyresourcekinds')][BigInt]$page,
        [Parameter(ParameterSetName='keyresourcekinds')][BigInt]$pageSize,
        [Parameter(ParameterSetName='keyresourcekinds')][Switch]$retrieveAllLocalizations,
        [Parameter(ParameterSetName='keyresourcekinds')][ValidateSet('GENERAL','BUSINESS_SERVICE','TIER','TAG','ADAPTER_INSTANCE','GROUP','APPLICATION','NONE')][String]$resourceKindType
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'keyresourcekinds' { Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{key}/resourcekinds' } 
        'adapterKindKeyresourcekindsresourceKindKey' { Invoke-VrOps -PsBP $PsBoundParameters '/api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAdapterkindsResourcekinds

Function New-VrOpsApiResourcesAdapterkinds {
    [CmdletBinding()]
    param (
        [HashTable]$resourceRequest,
        [Parameter(Mandatory,Position=0)][String]$adapterKindKey
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/adapterkinds/{adapterKindKey}'
}
Export-ModuleMember New-VrOpsApiResourcesAdapterkinds

Function Get-VrOpsApiOptimizationWorkloadplacementCrossdcmoveStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/crossdcmove/status'
}
Export-ModuleMember Get-VrOpsApiOptimizationWorkloadplacementCrossdcmoveStatus

Function Set-VrOpsApiAuthUsergroups {
    [CmdletBinding()]
    param (
        [HashTable]$group
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups'
}
Export-ModuleMember Set-VrOpsApiAuthUsergroups

Function Get-VrOpsApiActionsStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$taskId,
        [Switch]$detail
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/actions/{taskId}/status'
}
Export-ModuleMember Get-VrOpsApiActionsStatus

Function Set-VrOpsApiApplicationsVcenterAdd {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$appMonitoringUrl,
        [Parameter(Mandatory,Position=0)][String]$vcUrl
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/vcenter/add'
}
Export-ModuleMember Set-VrOpsApiApplicationsVcenterAdd

Function New-VrOpsApiAuthRolesPrivileges {
    [CmdletBinding()]
    param (
        [HashTable]$privileges,
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles/{roleName}/privileges'
}
Export-ModuleMember New-VrOpsApiAuthRolesPrivileges

Function Set-VrOpsApiNotificationsRules {
    [CmdletBinding()]
    param (
        [HashTable]$rule
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/rules'
}
Export-ModuleMember Set-VrOpsApiNotificationsRules

Function Update-VrOpsApiAuthSourcesTest {
    [CmdletBinding()]
    param (
        [HashTable]$authSource
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources/test'
}
Export-ModuleMember Update-VrOpsApiAuthSourcesTest

Function Get-VrOpsApiCredentialsResources {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials/{id}/resources'
}
Export-ModuleMember Get-VrOpsApiCredentialsResources

Function Get-VrOpsApiReportdefinitionsSchedules {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='scheduleId')][String]$scheduleId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][Switch]$includeResourcelessSchedules
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions/{id}/schedules' } 
        'scheduleId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/reportdefinitions/{id}/schedules/{scheduleId}' } 
    }
}
Export-ModuleMember Get-VrOpsApiReportdefinitionsSchedules

Function Set-VrOpsApiResourcesMonitoringstateStop {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String[]]$adapterId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idmonitoringstatestop' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/monitoringstate/stop' } 
        'monitoringstatestop' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/monitoringstate/stop' } 
    }
}
Export-ModuleMember Set-VrOpsApiResourcesMonitoringstateStop

Function Get-VrOpsApiChargebackReportsDownload {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$format
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reports/{id}/download'
}
Export-ModuleMember Get-VrOpsApiChargebackReportsDownload

Function Get-VrOpsApiResourcesGroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$groupId,
        [Switch]$includePolicy
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'groupId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups/{groupId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesGroups

Function Get-VrOpsApiResourcesCustomdatacenters {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/customdatacenters/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/customdatacenters' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesCustomdatacenters

Function Get-VrOpsApiRecommendations {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id,
        [Parameter(ParameterSetName='Search')][String]$targetAdapterKind,
        [Parameter(ParameterSetName='Search')][String]$targetResourceKind
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/recommendations' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/recommendations/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiRecommendations

Function New-VrOpsApiReports {
    [CmdletBinding()]
    param (
        [HashTable]$report
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/reports'
}
Export-ModuleMember New-VrOpsApiReports

Function Set-VrOpsApiOptimizationWorkloadplacementSettings {
    [CmdletBinding()]
    param (
        [HashTable]$placementSettings,
        [Parameter(Mandatory,Position=0)][String]$dataCenterId,
        [Switch]$deactivateDRSRules
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/settings'
}
Export-ModuleMember Set-VrOpsApiOptimizationWorkloadplacementSettings

Function Get-VrOpsApiAuditSystem {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/audit/system'
}
Export-ModuleMember Get-VrOpsApiAuditSystem

Function Set-VrOpsApiAuthScopes {
    [CmdletBinding()]
    param (
        [HashTable]$scope
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/scopes'
}
Export-ModuleMember Set-VrOpsApiAuthScopes

Function New-VrOpsApiNotificationsRules {
    [CmdletBinding()]
    param (
        [HashTable]$rule
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/rules'
}
Export-ModuleMember New-VrOpsApiNotificationsRules

Function Get-VrOpsApiResourcesStatkeys {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idstatkeys')][String]$id,
        [Parameter(Mandatory,Position=0,ParameterSetName='statkeys')][String]$resourceId,
        [Parameter(ParameterSetName='statkeys')][String]$searchstring
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idstatkeys' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/statkeys' } 
        'statkeys' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/statkeys' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesStatkeys

Function Get-VrOpsApiSymptomdefinitions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][String]$adapterKind,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][String]$resourceKind
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/symptomdefinitions/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/symptomdefinitions' } 
    }
}
Export-ModuleMember Get-VrOpsApiSymptomdefinitions

Function Get-VrOpsApiChargebackNotificationsRules {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/notifications/rules' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/notifications/rules/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiChargebackNotificationsRules

Function Get-VrOpsApiAuthUsergroupsPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$groupId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups/{groupId}/permissions'
}
Export-ModuleMember Get-VrOpsApiAuthUsergroupsPermissions

Function Get-VrOpsApiOptimizationWorkloadplacementAutomationStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/automation/status'
}
Export-ModuleMember Get-VrOpsApiOptimizationWorkloadplacementAutomationStatus

Function Update-VrOpsApiPoliciesSettings {
    [CmdletBinding()]
    param (
        [HashTable]$policySettings,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/{id}/settings'
}
Export-ModuleMember Update-VrOpsApiPoliciesSettings

Function New-VrOpsApiAuthUsers {
    [CmdletBinding()]
    param (
        [HashTable]$user
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users'
}
Export-ModuleMember New-VrOpsApiAuthUsers

Function New-VrOpsApiResourcesQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$resourceQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/query'
}
Export-ModuleMember New-VrOpsApiResourcesQuery

Function Get-VrOpsApiResourcesStatsTopn {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$begin,
        [BigInt]$end,
        [BigInt]$intervalQuantifier,
        [BigInt]$latestMaxSamples,
        [Parameter(Mandatory,Position=0,ParameterSetName='idstatstopn')][String]$id,
        [Parameter(Mandatory,Position=0)][BigInt]$topN,
        [String[]]$resourceId,
        [String[]]$statKey,
        [Switch]$currentOnly,
        [Switch]$dt,
        [Switch]$metrics,
        [Switch]$wrapStatValues,
        [ValidateSet('ASCENDING','DESCENDING')][String]$sortOrder,
        [ValidateSet('HOURS','MINUTES','SECONDS','DAYS','WEEKS','MONTHS','YEARS')][String]$intervalType,
        [ValidateSet('RESOURCE','STATKEY')][String]$groupBy,
        [ValidateSet('SUM','AVG','MIN','MAX','NONE','LATEST','COUNT')][String]$rollUpType
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idstatstopn' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats/topn' } 
        'statstopn' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats/topn' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesStatsTopn

Function Get-VrOpsApiSupermetrics {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][String[]]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/supermetrics/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/supermetrics' } 
    }
}
Export-ModuleMember Get-VrOpsApiSupermetrics

Function Remove-VrOpsApiResourcesBulk {
    [CmdletBinding()]
    param (
        [HashTable]$resourceIds
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/bulk'
}
Export-ModuleMember Remove-VrOpsApiResourcesBulk

Function Set-VrOpsApiApplicationsUnsubscribe {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$ostype,
        [Parameter(Mandatory,Position=0)][String]$vmIp,
        [Parameter(Mandatory,Position=0)][Switch]$cleanup,
        [String]$collectorIP_or_GroupNm
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/unsubscribe'
}
Export-ModuleMember Set-VrOpsApiApplicationsUnsubscribe

Function Get-VrOpsApiAuthPrivileges {
    [CmdletBinding()]
    param (
        [String[]]$key
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/privileges'
}
Export-ModuleMember Get-VrOpsApiAuthPrivileges

Function Get-VrOpsApiApplications {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications'
}
Export-ModuleMember Get-VrOpsApiApplications

Function Get-VrOpsApiDeploymentConfigGlobalsettings {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='key')][String]$key
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'key' { Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/config/globalsettings/{key}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/config/globalsettings' } 
    }
}
Export-ModuleMember Get-VrOpsApiDeploymentConfigGlobalsettings

Function Remove-VrOpsApiAlertplugins {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$pluginId,
        [Switch]$checkDependencies
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/{pluginId}'
}
Export-ModuleMember Remove-VrOpsApiAlertplugins

Function Get-VrOpsApiAlertpluginsRules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$pluginId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/{pluginId}/rules'
}
Export-ModuleMember Get-VrOpsApiAlertpluginsRules

Function Remove-VrOpsApiChargebackReports {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reports/{id}'
}
Export-ModuleMember Remove-VrOpsApiChargebackReports

Function Remove-VrOpsApiReports {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/reports/{id}'
}
Export-ModuleMember Remove-VrOpsApiReports

Function Get-VrOpsApiApplicationsAgentsStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$taskId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/{taskId}/status'
}
Export-ModuleMember Get-VrOpsApiApplicationsAgentsStatus

Function Get-VrOpsApiResourcesProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idproperties')][String]$id,
        [Parameter(Mandatory,Position=0,ParameterSetName='properties')][String[]]$resourceId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idproperties' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/properties' } 
        'properties' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/properties' } 
    }
}
Export-ModuleMember Get-VrOpsApiResourcesProperties

Function Get-VrOpsApiAlertsTypes {
    [CmdletBinding()]
    param (
        [Switch]$ignoreLegacy
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/types'
}
Export-ModuleMember Get-VrOpsApiAlertsTypes

Function Get-VrOpsApiCertificate {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/certificate'
}
Export-ModuleMember Get-VrOpsApiCertificate

Function Get-VrOpsApiAuthUsers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][String[]]$roleName,
        [Parameter(ParameterSetName='Search')][String[]]$username
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users' } 
    }
}
Export-ModuleMember Get-VrOpsApiAuthUsers

Function Get-VrOpsApiLogsConfiguration {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][ValidateSet('ANALYTICS','COLLECTOR','WEB','VIEW_BRIDGE','VCOPS_BRIDGE','SUITEAPI')][String]$logtype
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/configuration/{logtype}'
}
Export-ModuleMember Get-VrOpsApiLogsConfiguration

Function Get-VrOpsApiVersions {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/versions'
}
Export-ModuleMember Get-VrOpsApiVersions

Function Get-VrOpsApiNotificationsRules {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/rules' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/rules/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiNotificationsRules

Function Set-VrOpsApiDeploymentClusterDt {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$action
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/cluster/dt'
}
Export-ModuleMember Set-VrOpsApiDeploymentClusterDt

Function Get-VrOpsApiPoliciesExport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/export'
}
Export-ModuleMember Get-VrOpsApiPoliciesExport

Function New-VrOpsApiContentRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][System.IO.FileInfo]$contentFile,
        [Switch]$forceContentUpdate
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/restore'
}
Export-ModuleMember New-VrOpsApiContentRestore

Function New-VrOpsApiContentOperationsImport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][System.IO.FileInfo]$contentFile,
        [String]$EncryptionPassword,
        [Switch]$force
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/content/operations/import'
}
Export-ModuleMember New-VrOpsApiContentOperationsImport

Function Remove-VrOpsApiAlertsNotes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$noteId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/{id}/notes/{noteId}'
}
Export-ModuleMember Remove-VrOpsApiAlertsNotes

Function Set-VrOpsApiLogsForwardingDisable {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/logs/forwarding/disable'
}
Export-ModuleMember Set-VrOpsApiLogsForwardingDisable

Function New-VrOpsApiCollectorgroups {
    [CmdletBinding()]
    param (
        [HashTable]$collectorGroup,
        [Switch]$checkCollectorMembers
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups'
}
Export-ModuleMember New-VrOpsApiCollectorgroups

Function Get-VrOpsApiProductLicensingEntitlement {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/product/licensing/entitlement'
}
Export-ModuleMember Get-VrOpsApiProductLicensingEntitlement

Function New-VrOpsApiResourcesStatsQuery {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idstatsquery')][String]$id,
        [Parameter(ParameterSetName='idstatsquery')][HashTable]$qs,
        [Parameter(ParameterSetName='statsquery')][HashTable]$sq
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'idstatsquery' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/stats/query' } 
        'statsquery' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/stats/query' } 
    }
}
Export-ModuleMember New-VrOpsApiResourcesStatsQuery

Function Set-VrOpsApiPoliciesUnassign {
    [CmdletBinding()]
    param (
        [HashTable]$policyUnassignmentParam,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/{id}/unassign'
}
Export-ModuleMember Set-VrOpsApiPoliciesUnassign

Function Get-VrOpsApiResources {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt[]]$collectorId,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][BigInt]$recentlyAdded,
        [Parameter(ParameterSetName='Search')][BigInt]$statKeyLowerBound,
        [Parameter(ParameterSetName='Search')][BigInt]$statKeyUpperBound,
        [Parameter(ParameterSetName='Search')][HashTable[]]$others,
        [Parameter(ParameterSetName='Search')][String[]]$adapterInstanceId,
        [Parameter(ParameterSetName='Search')][String[]]$adapterKind,
        [Parameter(ParameterSetName='Search')][String[]]$collectorName,
        [Parameter(ParameterSetName='Search')][String[]]$credentialId,
        [Parameter(ParameterSetName='Search')][String[]]$maintenanceScheduleId,
        [Parameter(ParameterSetName='Search')][String[]]$name,
        [Parameter(ParameterSetName='Search')][String[]]$parentId,
        [Parameter(ParameterSetName='Search')][String[]]$regex,
        [Parameter(ParameterSetName='Search')][String[]]$resourceId,
        [Parameter(ParameterSetName='Search')][String[]]$resourceKind,
        [Parameter(ParameterSetName='Search')][String]$propertyName,
        [Parameter(ParameterSetName='Search')][String]$propertyValue,
        [Parameter(ParameterSetName='Search')][String]$statKey,
        [Parameter(ParameterSetName='Search')][Switch]$statKeyInclusive,
        [Parameter(ParameterSetName='Search')][ValidateSet('GREEN','YELLOW','ORANGE','RED','GREY')][String[]]$resourceHealth,
        [Parameter(ParameterSetName='Search')][ValidateSet('NONE','ERROR','UNKNOWN','DOWN','DATA_RECEIVING','OLD_DATA_RECEIVING','NO_DATA_RECEIVING','NO_PARENT_MONITORING','COLLECTOR_DOWN')][String[]]$resourceStatus,
        [Parameter(ParameterSetName='Search')][ValidateSet('PARENT','CHILD','CONTAINS','CONTAINED_BY','REFERENCES','REFERENCED_BY','USES','USED_BY','SELF','DESCENDANT','ANCESTOR','TST','ALL')][String]$includeRelated,
        [Parameter(ParameterSetName='Search')][ValidateSet('STOPPED','STARTING','STARTED','STOPPING','UPDATING','FAILED','MAINTAINED','MAINTAINED_MANUAL','REMOVING','NOT_EXISTING','NONE','UNKNOWN')][String[]]$resourceState
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources' } 
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}' } 
    }
}
Export-ModuleMember Get-VrOpsApiResources

Function Get-VrOpsApiCollectors {
    [CmdletBinding()]
    param (
        [String[]]$hostX
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectors'
}
Export-ModuleMember Get-VrOpsApiCollectors

Function New-VrOpsApiChargebackBills {
    [CmdletBinding()]
    param (
        [HashTable]$request
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/bills'
}
Export-ModuleMember New-VrOpsApiChargebackBills

Function New-VrOpsApiAlertdefinitions {
    [CmdletBinding()]
    param (
        [HashTable]$alertDefinition
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions'
}
Export-ModuleMember New-VrOpsApiAlertdefinitions

Function New-VrOpsApiActions {
    [CmdletBinding()]
    param (
        [HashTable]$actionExecution,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/actions/{id}'
}
Export-ModuleMember New-VrOpsApiActions

Function Remove-VrOpsApiCollectorgroupsCollector {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$collectorId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$checkCollectorMembers
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups/{id}/collector/{collectorId}'
}
Export-ModuleMember Remove-VrOpsApiCollectorgroupsCollector

Function New-VrOpsApiApplicationsClientcertificate {
    [CmdletBinding()]
    param (
        [HashTable]$certRequest,
        [Parameter(Mandatory,Position=0)][BigInt]$collectorId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/clientCertificate/{collectorId}'
}
Export-ModuleMember New-VrOpsApiApplicationsClientcertificate

Function Set-VrOpsApiCollectorgroups {
    [CmdletBinding()]
    param (
        [HashTable]$collectorGroup,
        [Switch]$checkCollectorMembers
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups'
}
Export-ModuleMember Set-VrOpsApiCollectorgroups

Function Get-VrOpsApiAuthTraversalspecs {
    [CmdletBinding()]
    param (
        [String[]]$adapterKind,
        [String[]]$name,
        [String[]]$resourceKind
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/traversalspecs'
}
Export-ModuleMember Get-VrOpsApiAuthTraversalspecs

Function Get-VrOpsApiNotificationsTemplates {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][String]$description,
        [Parameter(ParameterSetName='Search')][String]$modifiedBy,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][String]$outboundMethod
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/templates/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/templates' } 
    }
}
Export-ModuleMember Get-VrOpsApiNotificationsTemplates

Function Remove-VrOpsApiSymptomdefinitions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/symptomdefinitions/{id}'
}
Export-ModuleMember Remove-VrOpsApiSymptomdefinitions

Function Remove-VrOpsApiSupermetrics {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/supermetrics/{id}'
}
Export-ModuleMember Remove-VrOpsApiSupermetrics

Function Update-VrOpsApiAuthSources {
    [CmdletBinding()]
    param (
        [HashTable]$authSource
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources'
}
Export-ModuleMember Update-VrOpsApiAuthSources

Function Remove-VrOpsApiChargebackEmailconfigurations {
    [CmdletBinding()]
    param (
        [HashTable]$resourceIds
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/emailconfigurations'
}
Export-ModuleMember Remove-VrOpsApiChargebackEmailconfigurations

Function New-VrOpsApiAuthUsergroups {
    [CmdletBinding()]
    param (
        [HashTable]$group
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/usergroups'
}
Export-ModuleMember New-VrOpsApiAuthUsergroups

Function Set-VrOpsApiOptimizationWorkloadplacementAutomationDisable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/automation/disable'
}
Export-ModuleMember Set-VrOpsApiOptimizationWorkloadplacementAutomationDisable

Function New-VrOpsApiAlertdefinitionsQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$alertDefinitionsQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertdefinitions/query'
}
Export-ModuleMember New-VrOpsApiAlertdefinitionsQuery

Function Get-VrOpsApiApplicationsAgentsServicesStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$taskId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/services/{taskId}/status'
}
Export-ModuleMember Get-VrOpsApiApplicationsAgentsServicesStatus

Function Remove-VrOpsApiOptimizationWorkloadplacementSettings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/settings'
}
Export-ModuleMember Remove-VrOpsApiOptimizationWorkloadplacementSettings

Function Update-VrOpsApiAdapters {
    [CmdletBinding()]
    param (
        [HashTable]$info
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters'
}
Export-ModuleMember Update-VrOpsApiAdapters

Function Get-VrOpsApiSolutions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='solutionId')][String]$solutionId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'solutionId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/solutions/{solutionId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/solutions' } 
    }
}
Export-ModuleMember Get-VrOpsApiSolutions

Function New-VrOpsApiResourcesPropertiesLatestQuery {
    [CmdletBinding()]
    param (
        [HashTable]$query
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/properties/latest/query'
}
Export-ModuleMember New-VrOpsApiResourcesPropertiesLatestQuery

Function Remove-VrOpsApiPolicies {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$deleteDescendants
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/{id}'
}
Export-ModuleMember Remove-VrOpsApiPolicies

Function Get-VrOpsApiPolicies {
    [CmdletBinding()]
    param (
        [Switch]$activesOnly
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies'
}
Export-ModuleMember Get-VrOpsApiPolicies

Function Get-VrOpsApiAuthSourcetypes {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='sourceId')][String]$sourceId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sourcetypes' } 
        'sourceId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sourcetypes/{sourceId}' } 
    }
}
Export-ModuleMember Get-VrOpsApiAuthSourcetypes

Function New-VrOpsApiSymptomsQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$symptomQuery
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/symptoms/query'
}
Export-ModuleMember New-VrOpsApiSymptomsQuery

Function Set-VrOpsApiCredentials {
    [CmdletBinding()]
    param (
        [HashTable]$dto
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/credentials'
}
Export-ModuleMember Set-VrOpsApiCredentials

Function New-VrOpsApiResourcesPropertiesAdapterkinds {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idpropertiesadapterkindsadapterKind')][String]$id,
        [Parameter(Mandatory,Position=0)][String]$adapterKind,
        [Parameter(ParameterSetName='idpropertiesadapterkindsadapterKind')][HashTable]$contents,
        [Parameter(ParameterSetName='propertiesadapterkindsadapterKind')][HashTable]$resourcesProperties
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'propertiesadapterkindsadapterKind' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/properties/adapterkinds/{adapterKind}' } 
        'idpropertiesadapterkindsadapterKind' { Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/properties/adapterkinds/{adapterKind}' } 
    }
}
Export-ModuleMember New-VrOpsApiResourcesPropertiesAdapterkinds

Function Remove-VrOpsApiResourcesGroups {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$groupId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups/{groupId}'
}
Export-ModuleMember Remove-VrOpsApiResourcesGroups

Function Set-VrOpsApiRecommendations {
    [CmdletBinding()]
    param (
        [HashTable]$recommendation
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/recommendations'
}
Export-ModuleMember Set-VrOpsApiRecommendations

Function Remove-VrOpsApiNotificationsRules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/rules/{id}'
}
Export-ModuleMember Remove-VrOpsApiNotificationsRules

Function New-VrOpsApiChargebackBillsQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$request,
        [ValidateSet('ASC','DESC')][String]$sortOrder,
        [ValidateSet('RESOURCE_NAME','POLICY_NAME','TITLE','START_TIME','END_TIME','EXECUTION_TIME','TOTAL_PRICE','RESOURCE_TYPE','ASSIGNED_TO_TENANT')][String]$sortBy
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/bills/query'
}
Export-ModuleMember New-VrOpsApiChargebackBillsQuery

Function New-VrOpsApiAuthRoles {
    [CmdletBinding()]
    param (
        [HashTable]$role
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles'
}
Export-ModuleMember New-VrOpsApiAuthRoles

Function Get-VrOpsApiAlertpluginsTypes {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='pluginTypeId')][String]$pluginTypeId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'pluginTypeId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/types/{pluginTypeId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/types' } 
    }
}
Export-ModuleMember Get-VrOpsApiAlertpluginsTypes

Function Set-VrOpsApiOptimizationWorkloadplacementAutomationEnable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dataCenterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/optimization/workloadplacement/{dataCenterId}/automation/enable'
}
Export-ModuleMember Set-VrOpsApiOptimizationWorkloadplacementAutomationEnable

Function Set-VrOpsApiApplicationsAgentsStart {
    [CmdletBinding()]
    param (
        [HashTable]$resourceIDs
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/start'
}
Export-ModuleMember Set-VrOpsApiApplicationsAgentsStart

Function New-VrOpsApiSolutionsLicenses {
    [CmdletBinding()]
    param (
        [HashTable]$solutionLicenseKeys,
        [Parameter(Mandatory,Position=0)][String]$solutionId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/solutions/{solutionId}/licenses'
}
Export-ModuleMember New-VrOpsApiSolutionsLicenses

Function Get-VrOpsApiAuthUsersPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$userId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users/{userId}/permissions'
}
Export-ModuleMember Get-VrOpsApiAuthUsersPermissions

Function Set-VrOpsApiAdaptersMaintained {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$duration,
        [Parameter(Mandatory,Position=0)][String]$adapterId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters/{adapterId}/maintained'
}
Export-ModuleMember Set-VrOpsApiAdaptersMaintained

Function Remove-VrOpsApiResourcesGroupsTypes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$key
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups/types/{key}'
}
Export-ModuleMember Remove-VrOpsApiResourcesGroupsTypes

Function Get-VrOpsApiCollectorsAdapters {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectors/{id}/adapters'
}
Export-ModuleMember Get-VrOpsApiCollectorsAdapters

Function New-VrOpsApiPoliciesImport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][System.IO.FileInfo]$policy,
        [Switch]$forceImport
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/policies/import'
}
Export-ModuleMember New-VrOpsApiPoliciesImport

Function New-VrOpsApiRecommendations {
    [CmdletBinding()]
    param (
        [HashTable]$recommendation
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/recommendations'
}
Export-ModuleMember New-VrOpsApiRecommendations

Function Set-VrOpsApiAuthUsers {
    [CmdletBinding()]
    param (
        [HashTable]$user
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/users'
}
Export-ModuleMember Set-VrOpsApiAuthUsers

Function Update-VrOpsApiAlertplugins {
    [CmdletBinding()]
    param (
        [HashTable]$notificationPlugin
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins'
}
Export-ModuleMember Update-VrOpsApiAlertplugins

Function Remove-VrOpsApiSolutionsLicenses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$licenseId,
        [Parameter(Mandatory,Position=0)][String]$solutionId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/solutions/{solutionId}/licenses/{licenseId}'
}
Export-ModuleMember Remove-VrOpsApiSolutionsLicenses

Function Remove-VrOpsApiCollectorgroups {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$checkCollectorMembers
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups/{id}'
}
Export-ModuleMember Remove-VrOpsApiCollectorgroups

Function Set-VrOpsApiChargebackReportdefinitionsSchedules {
    [CmdletBinding()]
    param (
        [HashTable]$reportSchedule,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/reportdefinitions/{id}/schedules'
}
Export-ModuleMember Set-VrOpsApiChargebackReportdefinitionsSchedules

Function Set-VrOpsApiApplicationsAgentsStop {
    [CmdletBinding()]
    param (
        [HashTable]$resourceIDs
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents/stop'
}
Export-ModuleMember Set-VrOpsApiApplicationsAgentsStop

Function Get-VrOpsApiDeploymentLicensesGroups {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/deployment/licenses/groups'
}
Export-ModuleMember Get-VrOpsApiDeploymentLicensesGroups

Function Set-VrOpsApiResourcesGeolocation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$latitude,
        [Parameter(Mandatory,Position=0)][BigInt]$longitude,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/{id}/geolocation'
}
Export-ModuleMember Set-VrOpsApiResourcesGeolocation

Function Get-VrOpsApiReports {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize,
        [Parameter(ParameterSetName='Search')][HashTable[]]$others,
        [Parameter(ParameterSetName='Search')][String[]]$name,
        [Parameter(ParameterSetName='Search')][String[]]$resourceId,
        [Parameter(ParameterSetName='Search')][String[]]$status,
        [Parameter(ParameterSetName='Search')][String[]]$subject
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/reports/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/reports' } 
    }
}
Export-ModuleMember Get-VrOpsApiReports

Function Set-VrOpsApiSupermetrics {
    [CmdletBinding()]
    param (
        [HashTable]$superMetric
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/supermetrics'
}
Export-ModuleMember Set-VrOpsApiSupermetrics

Function Get-VrOpsApiCollectorgroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups/{id}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups' } 
    }
}
Export-ModuleMember Get-VrOpsApiCollectorgroups

Function New-VrOpsApiAlertsGroupQuery {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [HashTable]$alertQuery,
        [Parameter(Mandatory,Position=0)][ValidateSet('GROUP_BY_ALERT_DEFINITION','GROUP_BY_RESOURCE_KIND','GROUP_BY_CRITICALITY','GROUP_BY_TIME','GROUP_BY_SCOPE')][String]$groupingCondition,
        [String]$adapterKind,
        [String]$resourceKind,
        [String]$resourceNameFilter
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/group/{groupingCondition}/query'
}
Export-ModuleMember New-VrOpsApiAlertsGroupQuery

Function New-VrOpsApiSymptomdefinitions {
    [CmdletBinding()]
    param (
        [HashTable]$symptomDefintion
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/symptomdefinitions'
}
Export-ModuleMember New-VrOpsApiSymptomdefinitions

Function Set-VrOpsApiPricing {
    [CmdletBinding()]
    param (
        [HashTable]$policy
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/pricing'
}
Export-ModuleMember Set-VrOpsApiPricing

Function Set-VrOpsApiAlertpluginsEnable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$pluginId,
        [Parameter(Mandatory,Position=0)][Switch]$enabled
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/{pluginId}/enable/{enabled}'
}
Export-ModuleMember Set-VrOpsApiAlertpluginsEnable

Function Get-VrOpsApiConfigurationsFiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$path
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/configurations/files'
}
Export-ModuleMember Get-VrOpsApiConfigurationsFiles

Function Get-VrOpsApiAlertsNotes {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='noteId')][String]$noteId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$page,
        [Parameter(ParameterSetName='Search')][BigInt]$pageSize
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'noteId' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/{id}/notes/{noteId}' } 
        'Search' { Invoke-VrOps -PsBP $PsBoundParameters '/api/alerts/{id}/notes' } 
    }
}
Export-ModuleMember Get-VrOpsApiAlertsNotes

Function Get-VrOpsApiApplicationsResources {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/resources'
}
Export-ModuleMember Get-VrOpsApiApplicationsResources

Function New-VrOpsApiAlertpluginsTest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$pluginId,
        [String]$templateId
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins/{pluginId}/test'
}
Export-ModuleMember New-VrOpsApiAlertpluginsTest

Function New-VrOpsApiAuthSources {
    [CmdletBinding()]
    param (
        [HashTable]$authSource
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/sources'
}
Export-ModuleMember New-VrOpsApiAuthSources

Function Remove-VrOpsApiAuthRoles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$roleName
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/roles/{roleName}'
}
Export-ModuleMember Remove-VrOpsApiAuthRoles

Function Get-VrOpsApiProductLicensingNpcStatus {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/product/licensing/npc/status'
}
Export-ModuleMember Get-VrOpsApiProductLicensingNpcStatus

Function Get-VrOpsApiSymptoms {
    [CmdletBinding()]
    param (
        [BigInt]$page,
        [BigInt]$pageSize,
        [String[]]$resourceId,
        [Switch]$activeOnly,
        [Switch]$includeAlarmInfo
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/symptoms'
}
Export-ModuleMember Get-VrOpsApiSymptoms

Function Set-VrOpsApiCollectorgroupsCollector {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$collectorId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$checkCollectorMembers
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/collectorgroups/{id}/collector/{collectorId}'
}
Export-ModuleMember Set-VrOpsApiCollectorgroupsCollector

Function Remove-VrOpsApiNotificationsTemplates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/notifications/templates/{id}'
}
Export-ModuleMember Remove-VrOpsApiNotificationsTemplates

Function New-VrOpsApiAdapters {
    [CmdletBinding()]
    param (
        [HashTable]$aiRequest,
        [Switch]$extractIdentifierDefaults,
        [Switch]$force
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/adapters'
}
Export-ModuleMember New-VrOpsApiAdapters

Function Remove-VrOpsApiApplicationsAgents {
    [CmdletBinding()]
    param (
        [HashTable]$resourceCredentials
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/applications/agents'
}
Export-ModuleMember Remove-VrOpsApiApplicationsAgents

Function New-VrOpsApiResourcesGroups {
    [CmdletBinding()]
    param (
        [HashTable]$customGroup
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/resources/groups'
}
Export-ModuleMember New-VrOpsApiResourcesGroups

Function Get-VrOpsApiChargebackEmailconfigurations {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/chargeback/emailconfigurations'
}
Export-ModuleMember Get-VrOpsApiChargebackEmailconfigurations

Function Get-VrOpsApiAuthCurrentuser {
    [CmdletBinding()]
    param ( )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/auth/currentuser'
}
Export-ModuleMember Get-VrOpsApiAuthCurrentuser

Function Set-VrOpsApiAlertplugins {
    [CmdletBinding()]
    param (
        [HashTable]$instance
    )
    Invoke-VrOps -PsBP $PsBoundParameters '/api/alertplugins'
}
Export-ModuleMember Set-VrOpsApiAlertplugins

$ConvertAutomaticVariablesVrOps = ('{"New-VrOpsApiEvents;/api/events":{"eventX":"event"},"Get-VrOpsApiCollectors;/api/collectors":{"hostX":"host"},"New-VrOpsApiEventsAdapterkinds;/api/events/adapterkinds/{adapterKind}":{"eventX":"event"}}') | convertfrom-Json -AsHashtable
