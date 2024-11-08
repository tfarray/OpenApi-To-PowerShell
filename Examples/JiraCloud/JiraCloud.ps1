Function Set-JiraCloudIssuesecurityschemesLevelDefault {
    [CmdletBinding()]
    param (
        [PsObject[]]$defaultValues
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/level/default'
}
Export-ModuleMember Set-JiraCloudIssuesecurityschemesLevelDefault

Function Set-JiraCloudIssuesecurityschemesLevelMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$levelId,
        [Parameter(Mandatory,Position=0)][String]$schemeId,
        [PsObject[]]$members
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member'
}
Export-ModuleMember Set-JiraCloudIssuesecurityschemesLevelMember

Function Get-JiraCloudProjectComponent {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$query,
        [ValidateSet('description','-description','+description','issueCount','-issueCount','+issueCount','lead','-lead','+lead','name','-name','+name')][String]$orderBy,
        [ValidateSet('jira','compass','auto')][String]$componentSource
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/component'
}
Export-ModuleMember Get-JiraCloudProjectComponent

Function New-JiraCloudSearchApproximatecount {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$jql
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/search/approximate-count'
}
Export-ModuleMember New-JiraCloudSearchApproximatecount

Function Remove-JiraCloudWorkflowschemeWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/workflow'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeWorkflow

Function Remove-JiraCloudGroupUser {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$accountId,
        [String]$groupId,
        [String]$groupname,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group/user'
}
Export-ModuleMember Remove-JiraCloudGroupUser

Function Remove-JiraCloudWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$entityId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/{entityId}'
}
Export-ModuleMember Remove-JiraCloudWorkflow

Function Get-JiraCloudUserSearchQueryKey {
    [CmdletBinding()]
    param (
        [BigInt]$maxResult,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$query
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/search/query/key'
}
Export-ModuleMember Get-JiraCloudUserSearchQueryKey

Function New-JiraCloudResolution {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution'
}
Export-ModuleMember New-JiraCloudResolution

Function Set-JiraCloudNotificationschemeNotification {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [PsObject[]]$notificationSchemeEvents
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme/{id}/notification'
}
Export-ModuleMember Set-JiraCloudNotificationschemeNotification

Function Get-JiraCloudUserEmailBulk {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$accountId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/email/bulk'
}
Export-ModuleMember Get-JiraCloudUserEmailBulk

Function Get-JiraCloudUserSearchQuery {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$query
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/search/query'
}
Export-ModuleMember Get-JiraCloudUserSearchQuery

Function New-JiraCloudWorkflowsCreateValidation {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        $payload,
        $validationOptions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflows/create/validation'
}
Export-ModuleMember New-JiraCloudWorkflowsCreateValidation

Function New-JiraCloudFieldRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{id}/restore'
}
Export-ModuleMember New-JiraCloudFieldRestore

Function Get-JiraCloudIssueCreatemeta {
    [CmdletBinding()]
    param (
        [String[]]$issuetypeIds,
        [String[]]$issuetypeNames,
        [String[]]$projectIds,
        [String[]]$projectKeys,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/createmeta'
}
Export-ModuleMember Get-JiraCloudIssueCreatemeta

Function New-JiraCloudScreens {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens'
}
Export-ModuleMember New-JiraCloudScreens

Function Get-JiraCloudSettingsColumns {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/settings/columns'
}
Export-ModuleMember Get-JiraCloudSettingsColumns

Function Remove-JiraCloudScreenscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$screenSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screenscheme/{screenSchemeId}'
}
Export-ModuleMember Remove-JiraCloudScreenscheme

Function Get-JiraCloudFieldSearchTrashed {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String[]]$id,
        [String]$orderBy,
        [String]$query,
        [ValidateSet('name','-name','+name','trashDate','-trashDate','+trashDate','plannedDeletionDate','-plannedDeletionDate','+plannedDeletionDate','projectsCount','-projectsCount','+projectsCount')][String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/search/trashed'
}
Export-ModuleMember Get-JiraCloudFieldSearchTrashed

Function Set-JiraCloudIssuetypescreenschemeProject {
    [CmdletBinding()]
    param (
        [String]$issueTypeScreenSchemeId,
        [String]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/project'
}
Export-ModuleMember Set-JiraCloudIssuetypescreenschemeProject

Function Set-JiraCloudIssuetypeschemeIssuetype {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$issueTypeSchemeId,
        [PsObject[]]$issueTypeIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype'
}
Export-ModuleMember Set-JiraCloudIssuetypeschemeIssuetype

Function Get-JiraCloudProjectFeatures {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/features'
}
Export-ModuleMember Get-JiraCloudProjectFeatures

Function New-JiraCloudWorkflows {
    [CmdletBinding()]
    param (
        [PsObject[]]$projectAndIssueTypes,
        [PsObject[]]$workflowIds,
        [PsObject[]]$workflowNames,
        [String]$expand,
        [Switch]$useApprovalConfiguration,
        [Switch]$useTransitionLinksFormat
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflows'
}
Export-ModuleMember New-JiraCloudWorkflows

Function Remove-JiraCloudIssuesecurityschemesLevelMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$levelId,
        [Parameter(Mandatory,Position=0)][String]$memberId,
        [Parameter(Mandatory,Position=0)][String]$schemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member/{memberId}'
}
Export-ModuleMember Remove-JiraCloudIssuesecurityschemesLevelMember

Function Get-JiraCloudIssueWatchers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/watchers'
}
Export-ModuleMember Get-JiraCloudIssueWatchers

Function Get-JiraCloudStatuscategory {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idOrKey')][String]$idOrKey
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuscategory' }
        'idOrKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuscategory/{idOrKey}' }
    }
}
Export-ModuleMember Get-JiraCloudStatuscategory

Function Remove-JiraCloudIssuesecurityschemes {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$schemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{schemeId}'
}
Export-ModuleMember Remove-JiraCloudIssuesecurityschemes

Function Get-JiraCloudVersionRelatedissuecounts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/relatedIssueCounts'
}
Export-ModuleMember Get-JiraCloudVersionRelatedissuecounts

Function Get-JiraCloudDashboardGadgets {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/gadgets'
}
Export-ModuleMember Get-JiraCloudDashboardGadgets

Function Remove-JiraCloudFieldconfiguration {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfiguration/{id}'
}
Export-ModuleMember Remove-JiraCloudFieldconfiguration

Function Get-JiraCloudFieldContextIssuetypemapping {
    [CmdletBinding()]
    param (
        [BigInt[]]$contextId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/issuetypemapping'
}
Export-ModuleMember Get-JiraCloudFieldContextIssuetypemapping

Function Remove-JiraCloudRestAtlassianconnect1AppModuleDynamic {
    [CmdletBinding()]
    param (
        [String[]]$moduleKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/app/module/dynamic'
}
Export-ModuleMember Remove-JiraCloudRestAtlassianconnect1AppModuleDynamic

Function New-JiraCloudWorkflowschemeUpdateMappings {
    [CmdletBinding()]
    param (
        [PsObject[]]$workflowsForIssueTypes,
        [String]$defaultWorkflowId,
        [String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/update/mappings'
}
Export-ModuleMember New-JiraCloudWorkflowschemeUpdateMappings

Function Set-JiraCloudResolutionMove {
    [CmdletBinding()]
    param (
        [PsObject[]]$ids,
        [String]$after,
        [String]$position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution/move'
}
Export-ModuleMember Set-JiraCloudResolutionMove

Function Get-JiraCloudUser {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$accountId,
        [String]$expand,
        [String]$key,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user'
}
Export-ModuleMember Get-JiraCloudUser

Function Remove-JiraCloudPriority {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority/{id}'
}
Export-ModuleMember Remove-JiraCloudPriority

Function Remove-JiraCloudFieldOption {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$optionId,
        [Parameter(Mandatory,Position=0)][String]$fieldKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option/{optionId}'
}
Export-ModuleMember Remove-JiraCloudFieldOption

Function Remove-JiraCloudProjectClassificationlevelDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/classification-level/default'
}
Export-ModuleMember Remove-JiraCloudProjectClassificationlevelDefault

Function New-JiraCloudUniversalavatarTypeOwner {
    [CmdletBinding()]
    param (
        [BigInt]$x,
        [BigInt]$y,
        [Parameter(Mandatory,Position=0)][BigInt]$size,
        [Parameter(Mandatory,Position=0)][String]$entityId,
        [Parameter(Mandatory,Position=0)][ValidateSet('project','issuetype','priority')][String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'
}
Export-ModuleMember New-JiraCloudUniversalavatarTypeOwner

Function Set-JiraCloudProjectcategory {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$id,
        [String]$name,
        [String]$self
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectCategory/{id}'
}
Export-ModuleMember Set-JiraCloudProjectcategory

Function Get-JiraCloudEvents {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/events'
}
Export-ModuleMember Get-JiraCloudEvents

Function New-JiraCloudIssuelink {
    [CmdletBinding()]
    param (
        $comment,
        $inwardIssue,
        $outwardIssue,
        $type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLink'
}
Export-ModuleMember New-JiraCloudIssuelink

Function Get-JiraCloudWebhook {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/webhook'
}
Export-ModuleMember Get-JiraCloudWebhook

Function Get-JiraCloudFieldOptionSuggestionsSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$projectId,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$fieldKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option/suggestions/search'
}
Export-ModuleMember Get-JiraCloudFieldOptionSuggestionsSearch

Function Get-JiraCloudFilterColumns {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/columns'
}
Export-ModuleMember Get-JiraCloudFilterColumns

Function Get-JiraCloudClassificationlevels {
    [CmdletBinding()]
    param (
        [String[]]$status,
        [ValidateSet('rank','-rank','+rank')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/classification-levels'
}
Export-ModuleMember Get-JiraCloudClassificationlevels

Function New-JiraCloudJqlAutocompletedata {
    [CmdletBinding()]
    param (
        [PsObject[]]$projectIds,
        [Switch]$includeCollapsedFields
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/autocompletedata'
}
Export-ModuleMember New-JiraCloudJqlAutocompletedata

Function Get-JiraCloudDashboardGadget {
    [CmdletBinding()]
    param (
        [BigInt[]]$gadgetId,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$dashboardId,
        [String[]]$moduleKey,
        [String[]]$uri
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/gadget'
}
Export-ModuleMember Get-JiraCloudDashboardGadget

Function Get-JiraCloudWorkflowTransitionsProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$transitionId,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [String]$key,
        [Switch]$includeReservedKeys,
        [ValidateSet('live','draft')][String]$workflowMode
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/transitions/{transitionId}/properties'
}
Export-ModuleMember Get-JiraCloudWorkflowTransitionsProperties

Function Remove-JiraCloudProjectRole {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$group,
        [String]$groupId,
        [String]$user
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/role/{id}'
}
Export-ModuleMember Remove-JiraCloudProjectRole

Function Get-JiraCloudProjectVersions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/versions'
}
Export-ModuleMember Get-JiraCloudProjectVersions

Function Set-JiraCloudIssueComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$properties,
        [String]$created,
        [String]$expand,
        [String]$id,
        [String]$renderedBody,
        [String]$self,
        [String]$updated,
        [Switch]$jsdAuthorCanSeeRequest,
        [Switch]$jsdPublic,
        [Switch]$notifyUsers,
        [Switch]$overrideEditableFlag,
        $author,
        $body,
        $updateAuthor,
        $visibility
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/comment/{id}'
}
Export-ModuleMember Set-JiraCloudIssueComment

Function Set-JiraCloudPriorityDefault {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority/default'
}
Export-ModuleMember Set-JiraCloudPriorityDefault

Function Get-JiraCloudProjectvalidateValidprojectkey {
    [CmdletBinding()]
    param (
        [String]$key
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectvalidate/validProjectKey'
}
Export-ModuleMember Get-JiraCloudProjectvalidateValidprojectkey

Function Get-JiraCloudIssuetypeschemeMapping {
    [CmdletBinding()]
    param (
        [BigInt[]]$issueTypeSchemeId,
        [BigInt]$maxResults,
        [BigInt]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/mapping'
}
Export-ModuleMember Get-JiraCloudIssuetypeschemeMapping

Function New-JiraCloudIssuetype {
    [CmdletBinding()]
    param (
        [BigInt]$hierarchyLevel,
        [String]$description,
        [String]$name,
        [String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype'
}
Export-ModuleMember New-JiraCloudIssuetype

Function New-JiraCloudPermissionsCheck {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$globalPermissions,
        [PsObject[]]$projectPermissions,
        [String]$accountId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissions/check'
}
Export-ModuleMember New-JiraCloudPermissionsCheck

Function Get-JiraCloudApplicationrole {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='key')][String]$key
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'key' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/applicationrole/{key}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/applicationrole' }
    }
}
Export-ModuleMember Get-JiraCloudApplicationrole

Function Set-JiraCloudScreensTabs {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}'
}
Export-ModuleMember Set-JiraCloudScreensTabs

Function Set-JiraCloudWorkflowTransitionsProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$transitionId,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [String]$id,
        [String]$key,
        [String]$value,
        [ValidateSet('live','draft')][String]$workflowMode
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/transitions/{transitionId}/properties'
}
Export-ModuleMember Set-JiraCloudWorkflowTransitionsProperties

Function Remove-JiraCloudRestForge1AppProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/forge/1/app/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudRestForge1AppProperties

Function New-JiraCloudWebhook {
    [CmdletBinding()]
    param (
        [PsObject[]]$webhooks,
        [String]$url
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/webhook'
}
Export-ModuleMember New-JiraCloudWebhook

Function New-JiraCloudBulkIssuesFields {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$selectedActions,
        [PsObject[]]$selectedIssueIdsOrKeys,
        [Switch]$sendBulkNotification,
        $editedFieldsInput
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/bulk/issues/fields'
}
Export-ModuleMember New-JiraCloudBulkIssuesFields

Function Get-JiraCloudStatus {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='idOrName')][String]$idOrName
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/status' }
        'idOrName' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/status/{idOrName}' }
    }
}
Export-ModuleMember Get-JiraCloudStatus

Function New-JiraCloudWorkflowsCreate {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$statuses,
        [PsObject[]]$workflows,
        $scope
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflows/create'
}
Export-ModuleMember New-JiraCloudWorkflowsCreate

Function New-JiraCloudIssueVotes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/votes'
}
Export-ModuleMember New-JiraCloudIssueVotes

Function Get-JiraCloudApplicationpropertiesAdvancedsettings {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/application-properties/advanced-settings'
}
Export-ModuleMember Get-JiraCloudApplicationpropertiesAdvancedsettings

Function Set-JiraCloudIssuetype {
    [CmdletBinding()]
    param (
        [BigInt]$avatarId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{id}'
}
Export-ModuleMember Set-JiraCloudIssuetype

Function Get-JiraCloudUserColumns {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$accountId,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/columns'
}
Export-ModuleMember Get-JiraCloudUserColumns

Function Set-JiraCloudPriority {
    [CmdletBinding()]
    param (
        [BigInt]$avatarId,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$description,
        [String]$iconUrl,
        [String]$name,
        [String]$statusColor
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority/{id}'
}
Export-ModuleMember Set-JiraCloudPriority

Function Set-JiraCloudAnnouncementbanner {
    [CmdletBinding()]
    param (
        [String]$message,
        [String]$visibility,
        [Switch]$isDismissible,
        [Switch]$isEnabled
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/announcementBanner'
}
Export-ModuleMember Set-JiraCloudAnnouncementbanner

Function Get-JiraCloudIssueLimitReport {
    [CmdletBinding()]
    param (
        [HashTable]$issuesApproachingLimitParams,
        [Switch]$isReturningKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/limit/report'
}
Export-ModuleMember Get-JiraCloudIssueLimitReport

Function Set-JiraCloudProjectFeatures {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$featureKey,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$state
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/features/{featureKey}'
}
Export-ModuleMember Set-JiraCloudProjectFeatures

Function Get-JiraCloudIssueEditmeta {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Switch]$overrideEditableFlag,
        [Switch]$overrideScreenSecurity
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/editmeta'
}
Export-ModuleMember Get-JiraCloudIssueEditmeta

Function Remove-JiraCloudIssueVotes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/votes'
}
Export-ModuleMember Remove-JiraCloudIssueVotes

Function Get-JiraCloudWorklogUpdated {
    [CmdletBinding()]
    param (
        [BigInt]$since,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/worklog/updated'
}
Export-ModuleMember Get-JiraCloudWorklogUpdated

Function Set-JiraCloudProjectEmail {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$projectId,
        [PsObject[]]$emailAddressStatus,
        [String]$emailAddress
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectId}/email'
}
Export-ModuleMember Set-JiraCloudProjectEmail

Function Set-JiraCloudFilterFavourite {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/favourite'
}
Export-ModuleMember Set-JiraCloudFilterFavourite

Function Search-JiraCloud {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [PsObject[]]$expand,
        [PsObject[]]$fields,
        [PsObject[]]$properties,
        [String]$jql,
        [String]$validateQuery,
        [Switch]$fieldsByKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/search'
}
Export-ModuleMember Search-JiraCloud

Function Get-JiraCloudIssueTransitions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [String]$expand,
        [String]$transitionId,
        [Switch]$includeUnavailableTransitions,
        [Switch]$skipRemoteOnlyCondition,
        [Switch]$sortByOpsBarAndStatus
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/transitions'
}
Export-ModuleMember Get-JiraCloudIssueTransitions

Function Get-JiraCloudIssueWorklog {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(ParameterSetName='Search')][BigInt]$maxResults,
        [Parameter(ParameterSetName='Search')][BigInt]$startAt,
        [Parameter(ParameterSetName='Search')][BigInt]$startedAfter,
        [Parameter(ParameterSetName='Search')][BigInt]$startedBefore,
        [String]$expand
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudIssueWorklog

Function Remove-JiraCloudRestAtlassianconnect1AddonsProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$addonKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudRestAtlassianconnect1AddonsProperties

Function Search-JiraCloudSearchJql {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [PsObject[]]$fields,
        [PsObject[]]$properties,
        [PsObject[]]$reconcileIssues,
        [String]$expand,
        [String]$jql,
        [String]$nextPageToken,
        [Switch]$fieldsByKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/search/jql'
}
Export-ModuleMember Search-JiraCloudSearchJql

Function New-JiraCloudScreensTabsFields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId,
        [String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}/fields'
}
Export-ModuleMember New-JiraCloudScreensTabsFields

Function Get-JiraCloudConfiguration {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/configuration'
}
Export-ModuleMember Get-JiraCloudConfiguration

Function Set-JiraCloudVersion {
    [CmdletBinding()]
    param (
        [BigInt]$projectId,
        [PsObject[]]$approvers,
        [PsObject[]]$operations,
        [String]$description,
        [String]$driver,
        [String]$expand,
        [String]$id,
        [String]$moveUnfixedIssuesTo,
        [String]$name,
        [String]$project,
        [String]$releaseDate,
        [String]$self,
        [String]$startDate,
        [String]$userReleaseDate,
        [String]$userStartDate,
        [Switch]$archived,
        [Switch]$overdue,
        [Switch]$released,
        $issuesStatusForFixVersion
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}'
}
Export-ModuleMember Set-JiraCloudVersion

Function Remove-JiraCloudResolution {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$replaceWith
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution/{id}'
}
Export-ModuleMember Remove-JiraCloudResolution

Function Remove-JiraCloudDashboardGadget {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$dashboardId,
        [Parameter(Mandatory,Position=0)][BigInt]$gadgetId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}'
}
Export-ModuleMember Remove-JiraCloudDashboardGadget

Function New-JiraCloudProjectcategory {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$id,
        [String]$name,
        [String]$self
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectCategory'
}
Export-ModuleMember New-JiraCloudProjectcategory

Function Remove-JiraCloudWebhook {
    [CmdletBinding()]
    param (
        [PsObject[]]$webhookIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/webhook'
}
Export-ModuleMember Remove-JiraCloudWebhook

Function Remove-JiraCloudIssuetypeschemeIssuetype {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$issueTypeId,
        [Parameter(Mandatory,Position=0)][BigInt]$issueTypeSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/{issueTypeId}'
}
Export-ModuleMember Remove-JiraCloudIssuetypeschemeIssuetype

Function Get-JiraCloudApplicationproperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$key,
        [String]$keyFilter,
        [String]$permissionLevel
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/application-properties'
}
Export-ModuleMember Get-JiraCloudApplicationproperties

Function Get-JiraCloudIssuetypescreenscheme {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String]$expand,
        [String]$queryString,
        [ValidateSet('name','-name','+name','id','-id','+id')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme'
}
Export-ModuleMember Get-JiraCloudIssuetypescreenscheme

Function Get-JiraCloudUserSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String]$accountId,
        [String]$property,
        [String]$query,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/search'
}
Export-ModuleMember Get-JiraCloudUserSearch

Function Set-JiraCloudIssuetypescreenscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueTypeScreenSchemeId,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}'
}
Export-ModuleMember Set-JiraCloudIssuetypescreenscheme

Function Set-JiraCloudVersionMergeto {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$moveIssuesTo
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/mergeto/{moveIssuesTo}'
}
Export-ModuleMember Set-JiraCloudVersionMergeto

Function Set-JiraCloudFieldContext {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}'
}
Export-ModuleMember Set-JiraCloudFieldContext

Function New-JiraCloudVersionMove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$after,
        [String]$position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/move'
}
Export-ModuleMember New-JiraCloudVersionMove

Function New-JiraCloudRoleActors {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [PsObject[]]$group,
        [PsObject[]]$groupId,
        [PsObject[]]$user
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}/actors'
}
Export-ModuleMember New-JiraCloudRoleActors

Function Remove-JiraCloudVersionRemoveandswap {
    [CmdletBinding()]
    param (
        [BigInt]$moveAffectedIssuesTo,
        [BigInt]$moveFixIssuesTo,
        [Parameter(Mandatory,Position=0)][String]$id,
        [PsObject[]]$customFieldReplacementList
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/removeAndSwap'
}
Export-ModuleMember Remove-JiraCloudVersionRemoveandswap

Function New-JiraCloudIssueChangelogList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$changelogIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/changelog/list'
}
Export-ModuleMember New-JiraCloudIssueChangelogList

Function Set-JiraCloudWorkflowschemeDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$workflow,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/default'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeDefault

Function Remove-JiraCloudMypreferencesLocale {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypreferences/locale'
}
Export-ModuleMember Remove-JiraCloudMypreferencesLocale

Function Get-JiraCloudProject {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='projectIdOrKey')][String]$projectIdOrKey,
        [Parameter(ParameterSetName='Search')][BigInt]$recent,
        [String[]]$properties,
        [String]$expand
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'projectIdOrKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project' }
    }
}
Export-ModuleMember Get-JiraCloudProject

Function New-JiraCloudField {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$description,
        [String]$name,
        [String]$searcherKey,
        [String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field'
}
Export-ModuleMember New-JiraCloudField

Function Get-JiraCloudPriorityschemeProjects {
    [CmdletBinding()]
    param (
        [BigInt[]]$projectId,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$schemeId,
        [String]$maxResults,
        [String]$query,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme/{schemeId}/projects'
}
Export-ModuleMember Get-JiraCloudPriorityschemeProjects

Function Get-JiraCloudUimodifications {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/uiModifications'
}
Export-ModuleMember Get-JiraCloudUimodifications

Function Get-JiraCloudFieldOptionSuggestionsEdit {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$projectId,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$fieldKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option/suggestions/edit'
}
Export-ModuleMember Get-JiraCloudFieldOptionSuggestionsEdit

Function New-JiraCloudCommentList {
    [CmdletBinding()]
    param (
        [PsObject[]]$ids,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/comment/list'
}
Export-ModuleMember New-JiraCloudCommentList

Function Get-JiraCloudUniversalavatarTypeOwner {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$entityId,
        [Parameter(Mandatory,Position=0)][ValidateSet('project','issuetype','priority')][String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'
}
Export-ModuleMember Get-JiraCloudUniversalavatarTypeOwner

Function New-JiraCloudRestAtlassianconnect1MigrationWorkflowRuleSearch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$AtlassianTransferId,
        [PsObject[]]$ruleIds,
        [String]$expand,
        [String]$workflowEntityId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/migration/workflow/rule/search'
}
Export-ModuleMember New-JiraCloudRestAtlassianconnect1MigrationWorkflowRuleSearch

Function Set-JiraCloudWorkflowschemeWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [PsObject[]]$issueTypes,
        [String]$workflow,
        [Switch]$defaultMapping,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/workflow'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeWorkflow

Function Remove-JiraCloudFieldContext {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}'
}
Export-ModuleMember Remove-JiraCloudFieldContext

Function Remove-JiraCloudGroup {
    [CmdletBinding()]
    param (
        [String]$groupId,
        [String]$groupname,
        [String]$swapGroup,
        [String]$swapGroupId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group'
}
Export-ModuleMember Remove-JiraCloudGroup

Function Set-JiraCloudRestAtlassianconnect1AddonsProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$addonKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudRestAtlassianconnect1AddonsProperties

Function New-JiraCloudUser {
    [CmdletBinding()]
    param (
        [PsObject[]]$applicationKeys,
        [PsObject[]]$products,
        [String]$displayName,
        [String]$emailAddress,
        [String]$key,
        [String]$name,
        [String]$password,
        [String]$self
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user'
}
Export-ModuleMember New-JiraCloudUser

Function Set-JiraCloudConfigurationTimetracking {
    [CmdletBinding()]
    param (
        [String]$key,
        [String]$name,
        [String]$url
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/configuration/timetracking'
}
Export-ModuleMember Set-JiraCloudConfigurationTimetracking

Function Get-JiraCloudFieldconfigurationschemeMapping {
    [CmdletBinding()]
    param (
        [BigInt[]]$fieldConfigurationSchemeId,
        [BigInt]$maxResults,
        [BigInt]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/mapping'
}
Export-ModuleMember Get-JiraCloudFieldconfigurationschemeMapping

Function Remove-JiraCloudPriorityscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme/{schemeId}'
}
Export-ModuleMember Remove-JiraCloudPriorityscheme

Function Get-JiraCloudCommentProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$commentId,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/comment/{commentId}/properties' }
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/comment/{commentId}/properties/{propertyKey}' }
    }
}
Export-ModuleMember Get-JiraCloudCommentProperties

Function Set-JiraCloudFieldContextDefaultvalue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$defaultValues
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/defaultValue'
}
Export-ModuleMember Set-JiraCloudFieldContextDefaultvalue

Function New-JiraCloudJqlSanitize {
    [CmdletBinding()]
    param (
        [PsObject[]]$queries
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/sanitize'
}
Export-ModuleMember New-JiraCloudJqlSanitize

Function Get-JiraCloudProjectHierarchy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectId}/hierarchy'
}
Export-ModuleMember Get-JiraCloudProjectHierarchy

Function Get-JiraCloudLicenseApproximatelicensecountProduct {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][ValidateSet('jira-core','jira-product-discovery','jira-software','jira-servicedesk')][String]$applicationKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/license/approximateLicenseCount/product/{applicationKey}'
}
Export-ModuleMember Get-JiraCloudLicenseApproximatelicensecountProduct

Function New-JiraCloudIssuetypeAvatar2 {
    [CmdletBinding()]
    param (
        [BigInt]$x,
        [BigInt]$y,
        [Parameter(Mandatory,Position=0)][BigInt]$size,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{id}/avatar2'
}
Export-ModuleMember New-JiraCloudIssuetypeAvatar2

Function Get-JiraCloudPermissionscheme {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='schemeId')][BigInt]$schemeId,
        [String]$expand
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'schemeId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme' }
    }
}
Export-ModuleMember Get-JiraCloudPermissionscheme

Function Find-JiraCloudPrioritySearch {
    [CmdletBinding()]
    param (
        [String[]]$id,
        [String[]]$projectId,
        [String]$expand,
        [String]$maxResults,
        [String]$priorityName,
        [String]$startAt,
        [Switch]$onlyDefault
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority/search'
}
Export-ModuleMember Find-JiraCloudPrioritySearch

Function Get-JiraCloudScreens {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String[]]$scope,
        [String]$queryString,
        [ValidateSet('name','-name','+name','id','-id','+id')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens'
}
Export-ModuleMember Get-JiraCloudScreens

Function Get-JiraCloudJqlAutocompletedataSuggestions {
    [CmdletBinding()]
    param (
        [String]$fieldName,
        [String]$fieldValue,
        [String]$predicateName,
        [String]$predicateValue
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/autocompletedata/suggestions'
}
Export-ModuleMember Get-JiraCloudJqlAutocompletedataSuggestions

Function Remove-JiraCloudUserProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$propertyKey,
        [String]$accountId,
        [String]$userKey,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudUserProperties

Function New-JiraCloudScreenscheme {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$name,
        $screens
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screenscheme'
}
Export-ModuleMember New-JiraCloudScreenscheme

Function New-JiraCloudScreensTabsMove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$pos,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}/move/{pos}'
}
Export-ModuleMember New-JiraCloudScreensTabsMove

Function New-JiraCloudIssueRemotelink {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [String]$globalId,
        [String]$relationship,
        $application,
        $object
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/remotelink'
}
Export-ModuleMember New-JiraCloudIssueRemotelink

