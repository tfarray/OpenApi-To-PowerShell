Function Get-Amp1Forensicsnapshots {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='forensic_snapshot-id')][String]$forensic_snapshotid,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'forensic_snapshot-id' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/forensic_snapshots/{forensic_snapshot-id}' } 
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/forensic_snapshots' } 
    }
}
Export-ModuleMember Get-Amp1Forensicsnapshots

Function Remove-Amp1Groups {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$group_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/groups/{group_guid}'
}
Export-ModuleMember Remove-Amp1Groups

Function Get-Amp1FilelistsSimplecustomdetections {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [String]$name
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/simple_custom_detections'
}
Export-ModuleMember Get-Amp1FilelistsSimplecustomdetections

Function Get-Amp1Eventtypes {
    [CmdletBinding()]
    param ( )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/event_types'
}
Export-ModuleMember Get-Amp1Eventtypes

Function New-Amp1Groups {
    [CmdletBinding()]
    param ( )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/groups'
}
Export-ModuleMember New-Amp1Groups

Function Get-Amp1VulnerabilitiesComputers {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [Parameter(Mandatory,Position=0)][String]$sha256,
        [String]$end_time,
        [String]$group_guid,
        [String]$start_time
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/vulnerabilities/{sha256}/computers'
}
Export-ModuleMember Get-Amp1VulnerabilitiesComputers

Function Remove-Amp1Eventstreams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/event_streams/{id}'
}
Export-ModuleMember Remove-Amp1Eventstreams

Function Update-Amp1Groups {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$group_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/groups/{group_guid}'
}
Export-ModuleMember Update-Amp1Groups

Function Get-Amp1Policies {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='policy_guid')][String]$policy_guid,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][String]$product,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'policy_guid' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/policies/{policy_guid}' } 
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/policies' } 
    }
}
Export-ModuleMember Get-Amp1Policies

Function Get-Amp1Filelists {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$file_list_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/{file_list_guid}'
}
Export-ModuleMember Get-Amp1Filelists

Function Get-Amp1Auditlogtypes {
    [CmdletBinding()]
    param ( )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/audit_log_types'
}
Export-ModuleMember Get-Amp1Auditlogtypes

Function Get-Amp1FilelistsApplicationblocking {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [String]$name
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/application_blocking'
}
Export-ModuleMember Get-Amp1FilelistsApplicationblocking

Function Update-Amp1Computers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$connector_guid,
        [Parameter(Mandatory,Position=0)][String]$group_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}'
}
Export-ModuleMember Update-Amp1Computers

Function Set-Amp1ComputersIsolation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$connector_guid,
        [String]$comment
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/isolation'
}
Export-ModuleMember Set-Amp1ComputersIsolation

Function Update-Amp1GroupsParent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$child_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/groups/{child_guid}/parent'
}
Export-ModuleMember Update-Amp1GroupsParent

Function Get-Amp1Compromises {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='connector_guid')][String]$connector_guid,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'connector_guid' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/compromises/{connector_guid}' } 
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/compromises' } 
    }
}
Export-ModuleMember Get-Amp1Compromises

Function Get-Amp1ComputersIsolation {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$connector_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/isolation'
}
Export-ModuleMember Get-Amp1ComputersIsolation

Function New-Amp1Eventstreams {
    [CmdletBinding()]
    param (
        [PsObject[]]$event_type,
        [PsObject[]]$group_guid,
        [String]$name
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/event_streams'
}
Export-ModuleMember New-Amp1Eventstreams

Function Get-Amp1Groups {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='group_guid')][String]$group_guid,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'group_guid' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/groups/{group_guid}' } 
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/groups' } 
    }
}
Export-ModuleMember Get-Amp1Groups

Function Remove-Amp1Computers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$connector_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}'
}
Export-ModuleMember Remove-Amp1Computers

Function Get-Amp1ComputersVulnerabilities {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [Parameter(Mandatory,Position=0)][String]$connector_guid,
        [String]$end_time,
        [String]$start_time
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/vulnerabilities'
}
Export-ModuleMember Get-Amp1ComputersVulnerabilities

Function Update-Amp1Eventstreams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$id,
        [PsObject[]]$event_type,
        [PsObject[]]$group_guid,
        [String]$name
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/event_streams/{id}'
}
Export-ModuleMember Update-Amp1Eventstreams

Function Get-Amp1Events {
    [CmdletBinding()]
    param (
        [BigInt]$event_type,
        [BigInt]$limit,
        [BigInt]$offset,
        [String]$application_sha256,
        [String]$connector_guid,
        [String]$detection_sha256,
        [String]$group_guid,
        [String]$start_date
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/events'
}
Export-ModuleMember Get-Amp1Events

Function Remove-Amp1ComputersIsolation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$connector_guid,
        [String]$comment
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/isolation'
}
Export-ModuleMember Remove-Amp1ComputersIsolation

Function Get-Amp1FilelistsFiles {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$file_list_guid,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/{file_list_guid}/files' } 
        'sha256' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/{file_list_guid}/files/{sha256}' } 
    }
}
Export-ModuleMember Get-Amp1FilelistsFiles

