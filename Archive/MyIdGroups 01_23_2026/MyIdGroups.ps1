Function Add-MyIdGroupsMembershipsReport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/memberships/report' 
}
Export-ModuleMember Add-MyIdGroupsMembershipsReport

Function Get-MyIdGroupsMemberships {
    [CmdletBinding()]
    param ( )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/memberships' 
}
Export-ModuleMember Get-MyIdGroupsMemberships

Function Get-MyIdGroupsMemberofgroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='group_member_of_id')][int]$group_member_of_id,
        [String[]]$include,
        [String]$sort,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_of_groups' } 
        'group_member_of_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_of_groups/{group_member_of_id}' } 
    }
}
Export-ModuleMember Get-MyIdGroupsMemberofgroups

Function Get-MyIdGroupsMembergroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='member_group_id')][int]$member_group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'member_group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_groups/{member_group_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_groups' } 
    }
}
Export-ModuleMember Get-MyIdGroupsMembergroups

Function Get-MyIdGroupsUsersSummary {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/summary' 
}
Export-ModuleMember Get-MyIdGroupsUsersSummary

Function Find-MyIdGroupsRequestitems {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [String[]]$include,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/request_items' 
}
Export-ModuleMember Find-MyIdGroupsRequestitems

Function Add-MyIdGroupsMembergroups {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_groups' 
}
Export-ModuleMember Add-MyIdGroupsMembergroups

Function Add-MyIdGroupsOwnergroups {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_groups' 
}
Export-ModuleMember Add-MyIdGroupsOwnergroups

Function New-MyIdGroupsCopy {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/copy' 
}
Export-ModuleMember New-MyIdGroupsCopy

Function Remove-MyIdGroupsMemberusers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='user_id')][int]$user_id,
        [Parameter(ParameterSetName='Search')][ValidateSet('id','username')][String]$format,
        [String]$validate,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'user_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_users/{user_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_users' } 
    }
}
Export-ModuleMember Remove-MyIdGroupsMemberusers

Function Remove-MyIdGroupsUsersOwnerships {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='group_id')][int]$group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/ownerships' } 
        'group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/ownerships/{group_id}' } 
    }
}
Export-ModuleMember Remove-MyIdGroupsUsersOwnerships

Function Get-MyIdGroupsRequests {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0,ParameterSetName='request_id')][int]$request_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String[]]$view,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'request_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/requests/{request_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/requests' } 
    }
}
Export-ModuleMember Get-MyIdGroupsRequests

Function New-MyIdGroupsRequestsApproval {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/requests/approval' 
}
Export-ModuleMember New-MyIdGroupsRequestsApproval

Function New-MyIdGroupsOperations {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/operations' 
}
Export-ModuleMember New-MyIdGroupsOperations

Function New-MyIdGroupsRestore {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/restore' 
}
Export-ModuleMember New-MyIdGroupsRestore

Function Get-MyIdGroupsReserved {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/reserved' 
}
Export-ModuleMember Get-MyIdGroupsReserved

Function New-MyIdGroupsUsers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users' -InQuery "validate"
}
Export-ModuleMember New-MyIdGroupsUsers

Function Remove-MyIdGroupsMembergroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='member_group_id')][int]$member_group_id,
        [String]$validate,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'member_group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_groups/{member_group_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_groups' } 
    }
}
Export-ModuleMember Remove-MyIdGroupsMembergroups

Function Find-MyIdGroupsUsers {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [String[]]$include,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users' 
}
Export-ModuleMember Find-MyIdGroupsUsers

Function Remove-MyIdGroups {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}' 
}
Export-ModuleMember Remove-MyIdGroups

Function Update-MyIdGroupsMailguards {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$mailguard_id
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/mailguards/{mailguard_id}' 
}
Export-ModuleMember Update-MyIdGroupsMailguards

Function Remove-MyIdGroupsOwnergroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='owner_group_id')][int]$owner_group_id,
        [String]$validate,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_groups' } 
        'owner_group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_groups/{owner_group_id}' } 
    }
}
Export-ModuleMember Remove-MyIdGroupsOwnergroups

Function Get-MyIdGroupsErrorCode {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$application_code
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/error/code/{application_code}' 
}
Export-ModuleMember Get-MyIdGroupsErrorCode

Function Remove-MyIdGroupsUsersMemberships {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='group_id')][int]$group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/memberships' } 
        'group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/memberships/{group_id}' } 
    }
}
Export-ModuleMember Remove-MyIdGroupsUsersMemberships

Function Get-MyIdGroupsUser {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [String[]]$include,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/user' 
}
Export-ModuleMember Get-MyIdGroupsUser

Function Get-MyIdGroupsRelationshipsRequests {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String[]]$include,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/requests' 
}
Export-ModuleMember Get-MyIdGroupsRelationshipsRequests

Function Get-MyIdGroupsRequestsRequestitems {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [Parameter(Mandatory,Position=0)][int]$request_id,
        [String[]]$include,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/requests/{request_id}/relationships/request_items' 
}
Export-ModuleMember Get-MyIdGroupsRequestsRequestitems

Function New-MyIdGroupsSailpointGroupsMigrate {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/sailpoint/groups/{group_id}/migrate' -InQuery "validate"
}
Export-ModuleMember New-MyIdGroupsSailpointGroupsMigrate

Function Find-MyIdGroupsTargets {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/targets' 
}
Export-ModuleMember Find-MyIdGroupsTargets

Function Get-MyIdGroupsUsersMemberships {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='group_id')][int]$group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/memberships' } 
        'group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/memberships/{group_id}' } 
    }
}
Export-ModuleMember Get-MyIdGroupsUsersMemberships

Function Get-MyIdGroupsMembershipsReport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/memberships/report' 
}
Export-ModuleMember Get-MyIdGroupsMembershipsReport

Function Get-MyIdGroupsUsersOwnerships {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='group_id')][int]$group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/ownerships' } 
        'group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/ownerships/{group_id}' } 
    }
}
Export-ModuleMember Get-MyIdGroupsUsersOwnerships

Function Remove-MyIdGroupsOwnerusers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='user_id')][int]$user_id,
        [Parameter(ParameterSetName='Search')][ValidateSet('id','username')][String]$format,
        [String]$validate,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'user_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_users/{user_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_users' } 
    }
}
Export-ModuleMember Remove-MyIdGroupsOwnerusers

Function Add-MyIdGroupsUsersMemberships {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/memberships' 
}
Export-ModuleMember Add-MyIdGroupsUsersMemberships

Function Get-MyIdGroupsUtilGroupId {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$group_name,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/util/group/{group_name}/id' 
}
Export-ModuleMember Get-MyIdGroupsUtilGroupId

Function Remove-MyIdGroupsRequestsApproval {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/requests/approval' 
}
Export-ModuleMember Remove-MyIdGroupsRequestsApproval

Function Get-MyIdGroupsUsersMembershipsAggregation {
    [CmdletBinding()]
    param (
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/relationships/memberships/aggregation' 
}
Export-ModuleMember Get-MyIdGroupsUsersMembershipsAggregation

Function Get-MyIdGroupsMemberusers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='user_id')][int]$user_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'user_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_users/{user_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_users' } 
    }
}
Export-ModuleMember Get-MyIdGroupsMemberusers

Function Find-MyIdGroupsNotificationsTypes {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/notifications/types' 
}
Export-ModuleMember Find-MyIdGroupsNotificationsTypes

Function Get-MyIdGroupsOwnerusers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='user_id')][int]$user_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'user_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_users/{user_id}' } 
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_users' } 
    }
}
Export-ModuleMember Get-MyIdGroupsOwnerusers

Function Get-MyIdGroupsUsers {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}' 
}
Export-ModuleMember Get-MyIdGroupsUsers