Function Set-JiraCloudUserColumns {
    [CmdletBinding()]
    param (
        [String]$accountId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/columns'
}
Export-ModuleMember Set-JiraCloudUserColumns

Function Get-JiraCloudFilterDefaultsharescope {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/defaultShareScope'
}
Export-ModuleMember Get-JiraCloudFilterDefaultsharescope

Function Get-JiraCloudNotificationscheme {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(ParameterSetName='Search')][String[]]$projectId,
        [Parameter(ParameterSetName='Search')][String]$maxResults,
        [Parameter(ParameterSetName='Search')][String]$startAt,
        [Parameter(ParameterSetName='Search')][Switch]$onlyDefault,
        [String]$expand
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme/{id}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme' }
    }
}
Export-ModuleMember Get-JiraCloudNotificationscheme

Function Get-JiraCloudIssuesecurityschemes {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][BigInt]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudIssuesecurityschemes

Function New-JiraCloudProject {
    [CmdletBinding()]
    param (
        [BigInt]$avatarId,
        [BigInt]$categoryId,
        [BigInt]$fieldConfigurationScheme,
        [BigInt]$issueSecurityScheme,
        [BigInt]$issueTypeScheme,
        [BigInt]$issueTypeScreenScheme,
        [BigInt]$notificationScheme,
        [BigInt]$permissionScheme,
        [BigInt]$workflowScheme,
        [String]$assigneeType,
        [String]$description,
        [String]$key,
        [String]$lead,
        [String]$leadAccountId,
        [String]$name,
        [String]$projectTemplateKey,
        [String]$projectTypeKey,
        [String]$url
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project'
}
Export-ModuleMember New-JiraCloudProject

Function New-JiraCloudIssuetypescreenschemeMappingRemove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueTypeScreenSchemeId,
        [PsObject[]]$issueTypeIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/remove'
}
Export-ModuleMember New-JiraCloudIssuetypescreenschemeMappingRemove

Function Remove-JiraCloudNotificationscheme {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$notificationSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme/{notificationSchemeId}'
}
Export-ModuleMember Remove-JiraCloudNotificationscheme

Function Set-JiraCloudPriorityscheme {
    [CmdletBinding()]
    param (
        [BigInt]$defaultPriorityId,
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId,
        [String]$description,
        [String]$name,
        $mappings,
        $priorities,
        $projects
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme/{schemeId}'
}
Export-ModuleMember Set-JiraCloudPriorityscheme

Function Get-JiraCloudAttachmentExpandRaw {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/{id}/expand/raw'
}
Export-ModuleMember Get-JiraCloudAttachmentExpandRaw

Function Get-JiraCloudIssueChangelog {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/changelog'
}
Export-ModuleMember Get-JiraCloudIssueChangelog

Function New-JiraCloudIssueComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$properties,
        [String]$created,
        [String]$expand,
        [String]$id,
        [String]$renderedBody,
        [String]$self,
        [String]$updated,
        [Switch]$jsdAuthorCanSeeRequest,
        [Switch]$jsdPublic,
        $author,
        $body,
        $updateAuthor,
        $visibility
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/comment'
}
Export-ModuleMember New-JiraCloudIssueComment

Function Remove-JiraCloudScreens {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}'
}
Export-ModuleMember Remove-JiraCloudScreens

Function Get-JiraCloudAttachmentThumbnail {
    [CmdletBinding()]
    param (
        [BigInt]$height,
        [BigInt]$width,
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$fallbackToDefault,
        [Switch]$redirect
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/thumbnail/{id}'
}
Export-ModuleMember Get-JiraCloudAttachmentThumbnail

Function New-JiraCloudFieldconfigurationscheme {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme'
}
Export-ModuleMember New-JiraCloudFieldconfigurationscheme

Function Get-JiraCloudVersionRelatedwork {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/relatedwork'
}
Export-ModuleMember Get-JiraCloudVersionRelatedwork

Function New-JiraCloudBulkIssuesMove {
    [CmdletBinding()]
    param (
        [HashTable]$targetToSourcesMapping,
        [Switch]$sendBulkNotification
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/bulk/issues/move'
}
Export-ModuleMember New-JiraCloudBulkIssuesMove

Function Set-JiraCloudProjectProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudProjectProperties

Function Remove-JiraCloudWorkflowscheme {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}'
}
Export-ModuleMember Remove-JiraCloudWorkflowscheme

Function Get-JiraCloudJqlAutocompletedata {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/autocompletedata'
}
Export-ModuleMember Get-JiraCloudJqlAutocompletedata

Function New-JiraCloudFieldconfigurationschemeMappingDelete {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [PsObject[]]$issueTypeIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/{id}/mapping/delete'
}
Export-ModuleMember New-JiraCloudFieldconfigurationschemeMappingDelete

Function Get-JiraCloudProjectEmail {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectId}/email'
}
Export-ModuleMember Get-JiraCloudProjectEmail

Function Get-JiraCloudFilterMy {
    [CmdletBinding()]
    param (
        [String]$expand,
        [Switch]$includeFavourites
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/my'
}
Export-ModuleMember Get-JiraCloudFilterMy

Function Get-JiraCloudConfigurationTimetrackingList {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/configuration/timetracking/list'
}
Export-ModuleMember Get-JiraCloudConfigurationTimetrackingList

Function Get-JiraCloudFieldOption {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='optionId')][BigInt]$optionId,
        [Parameter(Mandatory,Position=0)][String]$fieldKey,
        [Parameter(ParameterSetName='Search')][BigInt]$maxResults,
        [Parameter(ParameterSetName='Search')][BigInt]$startAt
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'optionId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option/{optionId}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option' }
    }
}
Export-ModuleMember Get-JiraCloudFieldOption

Function Get-JiraCloudProjectRecent {
    [CmdletBinding()]
    param (
        [PsObject[]]$properties,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/recent'
}
Export-ModuleMember Get-JiraCloudProjectRecent

Function Set-JiraCloudWorkflowschemeDraft {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [HashTable]$issueTypeMappings,
        [HashTable]$issueTypes,
        [HashTable]$originalIssueTypeMappings,
        [String]$defaultWorkflow,
        [String]$description,
        [String]$lastModified,
        [String]$name,
        [String]$originalDefaultWorkflow,
        [String]$self,
        [Switch]$draft,
        [Switch]$updateDraftIfNeeded,
        $lastModifiedUser
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeDraft

Function New-JiraCloudFieldconfiguration {
    [CmdletBinding()]
    param (
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfiguration'
}
Export-ModuleMember New-JiraCloudFieldconfiguration

Function Find-JiraCloudResolutionSearch {
    [CmdletBinding()]
    param (
        [String[]]$id,
        [String]$maxResults,
        [String]$startAt,
        [Switch]$onlyDefault
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution/search'
}
Export-ModuleMember Find-JiraCloudResolutionSearch

Function Find-JiraCloudIssuesecurityschemesSearch {
    [CmdletBinding()]
    param (
        [String[]]$id,
        [String[]]$projectId,
        [String]$maxResults,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/search'
}
Export-ModuleMember Find-JiraCloudIssuesecurityschemesSearch

Function New-JiraCloudIssueBulk {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$issueUpdates
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/bulk'
}
Export-ModuleMember New-JiraCloudIssueBulk

Function Set-JiraCloudScreenscheme {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$screenSchemeId,
        [String]$description,
        [String]$name,
        $screens
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screenscheme/{screenSchemeId}'
}
Export-ModuleMember Set-JiraCloudScreenscheme

Function Remove-JiraCloudVersionRelatedwork {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$relatedWorkId,
        [Parameter(Mandatory,Position=0)][String]$versionId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{versionId}/relatedwork/{relatedWorkId}'
}
Export-ModuleMember Remove-JiraCloudVersionRelatedwork

Function Get-JiraCloudUserEmail {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$accountId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/email'
}
Export-ModuleMember Get-JiraCloudUserEmail

Function Get-JiraCloudIssue {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [String[]]$fields,
        [String[]]$properties,
        [String]$expand,
        [Switch]$failFast,
        [Switch]$fieldsByKeys,
        [Switch]$updateHistory
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}'
}
Export-ModuleMember Get-JiraCloudIssue

Function Remove-JiraCloudUniversalavatarTypeOwnerAvatar {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$owningObjectId,
        [Parameter(Mandatory,Position=0)][ValidateSet('project','issuetype','priority')][String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/universal_avatar/type/{type}/owner/{owningObjectId}/avatar/{id}'
}
Export-ModuleMember Remove-JiraCloudUniversalavatarTypeOwnerAvatar

Function New-JiraCloudProjectRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/restore'
}
Export-ModuleMember New-JiraCloudProjectRestore

Function Set-JiraCloudUimodifications {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$uiModificationId,
        [PsObject[]]$contexts,
        [String]$data,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/uiModifications/{uiModificationId}'
}
Export-ModuleMember Set-JiraCloudUimodifications

Function Remove-JiraCloudProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Switch]$enableUndo
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}'
}
Export-ModuleMember Remove-JiraCloudProject

Function Get-JiraCloudResolution {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudResolution

Function Get-JiraCloudMypermissions {
    [CmdletBinding()]
    param (
        [String]$commentId,
        [String]$issueId,
        [String]$issueKey,
        [String]$permissions,
        [String]$projectConfigurationUuid,
        [String]$projectId,
        [String]$projectKey,
        [String]$projectUuid
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypermissions'
}
Export-ModuleMember Get-JiraCloudMypermissions

Function Set-JiraCloudAppFieldValue {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$fieldIdOrKey,
        [PsObject[]]$updates,
        [Switch]$generateChangelog
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/app/field/{fieldIdOrKey}/value'
}
Export-ModuleMember Set-JiraCloudAppFieldValue

Function Set-JiraCloudWorkflowschemeDraftDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$workflow,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/default'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeDraftDefault

Function New-JiraCloudIssueProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [HashTable]$properties,
        [PsObject[]]$entitiesIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/properties'
}
Export-ModuleMember New-JiraCloudIssueProperties

Function Get-JiraCloudDashboardItemsProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$dashboardId,
        [Parameter(Mandatory,Position=0)][String]$itemId,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties' }
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}' }
    }
}
Export-ModuleMember Get-JiraCloudDashboardItemsProperties

Function Get-JiraCloudFieldContext {
    [CmdletBinding()]
    param (
        [BigInt[]]$contextId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [Switch]$isAnyIssueType,
        [Switch]$isGlobalContext
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context'
}
Export-ModuleMember Get-JiraCloudFieldContext

Function Set-JiraCloudIssuelinktype {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueLinkTypeId,
        [String]$id,
        [String]$inward,
        [String]$name,
        [String]$outward,
        [String]$self
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLinkType/{issueLinkTypeId}'
}
Export-ModuleMember Set-JiraCloudIssuelinktype

Function New-JiraCloudAppFieldValue {
    [CmdletBinding()]
    param (
        [PsObject[]]$updates,
        [Switch]$generateChangelog
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/app/field/value'
}
Export-ModuleMember New-JiraCloudAppFieldValue

Function Get-JiraCloudProjectcategory {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][BigInt]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectCategory' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectCategory/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudProjectcategory

Function New-JiraCloudScreensTabsFieldsMove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$after,
        [String]$position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}/move'
}
Export-ModuleMember New-JiraCloudScreensTabsFieldsMove

Function Set-JiraCloudFieldContextOptionMove {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$customFieldOptionIds,
        [String]$after,
        [String]$position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/option/move'
}
Export-ModuleMember Set-JiraCloudFieldContextOptionMove

Function Set-JiraCloudIssuetypeProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueTypeId,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudIssuetypeProperties

Function Remove-JiraCloudIssueWorklogProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$worklogId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudIssueWorklogProperties

Function Set-JiraCloudSettingsColumns {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/settings/columns'
}
Export-ModuleMember Set-JiraCloudSettingsColumns

Function Get-JiraCloudWorkflowschemeDraftIssuetype {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$issueType
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeDraftIssuetype

Function Get-JiraCloudIssuesecurityschemesLevel {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String[]]$id,
        [String[]]$schemeId,
        [String]$maxResults,
        [String]$startAt,
        [Switch]$onlyDefault
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/level'
}
Export-ModuleMember Get-JiraCloudIssuesecurityschemesLevel

Function Get-JiraCloudDatapolicyProject {
    [CmdletBinding()]
    param (
        [String]$ids
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/data-policy/project'
}
Export-ModuleMember Get-JiraCloudDatapolicyProject

Function New-JiraCloudIssueNotify {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [String]$htmlBody,
        [String]$subject,
        [String]$textBody,
        $restrict,
        $to
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/notify'
}
Export-ModuleMember New-JiraCloudIssueNotify

Function Get-JiraCloudProjectType {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='projectTypeKey')][ValidateSet('software','service_desk','business','product_discovery')][String]$projectTypeKey
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/type' }
        'projectTypeKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/type/{projectTypeKey}' }
    }
}
Export-ModuleMember Get-JiraCloudProjectType

Function Set-JiraCloudIssuetypescreenschemeMapping {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueTypeScreenSchemeId,
        [PsObject[]]$issueTypeMappings
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping'
}
Export-ModuleMember Set-JiraCloudIssuetypescreenschemeMapping

Function Get-JiraCloudField {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field'
}
Export-ModuleMember Get-JiraCloudField

Function Remove-JiraCloudWorkflowschemeIssuetype {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$issueType,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/issuetype/{issueType}'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeIssuetype

Function Set-JiraCloudWorkflowscheme {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [HashTable]$issueTypeMappings,
        [HashTable]$issueTypes,
        [HashTable]$originalIssueTypeMappings,
        [String]$defaultWorkflow,
        [String]$description,
        [String]$lastModified,
        [String]$name,
        [String]$originalDefaultWorkflow,
        [String]$self,
        [Switch]$draft,
        [Switch]$updateDraftIfNeeded,
        $lastModifiedUser
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}'
}
Export-ModuleMember Set-JiraCloudWorkflowscheme

Function New-JiraCloudProjectArchive {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/archive'
}
Export-ModuleMember New-JiraCloudProjectArchive

Function Get-JiraCloudProjectComponents {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [ValidateSet('jira','compass','auto')][String]$componentSource
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/components'
}
Export-ModuleMember Get-JiraCloudProjectComponents

Function Get-JiraCloudIssuesecurityschemesProject {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String[]]$issueSecuritySchemeId,
        [String[]]$projectId,
        [String]$maxResults,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/project'
}
Export-ModuleMember Get-JiraCloudIssuesecurityschemesProject

Function Remove-JiraCloudProjectcategory {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectCategory/{id}'
}
Export-ModuleMember Remove-JiraCloudProjectcategory

Function New-JiraCloudFieldTrash {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{id}/trash'
}
Export-ModuleMember New-JiraCloudFieldTrash