Function Get-Amp1PoliciesConnectorupgrade {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$policy_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/policies/{policy_guid}/connector_upgrade'
}
Export-ModuleMember Get-Amp1PoliciesConnectorupgrade

Function Remove-Amp1PoliciesConnectorupgrade {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$policy_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/policies/{policy_guid}/connector_upgrade'
}
Export-ModuleMember Remove-Amp1PoliciesConnectorupgrade

Function Set-Amp1PoliciesConnectorupgrade {
    [CmdletBinding()]
    param (
        [HashTable]$date_range,
        [HashTable]$version,
        [Parameter(Mandatory,Position=0)][String]$policy_guid,
        $update_interval
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/policies/{policy_guid}/connector_upgrade'
}
Export-ModuleMember Set-Amp1PoliciesConnectorupgrade

Function Get-Amp1ComputersActivity {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [Parameter(Mandatory,Position=0)][String]$q
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/activity'
}
Export-ModuleMember Get-Amp1ComputersActivity

Function Get-Amp1Computers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='connector_guid')][String]$connector_guid,
        [Parameter(ParameterSetName='Search')][BigInt]$last_seen_over,
        [Parameter(ParameterSetName='Search')][BigInt]$last_seen_within,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][String]$external_ip,
        [Parameter(ParameterSetName='Search')][String]$group_guid,
        [Parameter(ParameterSetName='Search')][String]$hostname,
        [Parameter(ParameterSetName='Search')][String]$internal_ip,
        [Parameter(ParameterSetName='Search')][String]$processor_id,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Parameter(ParameterSetName='Search')][ValidateSet('low','medium','high','critical')][String]$kenna_risk_score,
        [Parameter(ParameterSetName='Search')][ValidateSet('low','medium','high','critical')][String]$risk_score
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers' } 
        'connector_guid' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}' } 
    }
}
Export-ModuleMember Get-Amp1Computers

Function Get-Amp1ComputersUseractivity {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$q
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/user_activity'
}
Export-ModuleMember Get-Amp1ComputersUseractivity

Function Get-Amp1ComputersTrajectory {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [Parameter(Mandatory,Position=0)][String]$connector_guid,
        [String]$end_time,
        [String]$q,
        [String]$start_time
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/trajectory'
}
Export-ModuleMember Get-Amp1ComputersTrajectory

Function Get-Amp1ComputersUsertrajectory {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [Parameter(Mandatory,Position=0)][String]$connector_guid,
        [String]$end_time,
        [String]$q,
        [String]$start_time
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/user_trajectory'
}
Export-ModuleMember Get-Amp1ComputersUsertrajectory

Function Remove-Amp1FilelistsFiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$file_list_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/{file_list_guid}/files/{sha256}'
}
Export-ModuleMember Remove-Amp1FilelistsFiles

Function Get-Amp1ComputersOsvulnerabilities {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [Parameter(Mandatory,Position=0)][String]$connector_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/computers/{connector_guid}/os_vulnerabilities'
}
Export-ModuleMember Get-Amp1ComputersOsvulnerabilities

Function New-Amp1Installpackages {
    [CmdletBinding()]
    param (
        [HashTable]$product_variant_atributes,
        [String]$group_guid,
        [String]$product_name,
        [Switch]$redistributable,
        [Switch]$scan_on_install
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/install_packages'
}
Export-ModuleMember New-Amp1Installpackages

Function New-Amp1FilelistsFiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$file_list_guid
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/file_lists/{file_list_guid}/files/{sha256}'
}
Export-ModuleMember New-Amp1FilelistsFiles

Function Get-Amp1Indicators {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='indicator_guid')][String]$indicator_guid,
        [Parameter(ParameterSetName='indicator_guid')][HashTable]$Body,
        [Parameter(ParameterSetName='Search')][BigInt]$limit,
        [Parameter(ParameterSetName='Search')][BigInt]$offset,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Parameter(ParameterSetName='Search')][Switch]$show_compromise_status_counts
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/indicators' } 
        'indicator_guid' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/indicators/{indicator_guid}' } 
    }
}
Export-ModuleMember Get-Amp1Indicators

Function Get-Amp1Auditlogs {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [String]$audit_log_id,
        [String]$audit_log_type,
        [String]$audit_log_user,
        [String]$end_time,
        [String]$start_time,
        [ValidateSet('update','create','delete')][String]$event
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/audit_logs'
}
Export-ModuleMember Get-Amp1Auditlogs

Function Get-Amp1Eventstreams {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0,ParameterSetName='id')][String]$id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'id' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/event_streams/{id}' } 
        'Search' { Invoke-Amp1 -PsBP $PsBoundParameters '/v1/event_streams' } 
    }
}
Export-ModuleMember Get-Amp1Eventstreams

Function Get-Amp1Vulnerabilities {
    [CmdletBinding()]
    param (
        [BigInt]$limit,
        [BigInt]$offset,
        [String]$end_time,
        [String]$group_guid,
        [String]$start_time
    )
    Invoke-Amp1 -PsBP $PsBoundParameters '/v1/vulnerabilities'
}
Export-ModuleMember Get-Amp1Vulnerabilities