Function New-MyIdGroups {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups' -InQuery "validate"
}
Export-ModuleMember New-MyIdGroups

Function Update-MyIdGroups {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$validate,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}' -InQuery "validate"
}
Export-ModuleMember Update-MyIdGroups

Function Get-MyIdGroupsOwnerofgroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='group_owner_of_id')][int]$group_owner_of_id,
        [String[]]$include,
        [String]$sort,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_of_groups' } 
        'group_owner_of_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_of_groups/{group_owner_of_id}' } 
    }
}
Export-ModuleMember Get-MyIdGroupsOwnerofgroups

Function Get-MyIdGroupsTargets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0,ParameterSetName='groupsgroup_idrelationshipstargets')][int]$group_id,
        [Parameter(Mandatory,Position=0,ParameterSetName='targetstargets_id')][int]$targets_id,
        [Parameter(ParameterSetName='groupsgroup_idrelationshipstargets')][HashTable]$filter,
        [Parameter(ParameterSetName='groupsgroup_idrelationshipstargets')][HashTable]$page,
        [Parameter(ParameterSetName='groupsgroup_idrelationshipstargets')][String]$sort,
        [Parameter(ParameterSetName='groupsgroup_idrelationshipstargets')][Switch]$GetAll,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'targetstargets_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/targets/{targets_id}' } 
        'groupsgroup_idrelationshipstargets' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/targets' } 
    }
}
Export-ModuleMember Get-MyIdGroupsTargets

Function Add-MyIdGroupsMemberusers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$validate,
        [String]$XRequestID,
        [ValidateSet('id','username')][String]$format
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/member_users' 
}
Export-ModuleMember Add-MyIdGroupsMemberusers

Function Add-MyIdGroupsOwnerusersClaimownership {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_users/claim_ownership' 
}
Export-ModuleMember Add-MyIdGroupsOwnerusersClaimownership

Function Get-MyIdGroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0,ParameterSetName='group_id')][int]$group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Parameter(ParameterSetName='Search')][ValidateSet('csv')][String]$export,
        [String[]]$include,
        [String]$notification_subscriptions,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups' } 
        'group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}' } 
    }
}
Export-ModuleMember Get-MyIdGroups

Function Add-MyIdGroupsOwnerusers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [String]$validate,
        [String]$XRequestID,
        [ValidateSet('id','username')][String]$format
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_users' 
}
Export-ModuleMember Add-MyIdGroupsOwnerusers

Function Get-MyIdGroupsOwnergroups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$fields,
        [Parameter(Mandatory,Position=0)][int]$group_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='owner_group_id')][int]$owner_group_id,
        [Parameter(ParameterSetName='Search')][HashTable]$filter,
        [Parameter(ParameterSetName='Search')][HashTable]$page,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$include,
        [String]$XRequestID
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_groups' } 
        'owner_group_id' { Invoke-MyIdGroups -PsBP $PsBoundParameters '/groups/{group_id}/relationships/owner_groups/{owner_group_id}' } 
    }
}
Export-ModuleMember Get-MyIdGroupsOwnergroups

Function Get-MyIdGroupsUsersRelationshipsRequests {
    [CmdletBinding()]
    param (
        [HashTable]$fields,
        [HashTable]$filter,
        [HashTable]$page,
        [Parameter()][Switch]$GetAll,
        [Parameter(Mandatory,Position=0)][int]$user_id,
        [String[]]$include,
        [String[]]$view,
        [String]$sort,
        [String]$XRequestID
    )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/users/{user_id}/relationships/requests' 
}
Export-ModuleMember Get-MyIdGroupsUsersRelationshipsRequests

Function Get-MyIdGroupsError {
    [CmdletBinding()]
    param ( )
    Invoke-MyIdGroups -PsBP $PsBoundParameters '/error' 
}
Export-ModuleMember Get-MyIdGroupsError