Function Set-JiraCloudProject {
    [CmdletBinding()]
    param (
        [BigInt]$avatarId,
        [BigInt]$categoryId,
        [BigInt]$issueSecurityScheme,
        [BigInt]$notificationScheme,
        [BigInt]$permissionScheme,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$assigneeType,
        [String]$description,
        [String]$expand,
        [String]$key,
        [String]$lead,
        [String]$leadAccountId,
        [String]$name,
        [String]$url
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}'
}
Export-ModuleMember Set-JiraCloudProject

Function Set-JiraCloudIssueUnarchive {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$issueIdsOrKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/unarchive'
}
Export-ModuleMember Set-JiraCloudIssueUnarchive

Function Remove-JiraCloudIssueProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='issueIdOrKeypropertiespropertyKey')][String]$issueIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey,
        [Parameter(ParameterSetName='propertiespropertyKey')][HashTable]$Body,
        [Parameter(ParameterSetName='propertiespropertyKey')][PsObject[]]$entityIds,
        [Parameter(ParameterSetName='propertiespropertyKey')]$currentValue
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issueIdOrKeypropertiespropertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/properties/{propertyKey}' }
        'propertiespropertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/properties/{propertyKey}' }
    }
}
Export-ModuleMember Remove-JiraCloudIssueProperties

Function New-JiraCloudIssuetypescheme {
    [CmdletBinding()]
    param (
        [PsObject[]]$issueTypeIds,
        [String]$defaultIssueTypeId,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme'
}
Export-ModuleMember New-JiraCloudIssuetypescheme

Function New-JiraCloudIssueArchive {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$jql
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/archive'
}
Export-ModuleMember New-JiraCloudIssueArchive

Function New-JiraCloudFieldContextIssuetypeRemove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$issueTypeIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/issuetype/remove'
}
Export-ModuleMember New-JiraCloudFieldContextIssuetypeRemove

Function Set-JiraCloudMypreferencesLocale {
    [CmdletBinding()]
    param (
        [String]$locale
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypreferences/locale'
}
Export-ModuleMember Set-JiraCloudMypreferencesLocale

Function Get-JiraCloudScreensTabsFields {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId,
        [String]$projectKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}/fields'
}
Export-ModuleMember Get-JiraCloudScreensTabsFields

Function Get-JiraCloudUniversalavatarViewTypeAvatar {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][ValidateSet('issuetype','project','priority')][String]$type,
        [ValidateSet('png','svg')][String]$format,
        [ValidateSet('xsmall','small','medium','large','xlarge')][String]$size
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/universal_avatar/view/type/{type}/avatar/{id}'
}
Export-ModuleMember Get-JiraCloudUniversalavatarViewTypeAvatar

Function Set-JiraCloudWorkflowschemeIssuetype {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$issueType,
        [String]$workflow,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/issuetype/{issueType}'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeIssuetype

Function Remove-JiraCloudIssuelinktype {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueLinkTypeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLinkType/{issueLinkTypeId}'
}
Export-ModuleMember Remove-JiraCloudIssuelinktype

Function Set-JiraCloudDashboard {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [PsObject[]]$editPermissions,
        [PsObject[]]$sharePermissions,
        [String]$description,
        [String]$name,
        [Switch]$extendAdminPermissions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{id}'
}
Export-ModuleMember Set-JiraCloudDashboard

Function Find-JiraCloudDashboardSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$projectId,
        [BigInt]$startAt,
        [String]$accountId,
        [String]$dashboardName,
        [String]$expand,
        [String]$groupId,
        [String]$groupname,
        [String]$owner,
        [ValidateSet('active','archived','deleted')][String]$status,
        [ValidateSet('description','-description','+description','favorite_count','-favorite_count','+favorite_count','id','-id','+id','is_favorite','-is_favorite','+is_favorite','name','-name','+name','owner','-owner','+owner')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/search'
}
Export-ModuleMember Find-JiraCloudDashboardSearch

Function Remove-JiraCloudIssuelink {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$linkId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLink/{linkId}'
}
Export-ModuleMember Remove-JiraCloudIssuelink

Function New-JiraCloudTaskCancel {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$taskId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/task/{taskId}/cancel'
}
Export-ModuleMember New-JiraCloudTaskCancel

Function New-JiraCloudPermissionschemePermission {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId,
        [String]$expand,
        [String]$permission,
        [String]$self,
        $holder
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}/permission'
}
Export-ModuleMember New-JiraCloudPermissionschemePermission

Function Set-JiraCloudIssuetypescheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$issueTypeSchemeId,
        [String]$defaultIssueTypeId,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/{issueTypeSchemeId}'
}
Export-ModuleMember Set-JiraCloudIssuetypescheme

Function New-JiraCloudNotificationscheme {
    [CmdletBinding()]
    param (
        [PsObject[]]$notificationSchemeEvents,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme'
}
Export-ModuleMember New-JiraCloudNotificationscheme

Function Get-JiraCloudProjectSecuritylevel {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectKeyOrId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectKeyOrId}/securitylevel'
}
Export-ModuleMember Get-JiraCloudProjectSecuritylevel

Function New-JiraCloudExpressionAnalyse {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [HashTable]$contextVariables,
        [PsObject[]]$expressions,
        [ValidateSet('syntax','type','complexity')][String]$check
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/expression/analyse'
}
Export-ModuleMember New-JiraCloudExpressionAnalyse

Function Get-JiraCloudProjectIssuesecuritylevelscheme {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectKeyOrId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectKeyOrId}/issuesecuritylevelscheme'
}
Export-ModuleMember Get-JiraCloudProjectIssuesecuritylevelscheme

Function New-JiraCloudIssueWorklogMove {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$ids,
        [String]$issueIdOrKey,
        [Switch]$overrideEditableFlag
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/move'
}
Export-ModuleMember New-JiraCloudIssueWorklogMove

Function Get-JiraCloudIssuelinktype {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='issueLinkTypeId')][String]$issueLinkTypeId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issueLinkTypeId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLinkType/{issueLinkTypeId}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLinkType' }
    }
}
Export-ModuleMember Get-JiraCloudIssuelinktype

Function New-JiraCloudPriorityscheme {
    [CmdletBinding()]
    param (
        [BigInt]$defaultPriorityId,
        [PsObject[]]$priorityIds,
        [PsObject[]]$projectIds,
        [String]$description,
        [String]$name,
        $mappings
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme'
}
Export-ModuleMember New-JiraCloudPriorityscheme

Function Get-JiraCloudProjectAvatars {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/avatars'
}
Export-ModuleMember Get-JiraCloudProjectAvatars

Function Set-JiraCloudIssue {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [HashTable]$fields,
        [HashTable]$update,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$properties,
        [String]$expand,
        [Switch]$notifyUsers,
        [Switch]$overrideEditableFlag,
        [Switch]$overrideScreenSecurity,
        [Switch]$returnIssue,
        $historyMetadata,
        $transition
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}'
}
Export-ModuleMember Set-JiraCloudIssue

Function Get-JiraCloudIssuetypescreenschemeProject {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0,ParameterSetName='issueTypeScreenSchemeIdproject')][BigInt]$issueTypeScreenSchemeId,
        [Parameter(Mandatory,Position=0,ParameterSetName='project')][BigInt[]]$projectId,
        [Parameter(ParameterSetName='issueTypeScreenSchemeIdproject')][String]$query,
        [Parameter(ParameterSetName='project')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'project' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/project' }
        'issueTypeScreenSchemeIdproject' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/project' }
    }
}
Export-ModuleMember Get-JiraCloudIssuetypescreenschemeProject

Function Get-JiraCloudFilter {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$expand,
        [Switch]$overrideSharePermissions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}'
}
Export-ModuleMember Get-JiraCloudFilter

Function New-JiraCloudWorkflowsUpdate {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$statuses,
        [PsObject[]]$workflows,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflows/update'
}
Export-ModuleMember New-JiraCloudWorkflowsUpdate

Function Get-JiraCloudIssueProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/properties/{propertyKey}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/properties' }
    }
}
Export-ModuleMember Get-JiraCloudIssueProperties

Function Get-JiraCloudIssuesecurityschemesLevelMember {
    [CmdletBinding()]
    param (
        [String[]]$id,
        [String[]]$levelId,
        [String[]]$schemeId,
        [String]$expand,
        [String]$maxResults,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/level/member'
}
Export-ModuleMember Get-JiraCloudIssuesecurityschemesLevelMember

Function Remove-JiraCloudIssueComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/comment/{id}'
}
Export-ModuleMember Remove-JiraCloudIssueComment

Function Set-JiraCloudWorkflowschemeDraftWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [PsObject[]]$issueTypes,
        [String]$workflow,
        [Switch]$defaultMapping,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/workflow'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeDraftWorkflow

Function Get-JiraCloudFieldScreens {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/screens'
}
Export-ModuleMember Get-JiraCloudFieldScreens

Function Set-JiraCloudIssuesecurityschemesLevel {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='levelId')][String]$levelId,
        [Parameter(Mandatory,Position=0)][String]$schemeId,
        [Parameter(ParameterSetName='levelId')][HashTable]$Body,
        [Parameter(ParameterSetName='levelId')][String]$description,
        [Parameter(ParameterSetName='levelId')][String]$name,
        [Parameter(ParameterSetName='Search')][PsObject[]]$levels
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'levelId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{schemeId}/level' }
    }
}
Export-ModuleMember Set-JiraCloudIssuesecurityschemesLevel

Function New-JiraCloudPermissionsProject {
    [CmdletBinding()]
    param (
        [PsObject[]]$permissions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissions/project'
}
Export-ModuleMember New-JiraCloudPermissionsProject

Function Set-JiraCloudStatuses {
    [CmdletBinding()]
    param (
        [PsObject[]]$statuses
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuses'
}
Export-ModuleMember Set-JiraCloudStatuses

Function Set-JiraCloudProjectPermissionscheme {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$projectKeyOrId,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectKeyOrId}/permissionscheme'
}
Export-ModuleMember Set-JiraCloudProjectPermissionscheme

Function Get-JiraCloudUniversalavatarViewType {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][ValidateSet('issuetype','project','priority')][String]$type,
        [ValidateSet('png','svg')][String]$format,
        [ValidateSet('xsmall','small','medium','large','xlarge')][String]$size
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/universal_avatar/view/type/{type}'
}
Export-ModuleMember Get-JiraCloudUniversalavatarViewType

Function New-JiraCloudJqlPdcleaner {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$queryStrings
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/pdcleaner'
}
Export-ModuleMember New-JiraCloudJqlPdcleaner

Function Set-JiraCloudFieldOption {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [HashTable]$properties,
        [Parameter(Mandatory,Position=0)][BigInt]$optionId,
        [Parameter(Mandatory,Position=0)][String]$fieldKey,
        [String]$value,
        $config
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option/{optionId}'
}
Export-ModuleMember Set-JiraCloudFieldOption

Function Remove-JiraCloudIssue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [ValidateSet('true','false')][String]$deleteSubtasks
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}'
}
Export-ModuleMember Remove-JiraCloudIssue

Function Get-JiraCloudWorklogDeleted {
    [CmdletBinding()]
    param (
        [BigInt]$since,
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/worklog/deleted'
}
Export-ModuleMember Get-JiraCloudWorklogDeleted

Function New-JiraCloudFieldContextProjectRemove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$projectIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/project/remove'
}
Export-ModuleMember New-JiraCloudFieldContextProjectRemove

Function New-JiraCloudWorkflowschemeDraftPublish {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [PsObject[]]$statusMappings,
        [Switch]$validateOnly
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/publish'
}
Export-ModuleMember New-JiraCloudWorkflowschemeDraftPublish

Function Get-JiraCloudLicenseApproximatelicensecount {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/license/approximateLicenseCount'
}
Export-ModuleMember Get-JiraCloudLicenseApproximatelicensecount

Function Get-JiraCloudUserBulk {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String[]]$accountId,
        [String[]]$key,
        [String[]]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/bulk'
}
Export-ModuleMember Get-JiraCloudUserBulk

Function Get-JiraCloudComponentRelatedissuecounts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/component/{id}/relatedIssueCounts'
}
Export-ModuleMember Get-JiraCloudComponentRelatedissuecounts

Function Remove-JiraCloudProjectProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudProjectProperties

Function Remove-JiraCloudIssueWatchers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [String]$accountId,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/watchers'
}
Export-ModuleMember Remove-JiraCloudIssueWatchers

Function Remove-JiraCloudFieldOptionIssue {
    [CmdletBinding()]
    param (
        [BigInt]$replaceWith,
        [Parameter(Mandatory,Position=0)][BigInt]$optionId,
        [Parameter(Mandatory,Position=0)][String]$fieldKey,
        [String]$jql,
        [Switch]$overrideEditableFlag,
        [Switch]$overrideScreenSecurity
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option/{optionId}/issue'
}
Export-ModuleMember Remove-JiraCloudFieldOptionIssue

Function Set-JiraCloudFilterDefaultsharescope {
    [CmdletBinding()]
    param (
        [String]$scope
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/defaultShareScope'
}
Export-ModuleMember Set-JiraCloudFilterDefaultsharescope

Function Get-JiraCloudPriorityschemePrioritiesAvailable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$schemeId,
        [String[]]$exclude,
        [String]$maxResults,
        [String]$query,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme/priorities/available'
}
Export-ModuleMember Get-JiraCloudPriorityschemePrioritiesAvailable

Function Get-JiraCloudWorkflowschemeProject {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt[]]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/project'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeProject

Function Get-JiraCloudProjectNotificationscheme {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectKeyOrId,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectKeyOrId}/notificationscheme'
}
Export-ModuleMember Get-JiraCloudProjectNotificationscheme

Function Remove-JiraCloudWorkflowschemeDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/default'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeDefault

Function Remove-JiraCloudFieldContextOptionIssue {
    [CmdletBinding()]
    param (
        [BigInt]$replaceWith,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][BigInt]$optionId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [String]$jql
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}/issue'
}
Export-ModuleMember Remove-JiraCloudFieldContextOptionIssue

Function Set-JiraCloudProjectClassificationlevelDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/classification-level/default'
}
Export-ModuleMember Set-JiraCloudProjectClassificationlevelDefault

Function Find-JiraCloudSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String[]]$fields,
        [String[]]$properties,
        [String]$expand,
        [String]$jql,
        [Switch]$failFast,
        [Switch]$fieldsByKeys,
        [ValidateSet('strict','warn','none','true','false')][String]$validateQuery
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/search'
}
Export-ModuleMember Find-JiraCloudSearch

Function Set-JiraCloudDashboardItemsProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dashboardId,
        [Parameter(Mandatory,Position=0)][String]$itemId,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudDashboardItemsProperties

Function Get-JiraCloudMyself {
    [CmdletBinding()]
    param (
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/myself'
}
Export-ModuleMember Get-JiraCloudMyself

Function New-JiraCloudWorkflowschemeUpdate {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$statusMappingsByIssueTypeOverride,
        [PsObject[]]$statusMappingsByWorkflows,
        [PsObject[]]$workflowsForIssueTypes,
        [String]$defaultWorkflowId,
        [String]$description,
        [String]$id,
        [String]$name,
        $version
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/update'
}
Export-ModuleMember New-JiraCloudWorkflowschemeUpdate

Function Get-JiraCloudWorkflow {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$workflowName
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow'
}
Export-ModuleMember Get-JiraCloudWorkflow

Function New-JiraCloudWorkflowsUpdateValidation {
    [CmdletBinding()]
    param (
        $payload,
        $validationOptions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflows/update/validation'
}
Export-ModuleMember New-JiraCloudWorkflowsUpdateValidation

Function Get-JiraCloudPriorityscheme {
    [CmdletBinding()]
    param (
        [BigInt[]]$priorityId,
        [BigInt[]]$schemeId,
        [HashTable]$Body,
        [String]$expand,
        [String]$maxResults,
        [String]$schemeName,
        [String]$startAt,
        [Switch]$onlyDefault,
        [ValidateSet('name','+name','-name')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme'
}
Export-ModuleMember Get-JiraCloudPriorityscheme

Function New-JiraCloudFieldOption {
    [CmdletBinding()]
    param (
        [HashTable]$properties,
        [Parameter(Mandatory,Position=0)][String]$fieldKey,
        [String]$value,
        $config
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldKey}/option'
}
Export-ModuleMember New-JiraCloudFieldOption

Function Get-JiraCloudConfigurationTimetrackingOptions {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/configuration/timetracking/options'
}
Export-ModuleMember Get-JiraCloudConfigurationTimetrackingOptions

Function Remove-JiraCloudWorkflowTransitionsProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$transitionId,
        [Parameter(Mandatory,Position=0)][String]$key,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [ValidateSet('live','draft')][String]$workflowMode
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/transitions/{transitionId}/properties'
}
Export-ModuleMember Remove-JiraCloudWorkflowTransitionsProperties

Function Set-JiraCloudPriorityMove {
    [CmdletBinding()]
    param (
        [PsObject[]]$ids,
        [String]$after,
        [String]$position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority/move'
}
Export-ModuleMember Set-JiraCloudPriorityMove

Function Get-JiraCloudScreensAvailablefields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$screenId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/availableFields'
}
Export-ModuleMember Get-JiraCloudScreensAvailablefields

Function Get-JiraCloudProjectRoledetails {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Switch]$currentMember,
        [Switch]$excludeConnectAddons
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/roledetails'
}
Export-ModuleMember Get-JiraCloudProjectRoledetails

Function New-JiraCloudVersionRelatedwork {
    [CmdletBinding()]
    param (
        [BigInt]$issueId,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$category,
        [String]$relatedWorkId,
        [String]$title,
        [String]$url
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/relatedwork'
}
Export-ModuleMember New-JiraCloudVersionRelatedwork

Function Remove-JiraCloudWorkflowschemeDraftIssuetype {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$issueType
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeDraftIssuetype

Function Get-JiraCloudFieldSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String[]]$id,
        [String[]]$type,
        [String]$expand,
        [String]$query,
        [ValidateSet('contextsCount','-contextsCount','+contextsCount','lastUsed','-lastUsed','+lastUsed','name','-name','+name','screensCount','-screensCount','+screensCount','projectsCount','-projectsCount','+projectsCount')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/search'
}
Export-ModuleMember Get-JiraCloudFieldSearch

Function Get-JiraCloudIssuetypeschemeProject {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt[]]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/project'
}
Export-ModuleMember Get-JiraCloudIssuetypeschemeProject

Function New-JiraCloudProjectRole {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [PsObject[]]$group,
        [PsObject[]]$groupId,
        [PsObject[]]$user
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/role/{id}'
}
Export-ModuleMember New-JiraCloudProjectRole

Function New-JiraCloudUimodifications {
    [CmdletBinding()]
    param (
        [PsObject[]]$contexts,
        [String]$data,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/uiModifications'
}
Export-ModuleMember New-JiraCloudUimodifications

Function Remove-JiraCloudIssuesecurityschemesLevel {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$levelId,
        [Parameter(Mandatory,Position=0)][String]$schemeId,
        [String]$replaceWith
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}'
}
Export-ModuleMember Remove-JiraCloudIssuesecurityschemesLevel

Function Remove-JiraCloudStatuses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuses'
}
Export-ModuleMember Remove-JiraCloudStatuses

Function Remove-JiraCloudUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$accountId,
        [String]$key,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user'
}
Export-ModuleMember Remove-JiraCloudUser

Function Get-JiraCloudFieldconfiguration {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String]$query,
        [Switch]$isDefault
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfiguration'
}
Export-ModuleMember Get-JiraCloudFieldconfiguration

Function Get-JiraCloudScreenscheme {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String]$expand,
        [String]$queryString,
        [ValidateSet('name','-name','+name','id','-id','+id')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screenscheme'
}
Export-ModuleMember Get-JiraCloudScreenscheme

Function Set-JiraCloudRole {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}'
}
Export-ModuleMember Set-JiraCloudRole

Function New-JiraCloudIssuesecurityschemes {
    [CmdletBinding()]
    param (
        [PsObject[]]$levels,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes'
}
Export-ModuleMember New-JiraCloudIssuesecurityschemes

Function Get-JiraCloudTask {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$taskId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/task/{taskId}'
}
Export-ModuleMember Get-JiraCloudTask

Function Get-JiraCloudMypreferencesLocale {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypreferences/locale'
}
Export-ModuleMember Get-JiraCloudMypreferencesLocale

Function Get-JiraCloudAttachment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/{id}'
}
Export-ModuleMember Get-JiraCloudAttachment

Function Get-JiraCloudIssueComment {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(ParameterSetName='Search')][BigInt]$maxResults,
        [Parameter(ParameterSetName='Search')][BigInt]$startAt,
        [Parameter(ParameterSetName='Search')][ValidateSet('created','-created','+created')][String]$orderBy,
        [String]$expand
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/comment/{id}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/comment' }
    }
}
Export-ModuleMember Get-JiraCloudIssueComment

Function New-JiraCloudIssuetypescreenscheme {
    [CmdletBinding()]
    param (
        [PsObject[]]$issueTypeMappings,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme'
}
Export-ModuleMember New-JiraCloudIssuetypescreenscheme

Function Remove-JiraCloudFilterColumns {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/columns'
}
Export-ModuleMember Remove-JiraCloudFilterColumns

Function New-JiraCloudIssueBulkfetch {
    [CmdletBinding()]
    param (
        [PsObject[]]$expand,
        [PsObject[]]$fields,
        [PsObject[]]$issueIdsOrKeys,
        [PsObject[]]$properties,
        [Switch]$fieldsByKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/bulkfetch'
}
Export-ModuleMember New-JiraCloudIssueBulkfetch

Function Get-JiraCloudConfigurationTimetracking {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/configuration/timetracking'
}
Export-ModuleMember Get-JiraCloudConfigurationTimetracking

Function Get-JiraCloudUserPicker {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [Parameter(Mandatory,Position=0)][String]$query,
        [String[]]$exclude,
        [String[]]$excludeAccountIds,
        [String]$avatarSize,
        [Switch]$excludeConnectUsers,
        [Switch]$showAvatar
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/picker'
}
Export-ModuleMember Get-JiraCloudUserPicker

Function New-JiraCloudWorkflow {
    [CmdletBinding()]
    param (
        [PsObject[]]$statuses,
        [PsObject[]]$transitions,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow'
}
Export-ModuleMember New-JiraCloudWorkflow

Function Set-JiraCloudWorkflowRuleConfigDelete {
    [CmdletBinding()]
    param (
        [PsObject[]]$workflows
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/rule/config/delete'
}
Export-ModuleMember Set-JiraCloudWorkflowRuleConfigDelete

Function Remove-JiraCloudProjectDelete {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/delete'
}
Export-ModuleMember Remove-JiraCloudProjectDelete

Function Find-JiraCloudFilterSearch {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$projectId,
        [BigInt]$startAt,
        [String]$accountId,
        [String]$expand,
        [String]$filterName,
        [String]$groupId,
        [String]$groupname,
        [String]$owner,
        [Switch]$overrideSharePermissions,
        [ValidateSet('description','-description','+description','favourite_count','-favourite_count','+favourite_count','id','-id','+id','is_favourite','-is_favourite','+is_favourite','name','-name','+name','owner','-owner','+owner','is_shared','-is_shared','+is_shared')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/search'
}
Export-ModuleMember Find-JiraCloudFilterSearch

Function Remove-JiraCloudNotificationschemeNotification {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$notificationId,
        [Parameter(Mandatory,Position=0)][String]$notificationSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme/{notificationSchemeId}/notification/{notificationId}'
}
Export-ModuleMember Remove-JiraCloudNotificationschemeNotification

Function Get-JiraCloudStatuses {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String[]]$id,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuses'
}
Export-ModuleMember Get-JiraCloudStatuses

Function New-JiraCloudGroupUser {
    [CmdletBinding()]
    param (
        [String]$accountId,
        [String]$groupId,
        [String]$groupname,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group/user'
}
Export-ModuleMember New-JiraCloudGroupUser

Function Set-JiraCloudIssueProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='issueIdOrKeypropertiespropertyKey')][String]$issueIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey,
        [Parameter(ParameterSetName='propertiespropertyKey')][HashTable]$Body,
        [Parameter(ParameterSetName='propertiespropertyKey')][String]$expression,
        [Parameter(ParameterSetName='propertiespropertyKey')]$filter,
        [Parameter(ParameterSetName='propertiespropertyKey')]$value
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issueIdOrKeypropertiespropertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/properties/{propertyKey}' }
        'propertiespropertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/properties/{propertyKey}' }
    }
}
Export-ModuleMember Set-JiraCloudIssueProperties

Function New-JiraCloudIssueWorklog {
    [CmdletBinding()]
    param (
        [BigInt]$timeSpentSeconds,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$properties,
        [String]$created,
        [String]$expand,
        [String]$id,
        [String]$issueId,
        [String]$newEstimate,
        [String]$reduceBy,
        [String]$self,
        [String]$started,
        [String]$timeSpent,
        [String]$updated,
        [Switch]$notifyUsers,
        [Switch]$overrideEditableFlag,
        [ValidateSet('new','leave','manual','auto')][String]$adjustEstimate,
        $author,
        $comment,
        $updateAuthor,
        $visibility
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog'
}
Export-ModuleMember New-JiraCloudIssueWorklog

Function Get-JiraCloudAuditingRecord {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [String]$filter,
        [String]$from,
        [String]$to
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/auditing/record'
}
Export-ModuleMember Get-JiraCloudAuditingRecord

Function Get-JiraCloudIssuetypeProject {
    [CmdletBinding()]
    param (
        [BigInt]$level,
        [Parameter(Mandatory,Position=0)][BigInt]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/project'
}
Export-ModuleMember Get-JiraCloudIssuetypeProject

Function New-JiraCloudRole {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][BigInt]$id,
        [Parameter(ParameterSetName='id')][HashTable]$Body,
        [String]$description,
        [String]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role' }
    }
}
Export-ModuleMember New-JiraCloudRole

Function New-JiraCloudIssuePropertiesMulti {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$issues
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/properties/multi'
}
Export-ModuleMember New-JiraCloudIssuePropertiesMulti

Function New-JiraCloudWorkflowTransitionsProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$transitionId,
        [Parameter(Mandatory,Position=0)][String]$workflowName,
        [String]$id,
        [String]$key,
        [String]$value,
        [ValidateSet('live','draft')][String]$workflowMode
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/transitions/{transitionId}/properties'
}
Export-ModuleMember New-JiraCloudWorkflowTransitionsProperties

Function Set-JiraCloudIssuesecurityschemes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{id}'
}
Export-ModuleMember Set-JiraCloudIssuesecurityschemes

Function Get-JiraCloudProjectvalidateValidprojectname {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectvalidate/validProjectName'
}
Export-ModuleMember Get-JiraCloudProjectvalidateValidprojectname

Function Get-JiraCloudIssuetype {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudIssuetype

Function Get-JiraCloudPermissions {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissions'
}
Export-ModuleMember Get-JiraCloudPermissions

Function Get-JiraCloudAppFieldContextConfiguration {
    [CmdletBinding()]
    param (
        [BigInt[]]$fieldContextId,
        [BigInt[]]$id,
        [BigInt]$issueId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$fieldIdOrKey,
        [String]$issueTypeId,
        [String]$projectKeyOrId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/app/field/{fieldIdOrKey}/context/configuration'
}
Export-ModuleMember Get-JiraCloudAppFieldContextConfiguration

Function Get-JiraCloudWebhookFailed {
    [CmdletBinding()]
    param (
        [BigInt]$after,
        [BigInt]$maxResults,
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/webhook/failed'
}
Export-ModuleMember Get-JiraCloudWebhookFailed

Function New-JiraCloudPriorityschemeMappings {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$schemeId,
        [BigInt]$startAt,
        $priorities,
        $projects
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme/mappings'
}
Export-ModuleMember New-JiraCloudPriorityschemeMappings

Function Get-JiraCloudUserProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body,
        [String]$accountId,
        [String]$userKey,
        [String]$username
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/properties/{propertyKey}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/properties' }
    }
}
Export-ModuleMember Get-JiraCloudUserProperties

Function Set-JiraCloudFieldContextIssuetype {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$issueTypeIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/issuetype'
}
Export-ModuleMember Set-JiraCloudFieldContextIssuetype

Function Remove-JiraCloudPermissionschemePermission {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$permissionId,
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}/permission/{permissionId}'
}
Export-ModuleMember Remove-JiraCloudPermissionschemePermission

Function Get-JiraCloudIssuetypescheme {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String]$expand,
        [String]$queryString,
        [ValidateSet('name','-name','+name','id','-id','+id')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme'
}
Export-ModuleMember Get-JiraCloudIssuetypescheme

Function Get-JiraCloudInstanceLicense {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/instance/license'
}
Export-ModuleMember Get-JiraCloudInstanceLicense

Function New-JiraCloudComponent {
    [CmdletBinding()]
    param (
        [BigInt]$projectId,
        [HashTable]$metadata,
        [String]$ari,
        [String]$assigneeType,
        [String]$description,
        [String]$id,
        [String]$leadAccountId,
        [String]$leadUserName,
        [String]$name,
        [String]$project,
        [String]$realAssigneeType,
        [String]$self,
        [Switch]$isAssigneeTypeValid,
        $assignee,
        $lead,
        $realAssignee
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/component'
}
Export-ModuleMember New-JiraCloudComponent

Function Get-JiraCloudRoleActors {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}/actors'
}
Export-ModuleMember Get-JiraCloudRoleActors

Function New-JiraCloudDashboardGadget {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$dashboardId,
        [String]$color,
        [String]$moduleKey,
        [String]$title,
        [String]$uri,
        [Switch]$ignoreUriAndModuleKeyValidation,
        $position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/gadget'
}
Export-ModuleMember New-JiraCloudDashboardGadget

Function Get-JiraCloudProjectRole {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Parameter(ParameterSetName='id')][HashTable]$Body,
        [Parameter(ParameterSetName='id')][Switch]$excludeInactiveUsers
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/role' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/role/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudProjectRole

Function Get-JiraCloudFieldContextProjectmapping {
    [CmdletBinding()]
    param (
        [BigInt[]]$contextId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/projectmapping'
}
Export-ModuleMember Get-JiraCloudFieldContextProjectmapping

Function New-JiraCloudFieldContext {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$issueTypeIds,
        [PsObject[]]$projectIds,
        [String]$description,
        [String]$id,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context'
}
Export-ModuleMember New-JiraCloudFieldContext

Function Remove-JiraCloudIssuetype {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$alternativeIssueTypeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{id}'
}
Export-ModuleMember Remove-JiraCloudIssuetype

Function Set-JiraCloudIssuetypescreenschemeMappingDefault {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueTypeScreenSchemeId,
        [String]$screenSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/default'
}
Export-ModuleMember Set-JiraCloudIssuetypescreenschemeMappingDefault

Function Set-JiraCloudFieldContextProject {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$projectIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/project'
}
Export-ModuleMember Set-JiraCloudFieldContextProject

Function Get-JiraCloudFieldconfigurationscheme {
    [CmdletBinding()]
    param (
        [BigInt[]]$id,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme'
}
Export-ModuleMember Get-JiraCloudFieldconfigurationscheme

Function Set-JiraCloudWorkflowRuleConfig {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$workflows
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/rule/config'
}
Export-ModuleMember Set-JiraCloudWorkflowRuleConfig

Function Get-JiraCloudProjectVersion {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$expand,
        [String]$query,
        [String]$status,
        [ValidateSet('description','-description','+description','name','-name','+name','releaseDate','-releaseDate','+releaseDate','sequence','-sequence','+sequence','startDate','-startDate','+startDate')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/version'
}
Export-ModuleMember Get-JiraCloudProjectVersion

Function Remove-JiraCloudIssueWorklog {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(ParameterSetName='id')][String]$increaseBy,
        [Parameter(ParameterSetName='id')][String]$newEstimate,
        [Parameter(ParameterSetName='id')][Switch]$notifyUsers,
        [Parameter(ParameterSetName='Search')][PsObject[]]$ids,
        [Switch]$overrideEditableFlag,
        [ValidateSet('leave','auto')][String]$adjustEstimate
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{id}' }
    }
}
Export-ModuleMember Remove-JiraCloudIssueWorklog

Function New-JiraCloudWorkflowscheme {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [HashTable]$issueTypeMappings,
        [HashTable]$issueTypes,
        [HashTable]$originalIssueTypeMappings,
        [String]$defaultWorkflow,
        [String]$description,
        [String]$lastModified,
        [String]$name,
        [String]$originalDefaultWorkflow,
        [String]$self,
        [Switch]$draft,
        [Switch]$updateDraftIfNeeded,
        $lastModifiedUser
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme'
}
Export-ModuleMember New-JiraCloudWorkflowscheme

Function New-JiraCloudWorklogList {
    [CmdletBinding()]
    param (
        [PsObject[]]$ids,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/worklog/list'
}
Export-ModuleMember New-JiraCloudWorklogList

Function New-JiraCloudIssueWatching {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$issueIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/watching'
}
Export-ModuleMember New-JiraCloudIssueWatching

Function Set-JiraCloudIssuetypeschemeIssuetypeMove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$issueTypeSchemeId,
        [PsObject[]]$issueTypeIds,
        [String]$after,
        [String]$position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/move'
}
Export-ModuleMember Set-JiraCloudIssuetypeschemeIssuetypeMove

Function New-JiraCloudScreensAddtodefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/addToDefault/{fieldId}'
}
Export-ModuleMember New-JiraCloudScreensAddtodefault

Function Find-JiraCloudSearchJql {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [HashTable]$Body,
        [PsObject[]]$fields,
        [PsObject[]]$properties,
        [PsObject[]]$reconcileIssues,
        [String]$expand,
        [String]$jql,
        [String]$nextPageToken,
        [Switch]$fieldsByKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/search/jql'
}
Export-ModuleMember Find-JiraCloudSearchJql

Function Set-JiraCloudIssueWorklogProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$worklogId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudIssueWorklogProperties

Function Get-JiraCloudProjectPermissionscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$projectKeyOrId,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectKeyOrId}/permissionscheme'
}
Export-ModuleMember Get-JiraCloudProjectPermissionscheme

Function Remove-JiraCloudWorkflowschemeDraftWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$workflowName
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/workflow'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeDraftWorkflow

Function Get-JiraCloudGroupuserpicker {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [Parameter(Mandatory,Position=0)][String]$query,
        [String[]]$issueTypeId,
        [String[]]$projectId,
        [String]$fieldId,
        [Switch]$caseInsensitive,
        [Switch]$excludeConnectAddons,
        [Switch]$showAvatar,
        [ValidateSet('xsmall','xsmall@2x','xsmall@3x','small','small@2x','small@3x','medium','medium@2x','medium@3x','large','large@2x','large@3x','xlarge','xlarge@2x','xlarge@3x','xxlarge','xxlarge@2x','xxlarge@3x','xxxlarge','xxxlarge@2x','xxxlarge@3x')][String]$avatarSize
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/groupuserpicker'
}
Export-ModuleMember Get-JiraCloudGroupuserpicker

Function Get-JiraCloudIssueWorklogProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$worklogId,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties' }
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties/{propertyKey}' }
    }
}
Export-ModuleMember Get-JiraCloudIssueWorklogProperties

Function Get-JiraCloudBulkQueue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$taskId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/bulk/queue/{taskId}'
}
Export-ModuleMember Get-JiraCloudBulkQueue

Function New-JiraCloudDashboard {
    [CmdletBinding()]
    param (
        [PsObject[]]$editPermissions,
        [PsObject[]]$sharePermissions,
        [String]$description,
        [String]$name,
        [Switch]$extendAdminPermissions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard'
}
Export-ModuleMember New-JiraCloudDashboard

Function Get-JiraCloudWorkflowschemeWorkflow {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$workflowName,
        [Switch]$returnDraftIfExists
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/workflow'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeWorkflow

Function Set-JiraCloudIssuesecurityschemesProject {
    [CmdletBinding()]
    param (
        [PsObject[]]$oldToNewSecurityLevelMappings,
        [String]$projectId,
        [String]$schemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/project'
}
Export-ModuleMember Set-JiraCloudIssuesecurityschemesProject

Function Set-JiraCloudResolutionDefault {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution/default'
}
Export-ModuleMember Set-JiraCloudResolutionDefault

Function New-JiraCloudIssuelinktype {
    [CmdletBinding()]
    param (
        [String]$id,
        [String]$inward,
        [String]$name,
        [String]$outward,
        [String]$self
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLinkType'
}
Export-ModuleMember New-JiraCloudIssuelinktype

Function Get-JiraCloudAnnouncementbanner {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/announcementBanner'
}
Export-ModuleMember Get-JiraCloudAnnouncementbanner

Function Get-JiraCloudRestAtlassianconnect1AppModuleDynamic {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/app/module/dynamic'
}
Export-ModuleMember Get-JiraCloudRestAtlassianconnect1AppModuleDynamic

Function Remove-JiraCloudCommentProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$commentId,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/comment/{commentId}/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudCommentProperties

Function Get-JiraCloudUserPermissionSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$permissions,
        [String]$accountId,
        [String]$issueKey,
        [String]$projectKey,
        [String]$query,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/permission/search'
}
Export-ModuleMember Get-JiraCloudUserPermissionSearch

Function Set-JiraCloudWorkflowschemeProject {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$projectId,
        [String]$workflowSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/project'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeProject

Function Set-JiraCloudIssueArchive {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$issueIdsOrKeys
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/archive'
}
Export-ModuleMember Set-JiraCloudIssueArchive

Function Remove-JiraCloudFieldContextOption {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][BigInt]$optionId,
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}'
}
Export-ModuleMember Remove-JiraCloudFieldContextOption

Function Get-JiraCloudWorkflowschemeIssuetype {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$issueType,
        [Switch]$returnDraftIfExists
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/issuetype/{issueType}'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeIssuetype

Function Remove-JiraCloudFieldconfigurationscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/{id}'
}
Export-ModuleMember Remove-JiraCloudFieldconfigurationscheme

Function Get-JiraCloudProjectClassificationlevelDefault {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/classification-level/default'
}
Export-ModuleMember Get-JiraCloudProjectClassificationlevelDefault

Function Remove-JiraCloudWorkflowschemeDraftDefault {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/default'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeDraftDefault

Function Get-JiraCloudScreensTabs {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][BigInt[]]$screenId,
        [Parameter(ParameterSetName='screenIdtabs')][HashTable]$Body,
        [Parameter(ParameterSetName='screenIdtabs')][String]$projectKey,
        [Parameter(ParameterSetName='tabs')][BigInt[]]$tabId,
        [Parameter(ParameterSetName='tabs')][BigInt]$maxResult,
        [Parameter(ParameterSetName='tabs')][BigInt]$startAt
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'tabs' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/tabs' }
        'screenIdtabs' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs' }
    }
}
Export-ModuleMember Get-JiraCloudScreensTabs

Function New-JiraCloudWorkflowschemeRead {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$projectIds,
        [PsObject[]]$workflowSchemeIds,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/read'
}
Export-ModuleMember New-JiraCloudWorkflowschemeRead

Function Get-JiraCloudServerinfo {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/serverInfo'
}
Export-ModuleMember Get-JiraCloudServerinfo

Function Remove-JiraCloudPermissionscheme {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}'
}
Export-ModuleMember Remove-JiraCloudPermissionscheme

Function Set-JiraCloudFieldContextOption {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$options
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/option'
}
Export-ModuleMember Set-JiraCloudFieldContextOption

Function Get-JiraCloudProjectStatuses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/statuses'
}
Export-ModuleMember Get-JiraCloudProjectStatuses

Function New-JiraCloudFieldContextOption {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$options
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/option'
}
Export-ModuleMember New-JiraCloudFieldContextOption

Function Get-JiraCloudGroupsPicker {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [String[]]$exclude,
        [String[]]$excludeId,
        [String]$accountId,
        [String]$query,
        [String]$userName,
        [Switch]$caseInsensitive
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/groups/picker'
}
Export-ModuleMember Get-JiraCloudGroupsPicker

Function Set-JiraCloudIssueRemotelink {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(Mandatory,Position=0)][String]$linkId,
        [String]$globalId,
        [String]$relationship,
        $application,
        $object
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/remotelink/{linkId}'
}
Export-ModuleMember Set-JiraCloudIssueRemotelink

Function Get-JiraCloudCustomfieldoption {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/customFieldOption/{id}'
}
Export-ModuleMember Get-JiraCloudCustomfieldoption

Function Search-JiraCloudSearchId {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [HashTable]$Body,
        [String]$jql,
        [String]$nextPageToken
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/search/id'
}
Export-ModuleMember Search-JiraCloudSearchId

Function Get-JiraCloudFieldContexts {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/contexts'
}
Export-ModuleMember Get-JiraCloudFieldContexts

Function Get-JiraCloudDashboard {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$maxResults,
        [Parameter(ParameterSetName='Search')][BigInt]$startAt,
        [Parameter(ParameterSetName='Search')][ValidateSet('my','favourite')][String]$filter
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{id}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard' }
    }
}
Export-ModuleMember Get-JiraCloudDashboard

Function Set-JiraCloudWebhookRefresh {
    [CmdletBinding()]
    param (
        [PsObject[]]$webhookIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/webhook/refresh'
}
Export-ModuleMember Set-JiraCloudWebhookRefresh

Function New-JiraCloudIssueTransitions {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$update,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$properties,
        $historyMetadata,
        $transition
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/transitions'
}
Export-ModuleMember New-JiraCloudIssueTransitions

Function Set-JiraCloudRestAtlassianconnect1MigrationProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$AtlassianTransferId,
        [Parameter(Mandatory,Position=0)][ValidateSet('IssueProperty','CommentProperty','DashboardItemProperty','IssueTypeProperty','ProjectProperty','UserProperty','WorklogProperty','BoardProperty','SprintProperty')][String]$entityType
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/migration/properties/{entityType}'
}
Export-ModuleMember Set-JiraCloudRestAtlassianconnect1MigrationProperties

Function Set-JiraCloudUserProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$propertyKey,
        [String]$accountId,
        [String]$userKey,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudUserProperties

Function Get-JiraCloudUniversalavatarViewTypeOwner {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$entityId,
        [Parameter(Mandatory,Position=0)][ValidateSet('issuetype','project','priority')][String]$type,
        [ValidateSet('png','svg')][String]$format,
        [ValidateSet('xsmall','small','medium','large','xlarge')][String]$size
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/universal_avatar/view/type/{type}/owner/{entityId}'
}
Export-ModuleMember Get-JiraCloudUniversalavatarViewTypeOwner

Function Remove-JiraCloudAttachment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/{id}'
}
Export-ModuleMember Remove-JiraCloudAttachment

Function Remove-JiraCloudComponent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$moveIssuesTo
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/component/{id}'
}
Export-ModuleMember Remove-JiraCloudComponent

Function Set-JiraCloudIssuesArchiveExport {
    [CmdletBinding()]
    param (
        [PsObject[]]$archivedBy,
        [PsObject[]]$issueTypes,
        [PsObject[]]$projects,
        [PsObject[]]$reporters,
        $archivedDateRange
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issues/archive/export'
}
Export-ModuleMember Set-JiraCloudIssuesArchiveExport

Function Remove-JiraCloudUimodifications {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$uiModificationId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/uiModifications/{uiModificationId}'
}
Export-ModuleMember Remove-JiraCloudUimodifications

Function Set-JiraCloudPermissionscheme {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId,
        [PsObject[]]$permissions,
        [String]$description,
        [String]$expand,
        [String]$name,
        [String]$self,
        $scope
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}'
}
Export-ModuleMember Set-JiraCloudPermissionscheme

Function Get-JiraCloudWorkflowRuleConfig {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String[]]$types,
        [String[]]$keys,
        [String[]]$withTags,
        [String[]]$workflowNames,
        [String]$expand,
        [Switch]$draft
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/rule/config'
}
Export-ModuleMember Get-JiraCloudWorkflowRuleConfig

Function Get-JiraCloudFieldContextOption {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$optionId,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$contextId,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [Switch]$onlyOptions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/{contextId}/option'
}
Export-ModuleMember Get-JiraCloudFieldContextOption

Function Get-JiraCloudPriority {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudPriority

Function Get-JiraCloudUsersSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/users/search'
}
Export-ModuleMember Get-JiraCloudUsersSearch

Function Get-JiraCloudProjectvalidateKey {
    [CmdletBinding()]
    param (
        [String]$key
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/projectvalidate/key'
}
Export-ModuleMember Get-JiraCloudProjectvalidateKey

Function Get-JiraCloudGroupMember {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String]$groupId,
        [String]$groupname,
        [Switch]$includeInactiveUsers
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group/member'
}
Export-ModuleMember Get-JiraCloudGroupMember

Function Get-JiraCloudWorkflowschemeDraftWorkflow {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$workflowName
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/workflow'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeDraftWorkflow

Function Get-JiraCloudFieldconfigurationFields {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfiguration/{id}/fields'
}
Export-ModuleMember Get-JiraCloudFieldconfigurationFields

Function Set-JiraCloudComponent {
    [CmdletBinding()]
    param (
        [BigInt]$projectId,
        [HashTable]$metadata,
        [String]$ari,
        [String]$assigneeType,
        [String]$description,
        [String]$id,
        [String]$leadAccountId,
        [String]$leadUserName,
        [String]$name,
        [String]$project,
        [String]$realAssigneeType,
        [String]$self,
        [Switch]$isAssigneeTypeValid,
        $assignee,
        $lead,
        $realAssignee
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/component/{id}'
}
Export-ModuleMember Set-JiraCloudComponent

Function Set-JiraCloudProjectRole {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [HashTable]$categorisedActors,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/role/{id}'
}
Export-ModuleMember Set-JiraCloudProjectRole

Function Set-JiraCloudIssueAssignee {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [String]$accountId,
        [String]$accountType,
        [String]$displayName,
        [String]$emailAddress,
        [String]$expand,
        [String]$key,
        [String]$locale,
        [String]$name,
        [String]$self,
        [String]$timeZone,
        [Switch]$active,
        $applicationRoles,
        $avatarUrls,
        $groups
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/assignee'
}
Export-ModuleMember Set-JiraCloudIssueAssignee

Function Get-JiraCloudPermissionschemePermission {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='permissionId')][BigInt]$permissionId,
        [Parameter(Mandatory,Position=0)][BigInt]$schemeId,
        [Parameter(ParameterSetName='Search')][HashTable]$Body,
        [String]$expand
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}/permission' }
        'permissionId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme/{schemeId}/permission/{permissionId}' }
    }
}
Export-ModuleMember Get-JiraCloudPermissionschemePermission

Function Remove-JiraCloudFilterFavourite {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/favourite'
}
Export-ModuleMember Remove-JiraCloudFilterFavourite

Function Get-JiraCloudBulkIssuesFields {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdsOrKeys,
        [String]$endingBefore,
        [String]$searchText,
        [String]$startingAfter
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/bulk/issues/fields'
}
Export-ModuleMember Get-JiraCloudBulkIssuesFields

Function Get-JiraCloudProjectTypeAccessible {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='projectTypeKeyaccessible')][ValidateSet('software','service_desk','business','product_discovery')][String]$projectTypeKey
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'accessible' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/type/accessible' }
        'projectTypeKeyaccessible' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/type/{projectTypeKey}/accessible' }
    }
}
Export-ModuleMember Get-JiraCloudProjectTypeAccessible

Function Remove-JiraCloudWorkflowschemeDraft {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft'
}
Export-ModuleMember Remove-JiraCloudWorkflowschemeDraft

Function Remove-JiraCloudIssuetypescreenscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueTypeScreenSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}'
}
Export-ModuleMember Remove-JiraCloudIssuetypescreenscheme

Function Set-JiraCloudFieldconfigurationFields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [PsObject[]]$fieldConfigurationItems
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfiguration/{id}/fields'
}
Export-ModuleMember Set-JiraCloudFieldconfigurationFields

Function New-JiraCloudFilter {
    [CmdletBinding()]
    param (
        [BigInt]$favouritedCount,
        [PsObject[]]$editPermissions,
        [PsObject[]]$sharePermissions,
        [String]$approximateLastUsed,
        [String]$description,
        [String]$expand,
        [String]$id,
        [String]$jql,
        [String]$name,
        [String]$searchUrl,
        [String]$self,
        [String]$viewUrl,
        [Switch]$favourite,
        [Switch]$overrideSharePermissions,
        $owner,
        $sharedUsers,
        $subscriptions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter'
}
Export-ModuleMember New-JiraCloudFilter

Function Set-JiraCloudScreens {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}'
}
Export-ModuleMember Set-JiraCloudScreens

Function Get-JiraCloudIssuetypescreenschemeMapping {
    [CmdletBinding()]
    param (
        [BigInt[]]$issueTypeScreenSchemeId,
        [BigInt]$maxResults,
        [BigInt]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescreenscheme/mapping'
}
Export-ModuleMember Get-JiraCloudIssuetypescreenschemeMapping

Function Get-JiraCloudAttachmentExpandHuman {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/{id}/expand/human'
}
Export-ModuleMember Get-JiraCloudAttachmentExpandHuman

Function Get-JiraCloudSecuritylevel {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/securitylevel/{id}'
}
Export-ModuleMember Get-JiraCloudSecuritylevel

Function Set-JiraCloudDashboardGadget {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$dashboardId,
        [Parameter(Mandatory,Position=0)][BigInt]$gadgetId,
        [String]$color,
        [String]$title,
        $position
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}'
}
Export-ModuleMember Set-JiraCloudDashboardGadget

Function Set-JiraCloudFieldconfiguration {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfiguration/{id}'
}
Export-ModuleMember Set-JiraCloudFieldconfiguration

Function Get-JiraCloudWorkflowsCapabilities {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$issueTypeId,
        [String]$projectId,
        [String]$workflowId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflows/capabilities'
}
Export-ModuleMember Get-JiraCloudWorkflowsCapabilities

Function Set-JiraCloudRestForge1AppProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/forge/1/app/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudRestForge1AppProperties

Function New-JiraCloudVersion {
    [CmdletBinding()]
    param (
        [BigInt]$projectId,
        [PsObject[]]$approvers,
        [PsObject[]]$operations,
        [String]$description,
        [String]$driver,
        [String]$expand,
        [String]$id,
        [String]$moveUnfixedIssuesTo,
        [String]$name,
        [String]$project,
        [String]$releaseDate,
        [String]$self,
        [String]$startDate,
        [String]$userReleaseDate,
        [String]$userStartDate,
        [Switch]$archived,
        [Switch]$overdue,
        [Switch]$released,
        $issuesStatusForFixVersion
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version'
}
Export-ModuleMember New-JiraCloudVersion

Function New-JiraCloudProjectAvatar2 {
    [CmdletBinding()]
    param (
        [BigInt]$size,
        [BigInt]$x,
        [BigInt]$y,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/avatar2'
}
Export-ModuleMember New-JiraCloudProjectAvatar2

Function New-JiraCloudExpressionEvaluate {
    [CmdletBinding()]
    param (
        [String]$expand,
        [String]$expression,
        $context
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/expression/evaluate'
}
Export-ModuleMember New-JiraCloudExpressionEvaluate

Function Test-JiraCloudJqlMatch {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$issueIds,
        [PsObject[]]$jqls
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/match'
}
Export-ModuleMember Test-JiraCloudJqlMatch

Function New-JiraCloudJqlFunctionComputation {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$values
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/function/computation'
}
Export-ModuleMember New-JiraCloudJqlFunctionComputation

Function New-JiraCloudJqlParse {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][ValidateSet('strict','warn','none')][String]$validation,
        [PsObject[]]$queries
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/parse'
}
Export-ModuleMember New-JiraCloudJqlParse

Function Set-JiraCloudIssueWorklog {
    [CmdletBinding()]
    param (
        [BigInt]$timeSpentSeconds,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [PsObject[]]$properties,
        [String]$created,
        [String]$expand,
        [String]$id,
        [String]$issueId,
        [String]$newEstimate,
        [String]$self,
        [String]$started,
        [String]$timeSpent,
        [String]$updated,
        [Switch]$notifyUsers,
        [Switch]$overrideEditableFlag,
        [ValidateSet('new','leave','manual','auto')][String]$adjustEstimate,
        $author,
        $comment,
        $updateAuthor,
        $visibility
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/worklog/{id}'
}
Export-ModuleMember Set-JiraCloudIssueWorklog

Function New-JiraCloudScreensTabs {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs'
}
Export-ModuleMember New-JiraCloudScreensTabs

Function Remove-JiraCloudIssuetypeProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueTypeId,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudIssuetypeProperties

Function Set-JiraCloudField {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [String]$description,
        [String]$name,
        [String]$searcherKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}'
}
Export-ModuleMember Set-JiraCloudField

Function Remove-JiraCloudRole {
    [CmdletBinding()]
    param (
        [BigInt]$swap,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}'
}
Export-ModuleMember Remove-JiraCloudRole

Function Set-JiraCloudMypreferences {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$key
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypreferences'
}
Export-ModuleMember Set-JiraCloudMypreferences

Function Set-JiraCloudFilterColumns {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [PsObject[]]$columns
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/columns'
}
Export-ModuleMember Set-JiraCloudFilterColumns

Function Set-JiraCloudConfigurationTimetrackingOptions {
    [CmdletBinding()]
    param (
        [BigInt]$workingDaysPerWeek,
        [BigInt]$workingHoursPerDay,
        [String]$defaultUnit,
        [String]$timeFormat
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/configuration/timetracking/options'
}
Export-ModuleMember Set-JiraCloudConfigurationTimetrackingOptions

Function Set-JiraCloudRestAtlassianconnect1MigrationField {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$AtlassianTransferId,
        [PsObject[]]$updateValueList
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/migration/field'
}
Export-ModuleMember Set-JiraCloudRestAtlassianconnect1MigrationField

Function Set-JiraCloudAppFieldContextConfiguration {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$fieldIdOrKey,
        [PsObject[]]$configurations
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/app/field/{fieldIdOrKey}/context/configuration'
}
Export-ModuleMember Set-JiraCloudAppFieldContextConfiguration

Function Set-JiraCloudProjectAvatar {
    [CmdletBinding()]
    param (
        [HashTable]$urls,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [String]$fileName,
        [String]$id,
        [String]$owner,
        [Switch]$isDeletable,
        [Switch]$isSelected,
        [Switch]$isSystemAvatar
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/avatar'
}
Export-ModuleMember Set-JiraCloudProjectAvatar

Function New-JiraCloudStatuses {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$statuses,
        $scope
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuses'
}
Export-ModuleMember New-JiraCloudStatuses

Function Set-JiraCloudDashboardBulkEdit {
    [CmdletBinding()]
    param (
        [PsObject[]]$entityIds,
        [String]$action,
        [Switch]$extendAdminPermissions,
        $changeOwnerDetails,
        $permissionDetails
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/bulk/edit'
}
Export-ModuleMember Set-JiraCloudDashboardBulkEdit

Function Set-JiraCloudWorkflowschemeDraftIssuetype {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$issueType,
        [String]$workflow,
        [Switch]$updateDraftIfNeeded
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}'
}
Export-ModuleMember Set-JiraCloudWorkflowschemeDraftIssuetype

Function Set-JiraCloudIssuetypeschemeProject {
    [CmdletBinding()]
    param (
        [String]$issueTypeSchemeId,
        [String]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/project'
}
Export-ModuleMember Set-JiraCloudIssuetypeschemeProject

Function Get-JiraCloudLabel {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/label'
}
Export-ModuleMember Get-JiraCloudLabel

Function New-JiraCloudIssueAttachments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/attachments'
}
Export-ModuleMember New-JiraCloudIssueAttachments

Function Remove-JiraCloudDashboard {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{id}'
}
Export-ModuleMember Remove-JiraCloudDashboard

Function Remove-JiraCloudMypreferences {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$key
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypreferences'
}
Export-ModuleMember Remove-JiraCloudMypreferences

Function Get-JiraCloudAttachmentMeta {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/meta'
}
Export-ModuleMember Get-JiraCloudAttachmentMeta

Function Get-JiraCloudIssueCreatemetaIssuetypes {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0,ParameterSetName='issueTypeId')][String]$issueTypeId,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Parameter(ParameterSetName='issueTypeId')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issueTypeId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/createmeta/{projectIdOrKey}/issuetypes/{issueTypeId}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/createmeta/{projectIdOrKey}/issuetypes' }
    }
}
Export-ModuleMember Get-JiraCloudIssueCreatemetaIssuetypes

Function Remove-JiraCloudField {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{id}'
}
Export-ModuleMember Remove-JiraCloudField

Function Remove-JiraCloudVersion {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$moveAffectedIssuesTo,
        [String]$moveFixIssuesTo
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}'
}
Export-ModuleMember Remove-JiraCloudVersion

Function New-JiraCloudIssueWatchers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/watchers'
}
Export-ModuleMember New-JiraCloudIssueWatchers

Function Get-JiraCloudNotificationschemeProject {
    [CmdletBinding()]
    param (
        [String[]]$notificationSchemeId,
        [String[]]$projectId,
        [String]$maxResults,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme/project'
}
Export-ModuleMember Get-JiraCloudNotificationschemeProject

Function Get-JiraCloudIssueRemotelink {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='linkId')][String]$linkId,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey,
        [Parameter(ParameterSetName='Search')][String]$globalId
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/remotelink' }
        'linkId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/remotelink/{linkId}' }
    }
}
Export-ModuleMember Get-JiraCloudIssueRemotelink

Function Remove-JiraCloudIssueRemotelink {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='linkId')][String]$linkId,
        [Parameter(Mandatory,Position=0,ParameterSetName='Search')][String]$globalId,
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/remotelink' }
        'linkId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/remotelink/{linkId}' }
    }
}
Export-ModuleMember Remove-JiraCloudIssueRemotelink

Function Set-JiraCloudFieldconfigurationscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/{id}'
}
Export-ModuleMember Set-JiraCloudFieldconfigurationscheme

Function Remove-JiraCloudProjectAvatar {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/avatar/{id}'
}
Export-ModuleMember Remove-JiraCloudProjectAvatar

Function Get-JiraCloudRestAtlassianconnect1AddonsProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$addonKey,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/addons/{addonKey}/properties' }
    }
}
Export-ModuleMember Get-JiraCloudRestAtlassianconnect1AddonsProperties

Function New-JiraCloudPermissionscheme {
    [CmdletBinding()]
    param (
        [BigInt]$id,
        [PsObject[]]$permissions,
        [String]$description,
        [String]$expand,
        [String]$name,
        [String]$self,
        $scope
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/permissionscheme'
}
Export-ModuleMember New-JiraCloudPermissionscheme

Function Get-JiraCloudIssueVotes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$issueIdOrKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/{issueIdOrKey}/votes'
}
Export-ModuleMember Get-JiraCloudIssueVotes

Function Get-JiraCloudJqlFunctionComputation {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [String[]]$functionKey,
        [String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/jql/function/computation'
}
Export-ModuleMember Get-JiraCloudJqlFunctionComputation

Function Get-JiraCloudWorkflowSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String[]]$workflowName,
        [String]$expand,
        [String]$queryString,
        [Switch]$isActive,
        [ValidateSet('name','-name','+name','created','-created','+created','updated','+updated','-updated')][String]$orderBy
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflow/search'
}
Export-ModuleMember Get-JiraCloudWorkflowSearch

Function Get-JiraCloudUserGroups {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$accountId,
        [String]$key,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/groups'
}
Export-ModuleMember Get-JiraCloudUserGroups

Function New-JiraCloudFilterPermission {
    [CmdletBinding()]
    param (
        [BigInt]$rights,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$accountId,
        [String]$groupId,
        [String]$groupname,
        [String]$projectId,
        [String]$projectRoleId,
        [String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/permission'
}
Export-ModuleMember New-JiraCloudFilterPermission

Function Get-JiraCloudDatapolicy {
    [CmdletBinding()]
    param ( )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/data-policy'
}
Export-ModuleMember Get-JiraCloudDatapolicy

Function Get-JiraCloudVersionUnresolvedissuecount {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/unresolvedIssueCount'
}
Export-ModuleMember Get-JiraCloudVersionUnresolvedissuecount

Function Remove-JiraCloudFilterPermission {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(Mandatory,Position=0)][BigInt]$permissionId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/permission/{permissionId}'
}
Export-ModuleMember Remove-JiraCloudFilterPermission

Function Set-JiraCloudVersionRelatedwork {
    [CmdletBinding()]
    param (
        [BigInt]$issueId,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$category,
        [String]$relatedWorkId,
        [String]$title,
        [String]$url
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}/relatedwork'
}
Export-ModuleMember Set-JiraCloudVersionRelatedwork

Function Get-JiraCloudGroup {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$expand,
        [String]$groupId,
        [String]$groupname
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group'
}
Export-ModuleMember Get-JiraCloudGroup

Function Remove-JiraCloudFilter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}'
}
Export-ModuleMember Remove-JiraCloudFilter

Function Set-JiraCloudFilterOwner {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$accountId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/owner'
}
Export-ModuleMember Set-JiraCloudFilterOwner

Function Set-JiraCloudApplicationproperties {
    [CmdletBinding()]
    param (
        [String]$id,
        [String]$value
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/application-properties/{id}'
}
Export-ModuleMember Set-JiraCloudApplicationproperties

Function Remove-JiraCloudIssuetypescheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$issueTypeSchemeId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetypescheme/{issueTypeSchemeId}'
}
Export-ModuleMember Remove-JiraCloudIssuetypescheme

Function Get-JiraCloudProjectSearch {
    [CmdletBinding()]
    param (
        [PsObject[]]$properties,
        [BigInt[]]$id,
        [BigInt]$categoryId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String[]]$keys,
        [String[]]$status,
        [String]$expand,
        [String]$propertyQuery,
        [String]$query,
        [String]$typeKey,
        [ValidateSet('category','-category','+category','key','-key','+key','name','-name','+name','owner','-owner','+owner','issueCount','-issueCount','+issueCount','lastIssueUpdatedDate','-lastIssueUpdatedDate','+lastIssueUpdatedDate','archivedDate','+archivedDate','-archivedDate','deletedDate','+deletedDate','-deletedDate')][String]$orderBy,
        [ValidateSet('view','browse','edit','create')][String]$action
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/search'
}
Export-ModuleMember Get-JiraCloudProjectSearch

Function Get-JiraCloudRestAtlassianconnect1Serviceregistry {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String[]]$serviceIds
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/service-registry'
}
Export-ModuleMember Get-JiraCloudRestAtlassianconnect1Serviceregistry

Function Get-JiraCloudIssuetypeAlternatives {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{id}/alternatives'
}
Export-ModuleMember Get-JiraCloudIssuetypeAlternatives

Function Get-JiraCloudAvatarSystem {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][ValidateSet('issuetype','project','user','priority')][String]$type
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/avatar/{type}/system'
}
Export-ModuleMember Get-JiraCloudAvatarSystem

Function Set-JiraCloudFieldconfigurationschemeMapping {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [PsObject[]]$mappings
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/{id}/mapping'
}
Export-ModuleMember Set-JiraCloudFieldconfigurationschemeMapping

Function Get-JiraCloudGroupBulk {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String[]]$groupId,
        [String[]]$groupName,
        [String]$accessType,
        [String]$applicationKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group/bulk'
}
Export-ModuleMember Get-JiraCloudGroupBulk

Function Get-JiraCloudWorkflowscheme {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][BigInt]$id,
        [Parameter(ParameterSetName='id')][Switch]$returnDraftIfExists,
        [Parameter(ParameterSetName='Search')][BigInt]$maxResults,
        [Parameter(ParameterSetName='Search')][BigInt]$startAt
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudWorkflowscheme

Function Remove-JiraCloudDashboardItemsProperties {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$dashboardId,
        [Parameter(Mandatory,Position=0)][String]$itemId,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}'
}
Export-ModuleMember Remove-JiraCloudDashboardItemsProperties

Function New-JiraCloudPriority {
    [CmdletBinding()]
    param (
        [BigInt]$avatarId,
        [String]$description,
        [String]$iconUrl,
        [String]$name,
        [String]$statusColor
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priority'
}
Export-ModuleMember New-JiraCloudPriority

Function New-JiraCloudExpressionEval {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$expand,
        [String]$expression,
        $context
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/expression/eval'
}
Export-ModuleMember New-JiraCloudExpressionEval

Function Get-JiraCloudFieldconfigurationschemeProject {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt[]]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/project'
}
Export-ModuleMember Get-JiraCloudFieldconfigurationschemeProject

Function Get-JiraCloudUserAssignableMultiprojectsearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$projectKeys,
        [String]$accountId,
        [String]$query,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/assignable/multiProjectSearch'
}
Export-ModuleMember Get-JiraCloudUserAssignableMultiprojectsearch

Function Get-JiraCloudUserBulkMigration {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String[]]$key,
        [String[]]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/bulk/migration'
}
Export-ModuleMember Get-JiraCloudUserBulkMigration

Function Remove-JiraCloudScreensTabs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}'
}
Export-ModuleMember Remove-JiraCloudScreensTabs

Function Set-JiraCloudFieldconfigurationschemeProject {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$fieldConfigurationSchemeId,
        [String]$projectId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/fieldconfigurationscheme/project'
}
Export-ModuleMember Set-JiraCloudFieldconfigurationschemeProject

Function Get-JiraCloudUserViewissueSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String]$accountId,
        [String]$issueKey,
        [String]$projectKey,
        [String]$query,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/viewissue/search'
}
Export-ModuleMember Get-JiraCloudUserViewissueSearch

Function New-JiraCloudIssue {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$update,
        [PsObject[]]$properties,
        [Switch]$updateHistory,
        $historyMetadata,
        $transition
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue'
}
Export-ModuleMember New-JiraCloudIssue

Function Get-JiraCloudWorkflowschemeDraft {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeDraft

Function Get-JiraCloudIssuePicker {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$currentIssueKey,
        [String]$currentJQL,
        [String]$currentProjectId,
        [String]$query,
        [Switch]$showSubTaskParent,
        [Switch]$showSubTasks
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issue/picker'
}
Export-ModuleMember Get-JiraCloudIssuePicker

Function New-JiraCloudDashboardCopy {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [PsObject[]]$editPermissions,
        [PsObject[]]$sharePermissions,
        [String]$description,
        [String]$name,
        [Switch]$extendAdminPermissions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/dashboard/{id}/copy'
}
Export-ModuleMember New-JiraCloudDashboardCopy

Function Set-JiraCloudFilter {
    [CmdletBinding()]
    param (
        [BigInt]$favouritedCount,
        [PsObject[]]$editPermissions,
        [PsObject[]]$sharePermissions,
        [String]$approximateLastUsed,
        [String]$description,
        [String]$expand,
        [String]$id,
        [String]$jql,
        [String]$name,
        [String]$searchUrl,
        [String]$self,
        [String]$viewUrl,
        [Switch]$favourite,
        [Switch]$overrideSharePermissions,
        $owner,
        $sharedUsers,
        $subscriptions
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}'
}
Export-ModuleMember Set-JiraCloudFilter

Function Get-JiraCloudIssuetypeProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$issueTypeId,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuetype/{issueTypeId}/properties' }
    }
}
Export-ModuleMember Get-JiraCloudIssuetypeProperties

Function Remove-JiraCloudScreensTabsFields {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$screenId,
        [Parameter(Mandatory,Position=0)][BigInt]$tabId,
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}'
}
Export-ModuleMember Remove-JiraCloudScreensTabsFields

Function Get-JiraCloudFieldContextDefaultvalue {
    [CmdletBinding()]
    param (
        [BigInt[]]$contextId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$fieldId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/defaultValue'
}
Export-ModuleMember Get-JiraCloudFieldContextDefaultvalue

Function New-JiraCloudRestAtlassianconnect1AppModuleDynamic {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [PsObject[]]$modules
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/atlassian-connect/1/app/module/dynamic'
}
Export-ModuleMember New-JiraCloudRestAtlassianconnect1AppModuleDynamic

Function Get-JiraCloudIssuesecurityschemesMembers {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][BigInt]$issueSecuritySchemeId,
        [String[]]$issueSecurityLevelId,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issuesecurityschemes/{issueSecuritySchemeId}/members'
}
Export-ModuleMember Get-JiraCloudIssuesecurityschemesMembers

Function New-JiraCloudGroup {
    [CmdletBinding()]
    param (
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/group'
}
Export-ModuleMember New-JiraCloudGroup

Function Get-JiraCloudWorkflowschemeDraftDefault {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/draft/default'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeDraftDefault

Function Get-JiraCloudVersion {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/version/{id}'
}
Export-ModuleMember Get-JiraCloudVersion

Function Get-JiraCloudPriorityschemePriorities {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$schemeId,
        [String]$maxResults,
        [String]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/priorityscheme/{schemeId}/priorities'
}
Export-ModuleMember Get-JiraCloudPriorityschemePriorities

Function Get-JiraCloudComponent {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id,
        [Parameter(ParameterSetName='Search')][BigInt]$maxResults,
        [Parameter(ParameterSetName='Search')][BigInt]$startAt,
        [Parameter(ParameterSetName='Search')][String[]]$projectIdsOrKeys,
        [Parameter(ParameterSetName='Search')][String]$query,
        [Parameter(ParameterSetName='Search')][ValidateSet('description','-description','+description','name','-name','+name')][String]$orderBy
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/component' }
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/component/{id}' }
    }
}
Export-ModuleMember Get-JiraCloudComponent

Function Set-JiraCloudResolution {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/resolution/{id}'
}
Export-ModuleMember Set-JiraCloudResolution

Function Get-JiraCloudWorkflowschemeDefault {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Switch]$returnDraftIfExists
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/default'
}
Export-ModuleMember Get-JiraCloudWorkflowschemeDefault

Function Get-JiraCloudFilterPermission {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='permissionId')][BigInt]$permissionId,
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'permissionId' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/permission/{permissionId}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/{id}/permission' }
    }
}
Export-ModuleMember Get-JiraCloudFilterPermission

Function Get-JiraCloudIssuelink {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$linkId
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/issueLink/{linkId}'
}
Export-ModuleMember Get-JiraCloudIssuelink

Function Remove-JiraCloudRoleActors {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id,
        [String]$group,
        [String]$groupId,
        [String]$user
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}/actors'
}
Export-ModuleMember Remove-JiraCloudRoleActors

Function Get-JiraCloudRole {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][BigInt]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role/{id}' }
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/role' }
    }
}
Export-ModuleMember Get-JiraCloudRole

Function Remove-JiraCloudUserColumns {
    [CmdletBinding()]
    param (
        [String]$accountId,
        [String]$username
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/columns'
}
Export-ModuleMember Remove-JiraCloudUserColumns

Function Get-JiraCloudUsers {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/users'
}
Export-ModuleMember Get-JiraCloudUsers

Function Get-JiraCloudMypreferences {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$key
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/mypreferences'
}
Export-ModuleMember Get-JiraCloudMypreferences

Function Get-JiraCloudUserAssignableSearch {
    [CmdletBinding()]
    param (
        [BigInt]$actionDescriptorId,
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String]$accountId,
        [String]$issueKey,
        [String]$project,
        [String]$query,
        [String]$sessionId,
        [String]$username,
        [Switch]$recommend
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/user/assignable/search'
}
Export-ModuleMember Get-JiraCloudUserAssignableSearch

Function New-JiraCloudWorkflowschemeCreatedraft {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][BigInt]$id
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/workflowscheme/{id}/createdraft'
}
Export-ModuleMember New-JiraCloudWorkflowschemeCreatedraft

Function Set-JiraCloudCommentProperties {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$commentId,
        [Parameter(Mandatory,Position=0)][String]$propertyKey
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/comment/{commentId}/properties/{propertyKey}'
}
Export-ModuleMember Set-JiraCloudCommentProperties

Function Get-JiraCloudProjectProperties {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='propertyKey')][String]$propertyKey,
        [Parameter(Mandatory,Position=0)][String]$projectIdOrKey,
        [Parameter(ParameterSetName='propertyKey')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/properties' }
        'propertyKey' { Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}' }
    }
}
Export-ModuleMember Get-JiraCloudProjectProperties

Function Find-JiraCloudStatusesSearch {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [String]$expand,
        [String]$projectId,
        [String]$searchString,
        [String]$statusCategory
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/statuses/search'
}
Export-ModuleMember Find-JiraCloudStatusesSearch

Function Get-JiraCloudFilterFavourite {
    [CmdletBinding()]
    param (
        [String]$expand
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/filter/favourite'
}
Export-ModuleMember Get-JiraCloudFilterFavourite

Function Get-JiraCloudAttachmentContent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [Switch]$redirect
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/attachment/content/{id}'
}
Export-ModuleMember Get-JiraCloudAttachmentContent

Function New-JiraCloudFieldContextMapping {
    [CmdletBinding()]
    param (
        [BigInt]$maxResults,
        [BigInt]$startAt,
        [Parameter(Mandatory,Position=0)][String]$fieldId,
        [PsObject[]]$mappings
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/field/{fieldId}/context/mapping'
}
Export-ModuleMember New-JiraCloudFieldContextMapping

Function Set-JiraCloudNotificationscheme {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$id,
        [String]$description,
        [String]$name
    )
    Invoke-JiraCloud -PsBP $PsBoundParameters '/rest/api/3/notificationscheme/{id}'
}
Export-ModuleMember Set-JiraCloudNotificationscheme

