Function Get-GitHubEnterprisesCopilotUsage {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$enterprise,
        [String]$since,
        [String]$until
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'enterprises/{enterprise}/copilot/usage'
}
Export-ModuleMember Get-GitHubEnterprisesCopilotUsage

Function Update-GitHubGistsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$gist_id,
        [Parameter(Mandatory,Position=1)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/comments/{comment_id}'
}
Export-ModuleMember Update-GitHubGistsComments

Function Get-GitHubReposEnvironmentsDeploymentprotectionrulesApps {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$environment_name,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$owner
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/apps'
}
Export-ModuleMember Get-GitHubReposEnvironmentsDeploymentprotectionrulesApps

Function Get-GitHubOrgsActionsRunners {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='runner_id')][Int]$runner_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'runner_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners' } 
    }
}
Export-ModuleMember Get-GitHubOrgsActionsRunners

Function New-GitHubOrgsMigrations {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations'
}
Export-ModuleMember New-GitHubOrgsMigrations

Function New-GitHubUserMigrations {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations'
}
Export-ModuleMember New-GitHubUserMigrations

Function Get-GitHubMarketplacelistingPlans {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'marketplace_listing/plans'
}
Export-ModuleMember Get-GitHubMarketplacelistingPlans

Function Remove-GitHubUserStarred {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/starred/{owner}/{repo}'
}
Export-ModuleMember Remove-GitHubUserStarred

Function Get-GitHubReposEnvironmentsVariables {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3,ParameterSetName='name')][String]$name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/variables/{name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/variables' } 
    }
}
Export-ModuleMember Get-GitHubReposEnvironmentsVariables

Function Remove-GitHubUserRepositoryinvitations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$invitation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/repository_invitations/{invitation_id}'
}
Export-ModuleMember Remove-GitHubUserRepositoryinvitations

Function Get-GitHubReposCodescanningCodeqlDatabases {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='language')][String]$language
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/codeql/databases' } 
        'language' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/codeql/databases/{language}' } 
    }
}
Export-ModuleMember Get-GitHubReposCodescanningCodeqlDatabases

Function Remove-GitHubUserMigrationsReposLock {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$migration_id,
        [Parameter(Mandatory,Position=1)][String]$repo_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations/{migration_id}/repos/{repo_name}/lock'
}
Export-ModuleMember Remove-GitHubUserMigrationsReposLock

Function Update-GitHubUserRepositoryinvitations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$invitation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/repository_invitations/{invitation_id}'
}
Export-ModuleMember Update-GitHubUserRepositoryinvitations

Function Get-GitHubReposActionsRunsLogs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/logs'
}
Export-ModuleMember Get-GitHubReposActionsRunsLogs

Function Set-GitHubReposBranchesProtectionRestrictionsApps {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
}
Export-ModuleMember Set-GitHubReposBranchesProtectionRestrictionsApps

Function Get-GitHubReposIssuesTimeline {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/timeline'
}
Export-ModuleMember Get-GitHubReposIssuesTimeline

Function Get-GitHubAppHookDeliveries {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='delivery_id')][Int]$delivery_id,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$cursor,
        [Parameter(ParameterSetName='Search')][Switch]$redelivery
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'app/hook/deliveries' } 
        'delivery_id' { Invoke-GitHub -PsBP $PsBoundParameters 'app/hook/deliveries/{delivery_id}' } 
    }
}
Export-ModuleMember Get-GitHubAppHookDeliveries

Function Get-GitHubUserCodespaces {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='codespace_name')][String]$codespace_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces' } 
        'codespace_name' { Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}' } 
    }
}
Export-ModuleMember Get-GitHubUserCodespaces

Function New-GitHubReposPagesDeploymentsCancel {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$pages_deployment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}/cancel'
}
Export-ModuleMember New-GitHubReposPagesDeploymentsCancel

Function Test-GitHubApplicationsToken {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$client_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'applications/{client_id}/token'
}
Export-ModuleMember Test-GitHubApplicationsToken

Function Remove-GitHubReposIssuesCommentsReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id,
        [Parameter(Mandatory,Position=3)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments/{comment_id}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubReposIssuesCommentsReactions

Function Remove-GitHubOrgsCodespacesSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubOrgsCodespacesSecrets

Function Get-GitHubReposPullsReviewsComments {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3)][Int]$review_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments'
}
Export-ModuleMember Get-GitHubReposPullsReviewsComments

Function New-GitHubAppHookDeliveriesAttempts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$delivery_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/hook/deliveries/{delivery_id}/attempts'
}
Export-ModuleMember New-GitHubAppHookDeliveriesAttempts

Function Get-GitHubUsersSshsigningkeys {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/ssh_signing_keys'
}
Export-ModuleMember Get-GitHubUsersSshsigningkeys

Function Remove-GitHubTeamsRepos {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$owner,
        [Parameter(Mandatory,Position=2)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/repos/{owner}/{repo}'
}
Export-ModuleMember Remove-GitHubTeamsRepos

Function Get-GitHubReposBranchesProtectionRestrictions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRestrictions

Function Get-GitHubReposReleasesTags {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$tag
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/tags/{tag}'
}
Export-ModuleMember Get-GitHubReposReleasesTags

Function New-GitHubReposSecurityadvisoriesForks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ghsa_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories/{ghsa_id}/forks'
}
Export-ModuleMember New-GitHubReposSecurityadvisoriesForks

Function New-GitHubReposIssuesComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/comments'
}
Export-ModuleMember New-GitHubReposIssuesComments

Function Get-GitHubReposActionsRunnersDownloads {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/downloads'
}
Export-ModuleMember Get-GitHubReposActionsRunnersDownloads

Function Get-GitHubUserGpgkeys {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='gpg_key_id')][Int]$gpg_key_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'gpg_key_id' { Invoke-GitHub -PsBP $PsBoundParameters 'user/gpg_keys/{gpg_key_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/gpg_keys' } 
    }
}
Export-ModuleMember Get-GitHubUserGpgkeys

Function Get-GitHubReposPullsRequestedreviewers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers'
}
Export-ModuleMember Get-GitHubReposPullsRequestedreviewers

Function Set-GitHubReposSubscription {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/subscription'
}
Export-ModuleMember Set-GitHubReposSubscription

Function Get-GitHubReposKeys {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='key_id')][Int]$key_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'key_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/keys/{key_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/keys' } 
    }
}
Export-ModuleMember Get-GitHubReposKeys

Function Remove-GitHubOrgsCodespacesAccessSelectedusers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/access/selected_users'
}
Export-ModuleMember Remove-GitHubOrgsCodespacesAccessSelectedusers

Function New-GitHubReposForks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/forks'
}
Export-ModuleMember New-GitHubReposForks

Function Get-GitHubReposReleasesLatest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/latest'
}
Export-ModuleMember Get-GitHubReposReleasesLatest

Function Get-GitHubReposActionsSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/secrets/public-key'
}
Export-ModuleMember Get-GitHubReposActionsSecretsPublickey

Function Get-GitHubReposIssues {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='issue_number')][Int]$issue_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$assignee,
        [Parameter(ParameterSetName='Search')][String]$creator,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$labels,
        [Parameter(ParameterSetName='Search')][String]$mentioned,
        [Parameter(ParameterSetName='Search')][String]$milestone,
        [Parameter(ParameterSetName='Search')][String]$since,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issue_number' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues' } 
    }
}
Export-ModuleMember Get-GitHubReposIssues

Function Get-GitHubReposActionsOrganizationvariables {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/organization-variables'
}
Export-ModuleMember Get-GitHubReposActionsOrganizationvariables

Function New-GitHubProjectsColumnsCardsMoves {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$card_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/cards/{card_id}/moves'
}
Export-ModuleMember New-GitHubProjectsColumnsCardsMoves

Function Set-GitHubReposBranchesProtectionRestrictionsUsers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
}
Export-ModuleMember Set-GitHubReposBranchesProtectionRestrictionsUsers

Function Set-GitHubOrgsActionsSecretsRepositories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name,
        [Parameter(Mandatory,Position=2,ParameterSetName='repository_id')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'repository_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}/repositories' } 
    }
}
Export-ModuleMember Set-GitHubOrgsActionsSecretsRepositories

Function Set-GitHubReposActionsSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubReposActionsSecrets

Function New-GitHubReposPullsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/comments'
}
Export-ModuleMember New-GitHubReposPullsComments

Function New-GitHubReposHooksTests {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/tests'
}
Export-ModuleMember New-GitHubReposHooksTests

Function Get-GitHubOrgsPublicmembers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/public_members/{username}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/public_members' } 
    }
}
Export-ModuleMember Get-GitHubOrgsPublicmembers

Function New-GitHubReposSecurityadvisoriesReports {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories/reports'
}
Export-ModuleMember New-GitHubReposSecurityadvisoriesReports

Function Set-GitHubOrgsTeamsRepos {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][String]$owner,
        [Parameter(Mandatory,Position=3)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}'
}
Export-ModuleMember Set-GitHubOrgsTeamsRepos

Function New-GitHubReposCheckruns {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-runs'
}
Export-ModuleMember New-GitHubReposCheckruns

Function Remove-GitHubOrgsHooks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}'
}
Export-ModuleMember Remove-GitHubOrgsHooks

Function Update-GitHubUser {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user'
}
Export-ModuleMember Update-GitHubUser

Function Update-GitHubUserMembershipsOrgs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/memberships/orgs/{org}'
}
Export-ModuleMember Update-GitHubUserMembershipsOrgs

Function Get-GitHubReposPropertiesValues {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/properties/values'
}
Export-ModuleMember Get-GitHubReposPropertiesValues

Function New-GitHubReposCommitsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$commit_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{commit_sha}/comments'
}
Export-ModuleMember New-GitHubReposCommitsComments

Function Remove-GitHubOrgsPublicmembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/public_members/{username}'
}
Export-ModuleMember Remove-GitHubOrgsPublicmembers

Function Remove-GitHubReposBranchesProtectionRequiredpullrequestreviews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRequiredpullrequestreviews

Function Get-GitHubReposActionsWorkflows {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='workflow_id')]$workflow_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows' } 
        'workflow_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows/{workflow_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposActionsWorkflows

Function Get-GitHubUsersStarred {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username,
        [String]$direction,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/starred'
}
Export-ModuleMember Get-GitHubUsersStarred

Function Remove-GitHubReposEnvironments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}'
}
Export-ModuleMember Remove-GitHubReposEnvironments

Function Get-GitHubReposActionsRunners {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='runner_id')][Int]$runner_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners' } 
        'runner_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposActionsRunners

Function Remove-GitHubReposActionsVariables {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/variables/{name}'
}
Export-ModuleMember Remove-GitHubReposActionsVariables

Function Get-GitHubOrgsPackages {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1,ParameterSetName='package_typepackage_name')][String]$package_name,
        [Parameter(Mandatory,Position=1)][String]$org,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$visibility,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages' } 
        'package_typepackage_name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsPackages

Function New-GitHubReposBranchesProtectionRestrictionsUsers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
}
Export-ModuleMember New-GitHubReposBranchesProtectionRestrictionsUsers

Function Get-GitHubReposLanguages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/languages'
}
Export-ModuleMember Get-GitHubReposLanguages

Function Get-GitHubReposInvitations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/invitations'
}
Export-ModuleMember Get-GitHubReposInvitations

Function Get-GitHubUserFollowing {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'user/following/{username}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/following' } 
    }
}
Export-ModuleMember Get-GitHubUserFollowing

Function Get-GitHubClassrooms {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='classroom_id')][Int]$classroom_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'classroom_id' { Invoke-GitHub -PsBP $PsBoundParameters 'classrooms/{classroom_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'classrooms' } 
    }
}
Export-ModuleMember Get-GitHubClassrooms

Function Get-GitHubOrgsActionsOidcCustomizationSub {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/oidc/customization/sub'
}
Export-ModuleMember Get-GitHubOrgsActionsOidcCustomizationSub

Function New-GitHubOrgsPersonalaccesstokens {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='pat_id')][Int]$pat_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-tokens' } 
        'pat_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-tokens/{pat_id}' } 
    }
}
Export-ModuleMember New-GitHubOrgsPersonalaccesstokens

Function Get-GitHubReposCommitsCheckruns {
    [CmdletBinding()]
    param (
        [Int]$app_id,
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref,
        [String]$check_name,
        [String]$filter,
        [String]$status
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{ref}/check-runs'
}
Export-ModuleMember Get-GitHubReposCommitsCheckruns

Function Update-GitHubReposGitRefs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/refs/{ref}'
}
Export-ModuleMember Update-GitHubReposGitRefs

Function Get-GitHubUserMarketplacepurchases {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/marketplace_purchases'
}
Export-ModuleMember Get-GitHubUserMarketplacepurchases

Function New-GitHubReposPullsCodespaces {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/codespaces'
}
Export-ModuleMember New-GitHubReposPullsCodespaces

Function Get-GitHubUsersHovercard {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username,
        [String]$subject_id,
        [String]$subject_type
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/hovercard'
}
Export-ModuleMember Get-GitHubUsersHovercard

Function Set-GitHubOrgsBlocks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/blocks/{username}'
}
Export-ModuleMember Set-GitHubOrgsBlocks

Function Remove-GitHubReposIssuesAssignees {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/assignees'
}
Export-ModuleMember Remove-GitHubReposIssuesAssignees

Function Get-GitHubReposMilestonesLabels {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$milestone_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/milestones/{milestone_number}/labels'
}
Export-ModuleMember Get-GitHubReposMilestonesLabels

Function Remove-GitHubOrgsPropertiesSchema {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$custom_property_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/schema/{custom_property_name}'
}
Export-ModuleMember Remove-GitHubOrgsPropertiesSchema

Function New-GitHubReposReleases {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases'
}
Export-ModuleMember New-GitHubReposReleases

Function Update-GitHubAppHookConfig {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/hook/config'
}
Export-ModuleMember Update-GitHubAppHookConfig

Function New-GitHubReposBranchesProtectionRequiredsignatures {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_signatures'
}
Export-ModuleMember New-GitHubReposBranchesProtectionRequiredsignatures

Function Get-GitHubReposActionsRunsTiming {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/timing'
}
Export-ModuleMember Get-GitHubReposActionsRunsTiming

Function Get-GitHubRatelimit {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'rate_limit'
}
Export-ModuleMember Get-GitHubRatelimit

Function Get-GitHubReposActionsPermissionsWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions/workflow'
}
Export-ModuleMember Get-GitHubReposActionsPermissionsWorkflow

Function New-GitHubUserCodespacesExports {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}/exports'
}
Export-ModuleMember New-GitHubUserCodespacesExports

Function Remove-GitHubUserInteractionlimits {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/interaction-limits'
}
Export-ModuleMember Remove-GitHubUserInteractionlimits

Function New-GitHubOrgsTeamsDiscussions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions'
}
Export-ModuleMember New-GitHubOrgsTeamsDiscussions

Function Get-GitHubReposReleases {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='release_id')][Int]$release_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'release_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases' } 
    }
}
Export-ModuleMember Get-GitHubReposReleases

Function Get-GitHubOrgsActionsPermissionsSelectedactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/selected-actions'
}
Export-ModuleMember Get-GitHubOrgsActionsPermissionsSelectedactions

Function Get-GitHubLicenses {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='license')][String]$license,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$featured,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'license' { Invoke-GitHub -PsBP $PsBoundParameters 'licenses/{license}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'licenses' } 
    }
}
Export-ModuleMember Get-GitHubLicenses

Function Remove-GitHubTeamsDiscussions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}'
}
Export-ModuleMember Remove-GitHubTeamsDiscussions

Function Remove-GitHubReposIssuesComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments/{comment_id}'
}
Export-ModuleMember Remove-GitHubReposIssuesComments

Function Get-GitHubEmojis {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'emojis'
}
Export-ModuleMember Get-GitHubEmojis

Function Find-GitHubSearchTopics {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$q
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/topics'
}
Export-ModuleMember Find-GitHubSearchTopics

Function Get-GitHubReposMilestones {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='milestone_number')][Int]$milestone_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/milestones' } 
        'milestone_number' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/milestones/{milestone_number}' } 
    }
}
Export-ModuleMember Get-GitHubReposMilestones

Function New-GitHubReposPulls {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls'
}
Export-ModuleMember New-GitHubReposPulls

Function Get-GitHubEvents {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'events'
}
Export-ModuleMember Get-GitHubEvents

Function Update-GitHubReposSecretscanningAlerts {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$alert_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}'
}
Export-ModuleMember Update-GitHubReposSecretscanningAlerts

Function Get-GitHubOrgsOutsidecollaborators {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$filter
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/outside_collaborators'
}
Export-ModuleMember Get-GitHubOrgsOutsidecollaborators

Function New-GitHubAppInstallationsAccesstokens {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$installation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/installations/{installation_id}/access_tokens'
}
Export-ModuleMember New-GitHubAppInstallationsAccesstokens

Function Get-GitHubOrgsInstallation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/installation'
}
Export-ModuleMember Get-GitHubOrgsInstallation

Function Update-GitHubReposImport {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import'
}
Export-ModuleMember Update-GitHubReposImport

Function Get-GitHubUserInstallationsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$installation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/installations/{installation_id}/repositories'
}
Export-ModuleMember Get-GitHubUserInstallationsRepositories

Function New-GitHubMarkdownRaw {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'markdown/raw'
}
Export-ModuleMember New-GitHubMarkdownRaw

Function Get-GitHubUsersGists {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username,
        [String]$since
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/gists'
}
Export-ModuleMember Get-GitHubUsersGists

Function New-GitHubOrgs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$security_product,
        [Parameter(Mandatory,Position=2)][String]$enablement
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/{security_product}/{enablement}'
}
Export-ModuleMember New-GitHubOrgs

Function Get-GitHubOrgsProjects {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/projects'
}
Export-ModuleMember Get-GitHubOrgsProjects

Function Set-GitHubReposRulesets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$ruleset_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets/{ruleset_id}'
}
Export-ModuleMember Set-GitHubReposRulesets

Function Get-GitHubReposInstallation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/installation'
}
Export-ModuleMember Get-GitHubReposInstallation

Function Remove-GitHubOrgsRulesets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$ruleset_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets/{ruleset_id}'
}
Export-ModuleMember Remove-GitHubOrgsRulesets

Function Update-GitHubReposLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/labels/{name}'
}
Export-ModuleMember Update-GitHubReposLabels

Function New-GitHubReposActionsRunsPendingdeployments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments'
}
Export-ModuleMember New-GitHubReposActionsRunsPendingdeployments

Function Remove-GitHubUserSocialaccounts {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/social_accounts'
}
Export-ModuleMember Remove-GitHubUserSocialaccounts

Function Get-GitHubReposCompare {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$basehead
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/compare/{basehead}'
}
Export-ModuleMember Get-GitHubReposCompare

Function New-GitHubReposCheckrunsRerequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest'
}
Export-ModuleMember New-GitHubReposCheckrunsRerequest

Function Get-GitHubOrgsTeamsRepos {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2,ParameterSetName='ownerrepo')][String]$owner,
        [Parameter(Mandatory,Position=3,ParameterSetName='ownerrepo')][String]$repo,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ownerrepo' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/repos' } 
    }
}
Export-ModuleMember Get-GitHubOrgsTeamsRepos

Function Get-GitHubOrgsActionsSecretsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}/repositories'
}
Export-ModuleMember Get-GitHubOrgsActionsSecretsRepositories

Function Remove-GitHubReposEnvironmentsVariables {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$name,
        [Parameter(Mandatory,Position=3)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/variables/{name}'
}
Export-ModuleMember Remove-GitHubReposEnvironmentsVariables

Function Get-GitHubReposBranchesProtectionRequiredstatuschecksContexts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRequiredstatuschecksContexts

Function New-GitHubGistsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/comments'
}
Export-ModuleMember New-GitHubGistsComments

Function Get-GitHubUserInstallations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/installations'
}
Export-ModuleMember Get-GitHubUserInstallations

Function Get-GitHubReposReleasesAssets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='assetsasset_id')][Int]$asset_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='release_idassets')][Int]$release_id,
        [Parameter(ParameterSetName='release_idassets')][Int]$page,
        [Parameter(ParameterSetName='release_idassets')][Int]$per_page,
        [Parameter(ParameterSetName='release_idassets')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'assetsasset_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/assets/{asset_id}' } 
        'release_idassets' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}/assets' } 
    }
}
Export-ModuleMember Get-GitHubReposReleasesAssets

Function Set-GitHubOrgsSecuritymanagersTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/security-managers/teams/{team_slug}'
}
Export-ModuleMember Set-GitHubOrgsSecuritymanagersTeams

Function Get-GitHubOrganizations {
    [CmdletBinding()]
    param (
        [Int]$per_page,
        [Int]$since
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'organizations'
}
Export-ModuleMember Get-GitHubOrganizations

Function Get-GitHubReposTrafficPopularReferrers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/traffic/popular/referrers'
}
Export-ModuleMember Get-GitHubReposTrafficPopularReferrers

Function Set-GitHubOrgsDependabotSecretsRepositories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name,
        [Parameter(Mandatory,Position=2,ParameterSetName='repository_id')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'repository_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}/repositories' } 
    }
}
Export-ModuleMember Set-GitHubOrgsDependabotSecretsRepositories

Function New-GitHubUserCodespaces {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces'
}
Export-ModuleMember New-GitHubUserCodespaces

Function Get-GitHubOrgsMembers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$filter,
        [Parameter(ParameterSetName='Search')][String]$role,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members' } 
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members/{username}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsMembers

Function Get-GitHubApp {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'app'
}
Export-ModuleMember Get-GitHubApp

Function Get-GitHubOctocat {
    [CmdletBinding()]
    param (
        [String]$s
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'octocat'
}
Export-ModuleMember Get-GitHubOctocat

Function Get-GitHubApps {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$app_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'apps/{app_slug}'
}
Export-ModuleMember Get-GitHubApps

Function New-GitHubReposEnvironmentsDeploymentbranchpolicies {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies'
}
Export-ModuleMember New-GitHubReposEnvironmentsDeploymentbranchpolicies

Function Update-GitHubOrgsPropertiesSchema {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/schema'
}
Export-ModuleMember Update-GitHubOrgsPropertiesSchema

Function Get-GitHubReposZipball {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/zipball/{ref}'
}
Export-ModuleMember Get-GitHubReposZipball

Function Remove-GitHubReposImport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import'
}
Export-ModuleMember Remove-GitHubReposImport

Function Remove-GitHubOrgsOrganizationroles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$role_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/{role_id}'
}
Export-ModuleMember Remove-GitHubOrgsOrganizationroles

Function Get-GitHubOrgsIssues {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$direction,
        [String]$filter,
        [String]$labels,
        [String]$since,
        [String]$sort,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/issues'
}
Export-ModuleMember Get-GitHubOrgsIssues

Function Get-GitHubUserIssues {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [String]$direction,
        [String]$filter,
        [String]$labels,
        [String]$since,
        [String]$sort,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/issues'
}
Export-ModuleMember Get-GitHubUserIssues

Function Remove-GitHubUserCodespaces {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}'
}
Export-ModuleMember Remove-GitHubUserCodespaces

Function Update-GitHubOrgsHooksConfig {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}/config'
}
Export-ModuleMember Update-GitHubOrgsHooksConfig

Function Remove-GitHubReposBranchesProtection {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection'
}
Export-ModuleMember Remove-GitHubReposBranchesProtection

Function Remove-GitHubOrgs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}'
}
Export-ModuleMember Remove-GitHubOrgs

Function New-GitHubReposActionsRunsDeploymentprotectionrule {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/deployment_protection_rule'
}
Export-ModuleMember New-GitHubReposActionsRunsDeploymentprotectionrule

Function New-GitHubUserPackagesVersionsRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][Int]$package_version_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}/versions/{package_version_id}/restore'
}
Export-ModuleMember New-GitHubUserPackagesVersionsRestore

Function Remove-GitHubReposEnvironmentsSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubReposEnvironmentsSecrets

Function Remove-GitHubOrgsTeamsDiscussions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsDiscussions

Function Get-GitHubReposLicense {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        $ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/license'
}
Export-ModuleMember Get-GitHubReposLicense

Function New-GitHubReposCodescanningCodeqlVariantanalyses {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/codeql/variant-analyses'
}
Export-ModuleMember New-GitHubReposCodescanningCodeqlVariantanalyses

Function Get-GitHubReposActionsRunsArtifacts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id,
        [String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/artifacts'
}
Export-ModuleMember Get-GitHubReposActionsRunsArtifacts

Function Remove-GitHubUserBlocks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/blocks/{username}'
}
Export-ModuleMember Remove-GitHubUserBlocks

Function Remove-GitHubOrgsTeamsDiscussionsComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3)][Int]$comment_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsDiscussionsComments

Function New-GitHubOrgsCopilotBillingSelectedteams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/billing/selected_teams'
}
Export-ModuleMember New-GitHubOrgsCopilotBillingSelectedteams

Function Get-GitHubOrgsCodespaces {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces'
}
Export-ModuleMember Get-GitHubOrgsCodespaces

Function Get-GitHubReposActionsRunsAttemptsJobs {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id,
        [Parameter(Mandatory,Position=3)][Int]$attempt_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs'
}
Export-ModuleMember Get-GitHubReposActionsRunsAttemptsJobs

Function Remove-GitHubReposInvitations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$invitation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/invitations/{invitation_id}'
}
Export-ModuleMember Remove-GitHubReposInvitations

Function New-GitHubReposChecksuitesRerequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_suite_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest'
}
Export-ModuleMember New-GitHubReposChecksuitesRerequest

Function Remove-GitHubOrgsMigrationsArchive {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$migration_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations/{migration_id}/archive'
}
Export-ModuleMember Remove-GitHubOrgsMigrationsArchive

Function Get-GitHubOrgsDependabotSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets' } 
    }
}
Export-ModuleMember Get-GitHubOrgsDependabotSecrets

Function Get-GitHubOrgsCopilotUsage {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$since,
        [String]$until
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/usage'
}
Export-ModuleMember Get-GitHubOrgsCopilotUsage

Function New-GitHubReposActionsRunsRerun {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/rerun'
}
Export-ModuleMember New-GitHubReposActionsRunsRerun

Function Remove-GitHubUserGpgkeys {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$gpg_key_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/gpg_keys/{gpg_key_id}'
}
Export-ModuleMember Remove-GitHubUserGpgkeys

Function Remove-GitHubApplicationsGrant {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$client_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'applications/{client_id}/grant'
}
Export-ModuleMember Remove-GitHubApplicationsGrant

Function New-GitHubReposIssuesCommentsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments/{comment_id}/reactions'
}
Export-ModuleMember New-GitHubReposIssuesCommentsReactions

Function Remove-GitHubReposReleasesReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$release_id,
        [Parameter(Mandatory,Position=3)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubReposReleasesReactions

Function Set-GitHubGistsStar {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/star'
}
Export-ModuleMember Set-GitHubGistsStar

Function Get-GitHubGistsForks {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/forks'
}
Export-ModuleMember Get-GitHubGistsForks

Function Get-GitHubReposActionsCacheUsage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/cache/usage'
}
Export-ModuleMember Get-GitHubReposActionsCacheUsage

Function Set-GitHubReposVulnerabilityalerts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/vulnerability-alerts'
}
Export-ModuleMember Set-GitHubReposVulnerabilityalerts

Function Get-GitHubReposTrafficPopularPaths {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/traffic/popular/paths'
}
Export-ModuleMember Get-GitHubReposTrafficPopularPaths

Function Get-GitHubReposBranchesProtectionEnforceadmins {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionEnforceadmins

Function Set-GitHubReposIssuesLock {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/lock'
}
Export-ModuleMember Set-GitHubReposIssuesLock

Function Remove-GitHubTeamsDiscussionsComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number,
        [Parameter(Mandatory,Position=2)][Int]$comment_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}'
}
Export-ModuleMember Remove-GitHubTeamsDiscussionsComments

Function New-GitHubOrgsActionsVariables {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables'
}
Export-ModuleMember New-GitHubOrgsActionsVariables

Function New-GitHubReposActionsRunnersGeneratejitconfig {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/generate-jitconfig'
}
Export-ModuleMember New-GitHubReposActionsRunnersGeneratejitconfig

Function Remove-GitHubOrgsInteractionlimits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/interaction-limits'
}
Export-ModuleMember Remove-GitHubOrgsInteractionlimits

Function New-GitHubReposReleasesReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$release_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}/reactions'
}
Export-ModuleMember New-GitHubReposReleasesReactions

Function Update-GitHubReposMilestones {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$milestone_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/milestones/{milestone_number}'
}
Export-ModuleMember Update-GitHubReposMilestones

Function Get-GitHubOrgsActionsPermissionsWorkflow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/workflow'
}
Export-ModuleMember Get-GitHubOrgsActionsPermissionsWorkflow

Function Get-GitHubUsersReceivedevents {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/received_events'
}
Export-ModuleMember Get-GitHubUsersReceivedevents

Function Get-GitHubUserPackages {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1,ParameterSetName='package_typepackage_name')][String]$package_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$visibility,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/packages' } 
        'package_typepackage_name' { Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}' } 
    }
}
Export-ModuleMember Get-GitHubUserPackages

Function Get-GitHubOrgsInteractionlimits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/interaction-limits'
}
Export-ModuleMember Get-GitHubOrgsInteractionlimits

Function Get-GitHubOrgsTeams {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='team_slug')][String]$team_slug,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams' } 
        'team_slug' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsTeams

Function Set-GitHubProjectsCollaborators {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$project_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}/collaborators/{username}'
}
Export-ModuleMember Set-GitHubProjectsCollaborators

Function Get-GitHubUsersPackagesVersions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2,ParameterSetName='package_version_id')][Int]$package_version_id,
        [Parameter(Mandatory,Position=3)][String]$username
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'package_version_id' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}/versions' } 
    }
}
Export-ModuleMember Get-GitHubUsersPackagesVersions

Function Set-GitHubUserCodespacesSecretsRepositories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$secret_name,
        [Parameter(Mandatory,Position=1,ParameterSetName='repository_id')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}/repositories' } 
        'repository_id' { Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}/repositories/{repository_id}' } 
    }
}
Export-ModuleMember Set-GitHubUserCodespacesSecretsRepositories

Function New-GitHubReposHooksDeliveriesAttempts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id,
        [Parameter(Mandatory,Position=3)][Int]$delivery_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}/attempts'
}
Export-ModuleMember New-GitHubReposHooksDeliveriesAttempts

Function Update-GitHubGists {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}'
}
Export-ModuleMember Update-GitHubGists

Function Get-GitHubReposActionsOrganizationsecrets {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/organization-secrets'
}
Export-ModuleMember Get-GitHubReposActionsOrganizationsecrets

Function Set-GitHubOrgsOrganizationrolesTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$role_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/teams/{team_slug}/{role_id}'
}
Export-ModuleMember Set-GitHubOrgsOrganizationrolesTeams

Function New-GitHubOrgsCopilotBillingSelectedusers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/billing/selected_users'
}
Export-ModuleMember New-GitHubOrgsCopilotBillingSelectedusers

Function New-GitHubOrgsRulesets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets'
}
Export-ModuleMember New-GitHubOrgsRulesets

Function Update-GitHubOrgsHooks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}'
}
Export-ModuleMember Update-GitHubOrgsHooks

Function New-GitHubReposLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/labels'
}
Export-ModuleMember New-GitHubReposLabels

Function Get-GitHubMarketplacelistingAccounts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$account_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'marketplace_listing/accounts/{account_id}'
}
Export-ModuleMember Get-GitHubMarketplacelistingAccounts

Function Get-GitHubReposIssuesEvents {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='eventsevent_id')][Int]$event_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='issue_numberevents')][Int]$issue_number,
        [Parameter(ParameterSetName='issue_numberevents')][Int]$page,
        [Parameter(ParameterSetName='issue_numberevents')][Int]$per_page,
        [Parameter(ParameterSetName='issue_numberevents')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issue_numberevents' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/events' } 
        'eventsevent_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/events/{event_id}' } 
        'events' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/events' } 
    }
}
Export-ModuleMember Get-GitHubReposIssuesEvents

Function Remove-GitHubReposPullsComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments/{comment_id}'
}
Export-ModuleMember Remove-GitHubReposPullsComments

Function Get-GitHubOrgsInstallations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/installations'
}
Export-ModuleMember Get-GitHubOrgsInstallations

Function Get-GitHubReposPullsReviews {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3,ParameterSetName='review_id')][Int]$review_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews' } 
        'review_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposPullsReviews

Function New-GitHubReposActionsRunsApprove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/approve'
}
Export-ModuleMember New-GitHubReposActionsRunsApprove

Function Update-GitHubReposReleasesAssets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$asset_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/assets/{asset_id}'
}
Export-ModuleMember Update-GitHubReposReleasesAssets

Function Get-GitHubReposStatsCommitactivity {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/stats/commit_activity'
}
Export-ModuleMember Get-GitHubReposStatsCommitactivity

Function Get-GitHubProjectsCollaborators {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$project_id,
        [String]$affiliation
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}/collaborators'
}
Export-ModuleMember Get-GitHubProjectsCollaborators

Function Remove-GitHubUserSshsigningkeys {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$ssh_signing_key_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/ssh_signing_keys/{ssh_signing_key_id}'
}
Export-ModuleMember Remove-GitHubUserSshsigningkeys

Function Set-GitHubOrgsDependabotSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubOrgsDependabotSecrets

Function Get-GitHubReposRulesetsRulesuites {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='rule_suite_id')][Int]$rule_suite_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$actor_name,
        [Parameter(ParameterSetName='Search')][String]$ref,
        [Parameter(ParameterSetName='Search')][String]$rule_suite_result,
        [Parameter(ParameterSetName='Search')][String]$time_period,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets/rule-suites' } 
        'rule_suite_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets/rule-suites/{rule_suite_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposRulesetsRulesuites

Function Set-GitHubReposPrivatevulnerabilityreporting {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/private-vulnerability-reporting'
}
Export-ModuleMember Set-GitHubReposPrivatevulnerabilityreporting

Function Get-GitHubReposActionsJobs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$job_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/jobs/{job_id}'
}
Export-ModuleMember Get-GitHubReposActionsJobs

Function Get-GitHubReposTarball {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/tarball/{ref}'
}
Export-ModuleMember Get-GitHubReposTarball

Function Remove-GitHubTeamsMemberships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/memberships/{username}'
}
Export-ModuleMember Remove-GitHubTeamsMemberships

Function Get-GitHubReposCodespacesSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/secrets' } 
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/secrets/{secret_name}' } 
    }
}
Export-ModuleMember Get-GitHubReposCodespacesSecrets

Function Find-GitHubSearchIssues {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$q,
        [String]$order,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/issues'
}
Export-ModuleMember Find-GitHubSearchIssues

Function Remove-GitHubReposIssuesLock {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/lock'
}
Export-ModuleMember Remove-GitHubReposIssuesLock

Function Start-GitHubReposActionsWorkflows {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$workflow_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches'
}
Export-ModuleMember Start-GitHubReposActionsWorkflows

Function Get-GitHubReposDependencygraphCompare {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$basehead,
        [String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependency-graph/compare/{basehead}'
}
Export-ModuleMember Get-GitHubReposDependencygraphCompare

Function Get-GitHubReposDependencygraphSbom {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependency-graph/sbom'
}
Export-ModuleMember Get-GitHubReposDependencygraphSbom

Function Remove-GitHubReposActionsRunners {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}'
}
Export-ModuleMember Remove-GitHubReposActionsRunners

Function Remove-GitHubReposIssuesLabels {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number,
        [Parameter(Mandatory,Position=3,ParameterSetName='name')][String]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/labels/{name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/labels' } 
    }
}
Export-ModuleMember Remove-GitHubReposIssuesLabels

Function Set-GitHubReposPullsReviews {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3)][Int]$review_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}'
}
Export-ModuleMember Set-GitHubReposPullsReviews

Function Get-GitHubIssues {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [String]$direction,
        [String]$filter,
        [String]$labels,
        [String]$since,
        [String]$sort,
        [String]$state,
        [Switch]$collab,
        [Switch]$orgs,
        [Switch]$owned,
        [Switch]$pulls
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'issues'
}
Export-ModuleMember Get-GitHubIssues

Function Set-GitHubUserStarred {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/starred/{owner}/{repo}'
}
Export-ModuleMember Set-GitHubUserStarred

Function Remove-GitHubNotificationsThreads {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$thread_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications/threads/{thread_id}'
}
Export-ModuleMember Remove-GitHubNotificationsThreads

Function New-GitHubReposActionsRunsRerunfailedjobs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/rerun-failed-jobs'
}
Export-ModuleMember New-GitHubReposActionsRunsRerunfailedjobs

Function Update-GitHubReposPropertiesValues {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/properties/values'
}
Export-ModuleMember Update-GitHubReposPropertiesValues

Function Get-GitHubReposCommitsComments {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$commit_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{commit_sha}/comments'
}
Export-ModuleMember Get-GitHubReposCommitsComments

Function Get-GitHubOrgsDockerConflicts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/docker/conflicts'
}
Export-ModuleMember Get-GitHubOrgsDockerConflicts

Function Get-GitHubOrgsTeamsInvitations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/invitations'
}
Export-ModuleMember Get-GitHubOrgsTeamsInvitations

Function Remove-GitHubProjectsCollaborators {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$project_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}/collaborators/{username}'
}
Export-ModuleMember Remove-GitHubProjectsCollaborators

Function Get-GitHubUserCodespacesSecretsPublickey {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/public-key'
}
Export-ModuleMember Get-GitHubUserCodespacesSecretsPublickey

Function New-GitHubOrgsPackagesRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$org,
        [String]$token
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}/restore'
}
Export-ModuleMember New-GitHubOrgsPackagesRestore

Function New-GitHubUsersPackagesVersionsRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$username,
        [Parameter(Mandatory,Position=3)][Int]$package_version_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore'
}
Export-ModuleMember New-GitHubUsersPackagesVersionsRestore

Function Get-GitHubMeta {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'meta'
}
Export-ModuleMember Get-GitHubMeta

Function Get-GitHubReposActionsRunsApprovals {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/approvals'
}
Export-ModuleMember Get-GitHubReposActionsRunsApprovals

Function Get-GitHubAppHookConfig {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/hook/config'
}
Export-ModuleMember Get-GitHubAppHookConfig

Function Get-GitHubReposForks {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/forks'
}
Export-ModuleMember Get-GitHubReposForks

Function Get-GitHubReposCommitsStatus {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{ref}/status'
}
Export-ModuleMember Get-GitHubReposCommitsStatus

Function New-GitHubReposIssuesAssignees {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/assignees'
}
Export-ModuleMember New-GitHubReposIssuesAssignees

Function Remove-GitHubOrgsPackages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}'
}
Export-ModuleMember Remove-GitHubOrgsPackages

Function Update-GitHubReposBranchesProtectionRequiredstatuschecks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks'
}
Export-ModuleMember Update-GitHubReposBranchesProtectionRequiredstatuschecks

Function Remove-GitHubOrgsActionsPermissionsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubOrgsActionsPermissionsRepositories

Function Remove-GitHubOrgsCopilotBillingSelectedteams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/billing/selected_teams'
}
Export-ModuleMember Remove-GitHubOrgsCopilotBillingSelectedteams

Function Get-GitHubReposPages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages'
}
Export-ModuleMember Get-GitHubReposPages

Function New-GitHubReposSecurityadvisories {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories'
}
Export-ModuleMember New-GitHubReposSecurityadvisories

Function Disable-GitHubReposActionsWorkflows {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$workflow_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows/{workflow_id}/disable'
}
Export-ModuleMember Disable-GitHubReposActionsWorkflows

Function Set-GitHubReposPages {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages'
}
Export-ModuleMember Set-GitHubReposPages

Function Get-GitHubOrgs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}'
}
Export-ModuleMember Get-GitHubOrgs

Function Get-GitHubUsers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Int]$since
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'users' } 
    }
}
Export-ModuleMember Get-GitHubUsers

Function Set-GitHubReposBranchesProtectionRestrictionsTeams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
}
Export-ModuleMember Set-GitHubReposBranchesProtectionRestrictionsTeams

Function New-GitHubOrgsHooksDeliveriesAttempts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id,
        [Parameter(Mandatory,Position=2)][Int]$delivery_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}/attempts'
}
Export-ModuleMember New-GitHubOrgsHooksDeliveriesAttempts

Function Get-GitHubReposIssuesComments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='commentscomment_id')][Int]$comment_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='issue_numbercomments')][Int]$issue_number,
        [Parameter(ParameterSetName='comments')][String]$direction,
        [Parameter(ParameterSetName='comments')][String]$sort,
        [Parameter(ParameterSetName='issue_numbercomments')][Int]$page,
        [Parameter(ParameterSetName='issue_numbercomments')][Int]$per_page,
        [Parameter(ParameterSetName='issue_numbercomments')][String]$since,
        [Parameter(ParameterSetName='issue_numbercomments')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'issue_numbercomments' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/comments' } 
        'comments' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments' } 
        'commentscomment_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments/{comment_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposIssuesComments

Function Remove-GitHubReposActionsRunnersLabels {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$runner_id,
        [Parameter(Mandatory,Position=3,ParameterSetName='name')][String]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}/labels' } 
    }
}
Export-ModuleMember Remove-GitHubReposActionsRunnersLabels

Function Get-GitHubNotifications {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [String]$before,
        [String]$since,
        [Switch]$all,
        [Switch]$participating
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications'
}
Export-ModuleMember Get-GitHubNotifications

Function New-GitHubOrgsPackagesVersionsRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$org,
        [Parameter(Mandatory,Position=3)][Int]$package_version_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore'
}
Export-ModuleMember New-GitHubOrgsPackagesVersionsRestore

Function Update-GitHubOrgsPropertiesValues {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/values'
}
Export-ModuleMember Update-GitHubOrgsPropertiesValues

Function Get-GitHubOrgsActionsRunnersDownloads {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/downloads'
}
Export-ModuleMember Get-GitHubOrgsActionsRunnersDownloads

Function Get-GitHubUsersDockerConflicts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/docker/conflicts'
}
Export-ModuleMember Get-GitHubUsersDockerConflicts

Function Get-GitHubUserRepositoryinvitations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/repository_invitations'
}
Export-ModuleMember Get-GitHubUserRepositoryinvitations

Function Get-GitHubCodesofconduct {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='key')][String]$key
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'codes_of_conduct' } 
        'key' { Invoke-GitHub -PsBP $PsBoundParameters 'codes_of_conduct/{key}' } 
    }
}
Export-ModuleMember Get-GitHubCodesofconduct

Function Get-GitHubEnterprisesSecretscanningAlerts {
    [CmdletBinding()]
    param (
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$enterprise,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$resolution,
        [String]$secret_type,
        [String]$sort,
        [String]$state,
        [String]$validity
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'enterprises/{enterprise}/secret-scanning/alerts'
}
Export-ModuleMember Get-GitHubEnterprisesSecretscanningAlerts

Function Get-GitHubReposCodescanningAnalyses {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='analysis_id')][Int]$analysis_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Parameter(ParameterSetName='Search')]$ref,
        [Parameter(ParameterSetName='Search')]$sarif_id,
        [Parameter(ParameterSetName='Search')]$tool_guid,
        [Parameter(ParameterSetName='Search')]$tool_name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/analyses' } 
        'analysis_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposCodescanningAnalyses

Function Get-GitHubReposSecretscanningAlertsLocations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$alert_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}/locations'
}
Export-ModuleMember Get-GitHubReposSecretscanningAlertsLocations

Function Remove-GitHubReposSubscription {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/subscription'
}
Export-ModuleMember Remove-GitHubReposSubscription

Function Set-GitHubOrgsActionsPermissionsWorkflow {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/workflow'
}
Export-ModuleMember Set-GitHubOrgsActionsPermissionsWorkflow

Function New-GitHubReposProjects {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/projects'
}
Export-ModuleMember New-GitHubReposProjects

Function Remove-GitHubReposInteractionlimits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/interaction-limits'
}
Export-ModuleMember Remove-GitHubReposInteractionlimits

Function New-GitHubReposGenerate {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$template_owner,
        [Parameter(Mandatory,Position=1)][String]$template_repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{template_owner}/{template_repo}/generate'
}
Export-ModuleMember New-GitHubReposGenerate

Function Get-GitHubReposBranchesProtectionRestrictionsUsers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRestrictionsUsers

Function Find-GitHubSearchLabels {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$repository_id,
        [Parameter(Mandatory,Position=1)][String]$q,
        [String]$order,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/labels'
}
Export-ModuleMember Find-GitHubSearchLabels

Function Set-GitHubOrgsInteractionlimits {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/interaction-limits'
}
Export-ModuleMember Set-GitHubOrgsInteractionlimits

Function Set-GitHubOrgsRulesets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$ruleset_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets/{ruleset_id}'
}
Export-ModuleMember Set-GitHubOrgsRulesets

Function Get-GitHubOrgsRulesetsRulesuites {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='rule_suite_id')][Int]$rule_suite_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Int]$repository_name,
        [Parameter(ParameterSetName='Search')][String]$actor_name,
        [Parameter(ParameterSetName='Search')][String]$rule_suite_result,
        [Parameter(ParameterSetName='Search')][String]$time_period,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets/rule-suites' } 
        'rule_suite_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets/rule-suites/{rule_suite_id}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsRulesetsRulesuites

Function Get-GitHubNetworksEvents {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'networks/{owner}/{repo}/events'
}
Export-ModuleMember Get-GitHubNetworksEvents

Function Remove-GitHubReposCodespacesSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubReposCodespacesSecrets

Function Remove-GitHubReposActionsSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubReposActionsSecrets

Function Get-GitHubUsersReceivedeventsPublic {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/received_events/public'
}
Export-ModuleMember Get-GitHubUsersReceivedeventsPublic

Function Update-GitHubOrgsActionsVariables {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}'
}
Export-ModuleMember Update-GitHubOrgsActionsVariables

Function Get-GitHubReposSubscribers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/subscribers'
}
Export-ModuleMember Get-GitHubReposSubscribers

Function Set-GitHubReposActionsPermissionsWorkflow {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions/workflow'
}
Export-ModuleMember Set-GitHubReposActionsPermissionsWorkflow

Function Remove-GitHubOrgsSecuritymanagersTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/security-managers/teams/{team_slug}'
}
Export-ModuleMember Remove-GitHubOrgsSecuritymanagersTeams

Function Get-GitHubReposCodeownersErrors {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codeowners/errors'
}
Export-ModuleMember Get-GitHubReposCodeownersErrors

Function Remove-GitHubOrgsTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}'
}
Export-ModuleMember Remove-GitHubOrgsTeams

Function Remove-GitHubReposBranchesProtectionRestrictionsApps {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRestrictionsApps

Function Remove-GitHubOrgsMemberships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/memberships/{username}'
}
Export-ModuleMember Remove-GitHubOrgsMemberships

Function Get-GitHubReposRulesBranches {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rules/branches/{branch}'
}
Export-ModuleMember Get-GitHubReposRulesBranches

Function Get-GitHubReposBranchesProtection {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection'
}
Export-ModuleMember Get-GitHubReposBranchesProtection

Function Set-GitHubTeamsRepos {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$owner,
        [Parameter(Mandatory,Position=2)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/repos/{owner}/{repo}'
}
Export-ModuleMember Set-GitHubTeamsRepos

Function New-GitHubReposTransfer {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/transfer'
}
Export-ModuleMember New-GitHubReposTransfer

Function Remove-GitHubOrgsActionsRunners {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}'
}
Export-ModuleMember Remove-GitHubOrgsActionsRunners

Function Remove-GitHubOrgsActionsSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubOrgsActionsSecrets

Function Get-GitHubOrgsDependabotSecretsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}/repositories'
}
Export-ModuleMember Get-GitHubOrgsDependabotSecretsRepositories

Function Get-GitHubReposTagsProtection {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/tags/protection'
}
Export-ModuleMember Get-GitHubReposTagsProtection

Function New-GitHubReposActionsRunsForcecancel {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/force-cancel'
}
Export-ModuleMember New-GitHubReposActionsRunsForcecancel

Function Remove-GitHubReposCodescanningAnalyses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$analysis_id,
        [String]$confirm_delete
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}'
}
Export-ModuleMember Remove-GitHubReposCodescanningAnalyses

Function Remove-GitHubOrgsDependabotSecretsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name,
        [Parameter(Mandatory,Position=2)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubOrgsDependabotSecretsRepositories

Function Get-GitHubReposContributors {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$anon
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/contributors'
}
Export-ModuleMember Get-GitHubReposContributors

Function Get-GitHubReposDependabotSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/secrets/public-key'
}
Export-ModuleMember Get-GitHubReposDependabotSecretsPublickey

Function New-GitHubReposActionsRunnersRegistrationtoken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/registration-token'
}
Export-ModuleMember New-GitHubReposActionsRunnersRegistrationtoken

Function Get-GitHubReposImport {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import'
}
Export-ModuleMember Get-GitHubReposImport

Function Remove-GitHubOrgsTeamsMemberships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/memberships/{username}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsMemberships

Function Get-GitHubOrgsMembersCopilot {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members/{username}/copilot'
}
Export-ModuleMember Get-GitHubOrgsMembersCopilot

Function New-GitHubReposEnvironmentsDeploymentprotectionrules {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$environment_name,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$owner
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules'
}
Export-ModuleMember New-GitHubReposEnvironmentsDeploymentprotectionrules

Function New-GitHubOrgsOrganizationroles {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles'
}
Export-ModuleMember New-GitHubOrgsOrganizationroles

Function Get-GitHubUserTeams {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/teams'
}
Export-ModuleMember Get-GitHubUserTeams

Function Get-GitHubUserEmails {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/emails'
}
Export-ModuleMember Get-GitHubUserEmails

Function New-GitHubOrgsActionsRunnersRegistrationtoken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/registration-token'
}
Export-ModuleMember New-GitHubOrgsActionsRunnersRegistrationtoken

Function Get-GitHubReposBranchesProtectionRestrictionsApps {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRestrictionsApps

Function New-GitHubOrgsActionsRunnersLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}/labels'
}
Export-ModuleMember New-GitHubOrgsActionsRunnersLabels

Function Get-GitHubUserSshsigningkeys {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='ssh_signing_key_id')][Int]$ssh_signing_key_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ssh_signing_key_id' { Invoke-GitHub -PsBP $PsBoundParameters 'user/ssh_signing_keys/{ssh_signing_key_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/ssh_signing_keys' } 
    }
}
Export-ModuleMember Get-GitHubUserSshsigningkeys

Function Get-GitHubReposActionsRunnersLabels {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
}
Export-ModuleMember Get-GitHubReposActionsRunnersLabels

Function Set-GitHubTeamsMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/members/{username}'
}
Export-ModuleMember Set-GitHubTeamsMembers

Function Set-GitHubOrgsPublicmembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/public_members/{username}'
}
Export-ModuleMember Set-GitHubOrgsPublicmembers

Function Set-GitHubReposEnvironmentsDeploymentbranchpolicies {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3)][Int]$branch_policy_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}'
}
Export-ModuleMember Set-GitHubReposEnvironmentsDeploymentbranchpolicies

Function Get-GitHubReposVulnerabilityalerts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/vulnerability-alerts'
}
Export-ModuleMember Get-GitHubReposVulnerabilityalerts

Function Update-GitHubProjectsColumns {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$column_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/{column_id}'
}
Export-ModuleMember Update-GitHubProjectsColumns

Function Get-GitHubReposCodescanningSarifs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$sarif_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/sarifs/{sarif_id}'
}
Export-ModuleMember Get-GitHubReposCodescanningSarifs

Function Get-GitHubOrgsTeamsDiscussionsComments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3,ParameterSetName='comment_number')][Int]$comment_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments' } 
        'comment_number' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsTeamsDiscussionsComments

Function Get-GitHubReposIssuesReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/reactions'
}
Export-ModuleMember Get-GitHubReposIssuesReactions

Function New-GitHubReposActionsRunnersRemovetoken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/remove-token'
}
Export-ModuleMember New-GitHubReposActionsRunnersRemovetoken

Function Get-GitHubProjectsCollaboratorsPermission {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$project_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}/collaborators/{username}/permission'
}
Export-ModuleMember Get-GitHubProjectsCollaboratorsPermission

Function New-GitHubReposPullsReviews {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews'
}
Export-ModuleMember New-GitHubReposPullsReviews

Function New-GitHubProjectsColumnsCards {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$column_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/{column_id}/cards'
}
Export-ModuleMember New-GitHubProjectsColumnsCards

Function Get-GitHubProjectsColumns {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='columnscolumn_id')][Int]$column_id,
        [Parameter(Mandatory,Position=0,ParameterSetName='project_idcolumns')][Int]$project_id,
        [Parameter(ParameterSetName='project_idcolumns')][Int]$page,
        [Parameter(ParameterSetName='project_idcolumns')][Int]$per_page,
        [Parameter(ParameterSetName='project_idcolumns')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'columnscolumn_id' { Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/{column_id}' } 
        'project_idcolumns' { Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}/columns' } 
    }
}
Export-ModuleMember Get-GitHubProjectsColumns

Function Get-GitHubProjectsColumnsCards {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='cardscard_id')][Int]$card_id,
        [Parameter(Mandatory,Position=0,ParameterSetName='column_idcards')][Int]$column_id,
        [Parameter(ParameterSetName='column_idcards')][Int]$page,
        [Parameter(ParameterSetName='column_idcards')][Int]$per_page,
        [Parameter(ParameterSetName='column_idcards')][String]$archived_state,
        [Parameter(ParameterSetName='column_idcards')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'cardscard_id' { Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/cards/{card_id}' } 
        'column_idcards' { Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/{column_id}/cards' } 
    }
}
Export-ModuleMember Get-GitHubProjectsColumnsCards

Function Remove-GitHubOrgsMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members/{username}'
}
Export-ModuleMember Remove-GitHubOrgsMembers

Function Get-GitHubUsersEventsPublic {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/events/public'
}
Export-ModuleMember Get-GitHubUsersEventsPublic

Function Get-GitHubTeamsMembers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$role,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/members/{username}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/members' } 
    }
}
Export-ModuleMember Get-GitHubTeamsMembers

Function Remove-GitHubOrgsActionsSecretsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name,
        [Parameter(Mandatory,Position=2)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubOrgsActionsSecretsRepositories

Function Get-GitHubOrgsTeamsDiscussionsCommentsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3)][Int]$comment_number,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions'
}
Export-ModuleMember Get-GitHubOrgsTeamsDiscussionsCommentsReactions

Function Get-GitHubOrgsActionsSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets' } 
    }
}
Export-ModuleMember Get-GitHubOrgsActionsSecrets

Function Update-GitHubUserEmailVisibility {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/email/visibility'
}
Export-ModuleMember Update-GitHubUserEmailVisibility

Function New-GitHubReposBranchesRename {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/rename'
}
Export-ModuleMember New-GitHubReposBranchesRename

Function Get-GitHubUserPublicemails {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/public_emails'
}
Export-ModuleMember Get-GitHubUserPublicemails

Function Set-GitHubOrgsTeamsProjects {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/projects/{project_id}'
}
Export-ModuleMember Set-GitHubOrgsTeamsProjects

Function Get-GitHubUsersProjects {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/projects'
}
Export-ModuleMember Get-GitHubUsersProjects

Function Get-GitHubOrgsMigrationsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$migration_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations/{migration_id}/repositories'
}
Export-ModuleMember Get-GitHubOrgsMigrationsRepositories

Function Update-GitHubOrgsTeamsDiscussions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}'
}
Export-ModuleMember Update-GitHubOrgsTeamsDiscussions

Function Remove-GitHubReposPullsRequestedreviewers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers'
}
Export-ModuleMember Remove-GitHubReposPullsRequestedreviewers

Function Remove-GitHubInstallationToken {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'installation/token'
}
Export-ModuleMember Remove-GitHubInstallationToken

Function Get-GitHubReposReadme {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='dir')][String]$dir,
        [String]$ref
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/readme' } 
        'dir' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/readme/{dir}' } 
    }
}
Export-ModuleMember Get-GitHubReposReadme

Function Get-GitHubReposActionsCaches {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$direction,
        [String]$key,
        [String]$ref,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/caches'
}
Export-ModuleMember Get-GitHubReposActionsCaches

Function Get-GitHubOrgsActionsVariables {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='name')][String]$name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables' } 
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsActionsVariables

Function New-GitHubReposMilestones {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/milestones'
}
Export-ModuleMember New-GitHubReposMilestones

Function Get-GitHubOrgsActionsCacheUsage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/cache/usage'
}
Export-ModuleMember Get-GitHubOrgsActionsCacheUsage

Function Get-GitHubZen {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'zen'
}
Export-ModuleMember Get-GitHubZen

Function Get-GitHubReposEvents {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/events'
}
Export-ModuleMember Get-GitHubReposEvents

Function Remove-GitHubReposEnvironmentsDeploymentprotectionrules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$environment_name,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$owner,
        [Parameter(Mandatory,Position=3)][Int]$protection_rule_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}'
}
Export-ModuleMember Remove-GitHubReposEnvironmentsDeploymentprotectionrules

Function New-GitHubReposPagesBuilds {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/builds'
}
Export-ModuleMember New-GitHubReposPagesBuilds

Function Get-GitHubReposGitTags {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$tag_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/tags/{tag_sha}'
}
Export-ModuleMember Get-GitHubReposGitTags

Function Get-GitHubTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}'
}
Export-ModuleMember Get-GitHubTeams

Function New-GitHubReposGitRefs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/refs'
}
Export-ModuleMember New-GitHubReposGitRefs

Function Get-GitHubReposGitTrees {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$tree_sha,
        [String]$recursive
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/trees/{tree_sha}'
}
Export-ModuleMember Get-GitHubReposGitTrees

Function Get-GitHubOrgsPropertiesSchema {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='custom_property_name')][String]$custom_property_name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/schema' } 
        'custom_property_name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/schema/{custom_property_name}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsPropertiesSchema

Function New-GitHubOrgsActionsRunnersGeneratejitconfig {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/generate-jitconfig'
}
Export-ModuleMember New-GitHubOrgsActionsRunnersGeneratejitconfig

Function Set-GitHubOrgsActionsPermissionsSelectedactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/selected-actions'
}
Export-ModuleMember Set-GitHubOrgsActionsPermissionsSelectedactions

Function Get-GitHubProjects {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}'
}
Export-ModuleMember Get-GitHubProjects

Function Get-GitHubOrgsBlocks {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/blocks' } 
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/blocks/{username}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsBlocks

Function Remove-GitHubUsersPackages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}'
}
Export-ModuleMember Remove-GitHubUsersPackages

Function Get-GitHubRepos {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}'
}
Export-ModuleMember Get-GitHubRepos

Function Get-GitHubReposStatsContributors {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/stats/contributors'
}
Export-ModuleMember Get-GitHubReposStatsContributors

Function Remove-GitHubReposRulesets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$ruleset_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets/{ruleset_id}'
}
Export-ModuleMember Remove-GitHubReposRulesets

Function Get-GitHubOrgsTeamsDiscussionsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions'
}
Export-ModuleMember Get-GitHubOrgsTeamsDiscussionsReactions

Function Remove-GitHubProjects {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}'
}
Export-ModuleMember Remove-GitHubProjects

Function Set-GitHubOrgsActionsPermissions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions'
}
Export-ModuleMember Set-GitHubOrgsActionsPermissions

Function Set-GitHubReposTopics {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/topics'
}
Export-ModuleMember Set-GitHubReposTopics

Function Get-GitHubReposPagesDeployments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$pages_deployment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}'
}
Export-ModuleMember Get-GitHubReposPagesDeployments

Function Get-GitHubUsersEventsOrgs {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username,
        [Parameter(Mandatory,Position=1)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/events/orgs/{org}'
}
Export-ModuleMember Get-GitHubUsersEventsOrgs

Function Get-GitHubOrgsSecretscanningAlerts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$resolution,
        [String]$secret_type,
        [String]$sort,
        [String]$state,
        [String]$validity
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/secret-scanning/alerts'
}
Export-ModuleMember Get-GitHubOrgsSecretscanningAlerts

Function New-GitHubReposCodespaces {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces'
}
Export-ModuleMember New-GitHubReposCodespaces

Function Get-GitHubOrgsCodespacesSecretsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}/repositories'
}
Export-ModuleMember Get-GitHubOrgsCodespacesSecretsRepositories

Function Get-GitHubUserDockerConflicts {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/docker/conflicts'
}
Export-ModuleMember Get-GitHubUserDockerConflicts

Function Remove-GitHubReposPullsReviews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3)][Int]$review_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}'
}
Export-ModuleMember Remove-GitHubReposPullsReviews

Function Update-GitHubOrgsTeams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}'
}
Export-ModuleMember Update-GitHubOrgsTeams

Function Remove-GitHubAppInstallations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$installation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/installations/{installation_id}'
}
Export-ModuleMember Remove-GitHubAppInstallations

Function New-GitHubMarkdown {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'markdown'
}
Export-ModuleMember New-GitHubMarkdown

Function Remove-GitHubReposContents {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$path
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/contents/{path}'
}
Export-ModuleMember Remove-GitHubReposContents

Function Update-GitHubReposHooksConfig {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/config'
}
Export-ModuleMember Update-GitHubReposHooksConfig

Function Get-GitHubReposActionsPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions'
}
Export-ModuleMember Get-GitHubReposActionsPermissions

Function Update-GitHubTeams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}'
}
Export-ModuleMember Update-GitHubTeams

Function New-GitHubReposGitCommits {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/commits'
}
Export-ModuleMember New-GitHubReposGitCommits

Function Get-GitHubReposTrafficViews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$per
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/traffic/views'
}
Export-ModuleMember Get-GitHubReposTrafficViews

Function New-GitHubOrgsTeams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams'
}
Export-ModuleMember New-GitHubOrgsTeams

Function Set-GitHubOrgsPropertiesSchema {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$custom_property_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/schema/{custom_property_name}'
}
Export-ModuleMember Set-GitHubOrgsPropertiesSchema

Function Remove-GitHubApplicationsToken {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$client_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'applications/{client_id}/token'
}
Export-ModuleMember Remove-GitHubApplicationsToken

Function Update-GitHubReposIssuesComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments/{comment_id}'
}
Export-ModuleMember Update-GitHubReposIssuesComments

Function Get-GitHubReposCollaborators {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$affiliation,
        [Parameter(ParameterSetName='Search')][String]$permission,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/collaborators/{username}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/collaborators' } 
    }
}
Export-ModuleMember Get-GitHubReposCollaborators

Function Remove-GitHubUserPackagesVersions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][Int]$package_version_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}/versions/{package_version_id}'
}
Export-ModuleMember Remove-GitHubUserPackagesVersions

Function Get-GitHubAppInstallationrequests {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/installation-requests'
}
Export-ModuleMember Get-GitHubAppInstallationrequests

Function Get-GitHubReposStatsPunchcard {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/stats/punch_card'
}
Export-ModuleMember Get-GitHubReposStatsPunchcard

Function Get-GitHubOrgsSettingsBillingPackages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/settings/billing/packages'
}
Export-ModuleMember Get-GitHubOrgsSettingsBillingPackages

Function Get-GitHubOrgsMigrations {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='migration_id')][Int]$migration_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [String[]]$exclude
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations' } 
        'migration_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations/{migration_id}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsMigrations

Function Get-GitHubReposBranches {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='branch')][String]$branch,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Parameter(ParameterSetName='Search')][Switch]$protected
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'branch' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches' } 
    }
}
Export-ModuleMember Get-GitHubReposBranches

Function Remove-GitHubReposActionsCaches {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='cache_id')][Int]$cache_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='Search')][String]$key,
        [Parameter(ParameterSetName='Search')][String]$ref
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'cache_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/caches/{cache_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/caches' } 
    }
}
Export-ModuleMember Remove-GitHubReposActionsCaches

Function Update-GitHubReposEnvironmentsVariables {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$name,
        [Parameter(Mandatory,Position=3)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/variables/{name}'
}
Export-ModuleMember Update-GitHubReposEnvironmentsVariables

Function Get-GitHub {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters ''
}
Export-ModuleMember Get-GitHub

Function Set-GitHubReposCollaborators {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/collaborators/{username}'
}
Export-ModuleMember Set-GitHubReposCollaborators

Function Get-GitHubOrgsPersonalaccesstokensRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$pat_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-tokens/{pat_id}/repositories'
}
Export-ModuleMember Get-GitHubOrgsPersonalaccesstokensRepositories

Function Get-GitHubReposSecretscanningAlerts {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='alert_number')]$alert_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$after,
        [Parameter(ParameterSetName='Search')][String]$before,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$resolution,
        [Parameter(ParameterSetName='Search')][String]$secret_type,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][String]$validity,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/secret-scanning/alerts' } 
        'alert_number' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}' } 
    }
}
Export-ModuleMember Get-GitHubReposSecretscanningAlerts

Function Get-GitHubReposHooksConfig {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/config'
}
Export-ModuleMember Get-GitHubReposHooksConfig

Function Remove-GitHubUserFollowing {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/following/{username}'
}
Export-ModuleMember Remove-GitHubUserFollowing

Function Get-GitHubOrgsTeamsTeams {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/teams'
}
Export-ModuleMember Get-GitHubOrgsTeamsTeams

Function Get-GitHubReposCommitsPulls {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$commit_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{commit_sha}/pulls'
}
Export-ModuleMember Get-GitHubReposCommitsPulls

Function Remove-GitHubReposPullsCommentsReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id,
        [Parameter(Mandatory,Position=3)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubReposPullsCommentsReactions

Function Get-GitHubReposActionsPermissionsAccess {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions/access'
}
Export-ModuleMember Get-GitHubReposActionsPermissionsAccess

Function Get-GitHubMarketplacelistingStubbedPlans {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'marketplace_listing/stubbed/plans'
}
Export-ModuleMember Get-GitHubMarketplacelistingStubbedPlans

Function Get-GitHubOrgsRepos {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$direction,
        [String]$sort,
        [String]$type
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/repos'
}
Export-ModuleMember Get-GitHubOrgsRepos

Function Get-GitHubOrgsTeamsProjects {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2,ParameterSetName='project_id')][Int]$project_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/projects' } 
        'project_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/projects/{project_id}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsTeamsProjects

Function Update-GitHubReposHooks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}'
}
Export-ModuleMember Update-GitHubReposHooks

Function Find-GitHubSearchCommits {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$q,
        [String]$order,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/commits'
}
Export-ModuleMember Find-GitHubSearchCommits

Function Set-GitHubReposActionsPermissionsSelectedactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions/selected-actions'
}
Export-ModuleMember Set-GitHubReposActionsPermissionsSelectedactions

Function Get-GitHubReposActionsOidcCustomizationSub {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/oidc/customization/sub'
}
Export-ModuleMember Get-GitHubReposActionsOidcCustomizationSub

Function New-GitHubReposBranchesProtectionEnforceadmins {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins'
}
Export-ModuleMember New-GitHubReposBranchesProtectionEnforceadmins

Function Get-GitHubReposActionsSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/secrets' } 
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/secrets/{secret_name}' } 
    }
}
Export-ModuleMember Get-GitHubReposActionsSecrets

Function Set-GitHubUserInteractionlimits {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/interaction-limits'
}
Export-ModuleMember Set-GitHubUserInteractionlimits

Function New-GitHubUserKeys {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/keys'
}
Export-ModuleMember New-GitHubUserKeys

Function Get-GitHubReposIssuesCommentsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/comments/{comment_id}/reactions'
}
Export-ModuleMember Get-GitHubReposIssuesCommentsReactions

Function New-GitHubReposPagesDeployments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/deployments'
}
Export-ModuleMember New-GitHubReposPagesDeployments

Function Get-GitHubReposChecksuitesCheckruns {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_suite_id,
        [String]$check_name,
        [String]$filter,
        [String]$status
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs'
}
Export-ModuleMember Get-GitHubReposChecksuitesCheckruns

Function Remove-GitHubOrgsTeamsRepos {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][String]$owner,
        [Parameter(Mandatory,Position=3)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsRepos

Function Get-GitHubReposEnvironmentsDeploymentbranchpolicies {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3,ParameterSetName='branch_policy_id')][Int]$branch_policy_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'branch_policy_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies' } 
    }
}
Export-ModuleMember Get-GitHubReposEnvironmentsDeploymentbranchpolicies

Function New-GitHubUserGpgkeys {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/gpg_keys'
}
Export-ModuleMember New-GitHubUserGpgkeys

Function Get-GitHubOrgsEvents {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/events'
}
Export-ModuleMember Get-GitHubOrgsEvents

Function Update-GitHubReposCodescanningAlerts {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$alert_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/alerts/{alert_number}'
}
Export-ModuleMember Update-GitHubReposCodescanningAlerts

Function Set-GitHubReposPullsReviewsDismissals {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3)][Int]$review_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/dismissals'
}
Export-ModuleMember Set-GitHubReposPullsReviewsDismissals

Function Get-GitHubUsersKeys {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/keys'
}
Export-ModuleMember Get-GitHubUsersKeys

Function Remove-GitHubReposActionsRunsLogs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/logs'
}
Export-ModuleMember Remove-GitHubReposActionsRunsLogs

Function Remove-GitHubReposActionsRuns {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}'
}
Export-ModuleMember Remove-GitHubReposActionsRuns

Function Set-GitHubAppInstallationsSuspended {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$installation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/installations/{installation_id}/suspended'
}
Export-ModuleMember Set-GitHubAppInstallationsSuspended

Function Get-GitHubUsersSubscriptions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/subscriptions'
}
Export-ModuleMember Get-GitHubUsersSubscriptions

Function Get-GitHubUsersRepos {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username,
        [String]$direction,
        [String]$sort,
        [String]$type
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/repos'
}
Export-ModuleMember Get-GitHubUsersRepos

Function New-GitHubTeamsDiscussions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions'
}
Export-ModuleMember New-GitHubTeamsDiscussions

Function Update-GitHubUserCodespaces {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}'
}
Export-ModuleMember Update-GitHubUserCodespaces

Function New-GitHubReposCommentsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments/{comment_id}/reactions'
}
Export-ModuleMember New-GitHubReposCommentsReactions

Function Get-GitHubReposRulesets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='ruleset_id')][Int]$ruleset_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Switch]$includes_parents
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ruleset_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets/{ruleset_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets' } 
    }
}
Export-ModuleMember Get-GitHubReposRulesets

Function Get-GitHubOrgsSettingsBillingActions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/settings/billing/actions'
}
Export-ModuleMember Get-GitHubOrgsSettingsBillingActions

Function Set-GitHubNotificationsThreadsSubscription {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$thread_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications/threads/{thread_id}/subscription'
}
Export-ModuleMember Set-GitHubNotificationsThreadsSubscription

Function Get-GitHubUserCodespacesExports {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$codespace_name,
        [Parameter(Mandatory,Position=1)][String]$export_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}/exports/{export_id}'
}
Export-ModuleMember Get-GitHubUserCodespacesExports

Function Remove-GitHubOrgsMigrationsReposLock {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$migration_id,
        [Parameter(Mandatory,Position=2)][String]$repo_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations/{migration_id}/repos/{repo_name}/lock'
}
Export-ModuleMember Remove-GitHubOrgsMigrationsReposLock

Function Get-GitHubOrgsTeamsMemberships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/memberships/{username}'
}
Export-ModuleMember Get-GitHubOrgsTeamsMemberships

Function Set-GitHubOrgsActionsRunnersLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}/labels'
}
Export-ModuleMember Set-GitHubOrgsActionsRunnersLabels

Function Update-GitHubNotificationsThreads {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$thread_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications/threads/{thread_id}'
}
Export-ModuleMember Update-GitHubNotificationsThreads

Function Get-GitHubGitignoreTemplates {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='name')][String]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'gitignore/templates/{name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'gitignore/templates' } 
    }
}
Export-ModuleMember Get-GitHubGitignoreTemplates

Function Get-GitHubReposCheckrunsAnnotations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-runs/{check_run_id}/annotations'
}
Export-ModuleMember Get-GitHubReposCheckrunsAnnotations

Function Get-GitHubNotificationsThreads {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$thread_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications/threads/{thread_id}'
}
Export-ModuleMember Get-GitHubNotificationsThreads

Function Get-GitHubOrgsActionsVariablesRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}/repositories'
}
Export-ModuleMember Get-GitHubOrgsActionsVariablesRepositories

Function Get-GitHubReposActionsRunsJobs {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id,
        [String]$filter
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/jobs'
}
Export-ModuleMember Get-GitHubReposActionsRunsJobs

Function Remove-GitHubReposTagsProtection {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$tag_protection_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/tags/protection/{tag_protection_id}'
}
Export-ModuleMember Remove-GitHubReposTagsProtection

Function New-GitHubUserCodespacesStop {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}/stop'
}
Export-ModuleMember New-GitHubUserCodespacesStop

Function Get-GitHubClassroomsAssignments {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$classroom_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'classrooms/{classroom_id}/assignments'
}
Export-ModuleMember Get-GitHubClassroomsAssignments

Function Get-GitHubReposCommitsChecksuites {
    [CmdletBinding()]
    param (
        [Int]$app_id,
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref,
        [String]$check_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{ref}/check-suites'
}
Export-ModuleMember Get-GitHubReposCommitsChecksuites

Function New-GitHubOrgsTeamsDiscussionsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments'
}
Export-ModuleMember New-GitHubOrgsTeamsDiscussionsComments

Function Get-GitHubUsersPackages {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1,ParameterSetName='package_typepackage_name')][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$visibility,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'package_typepackage_name' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages' } 
    }
}
Export-ModuleMember Get-GitHubUsersPackages

Function Remove-GitHubTeamsMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/members/{username}'
}
Export-ModuleMember Remove-GitHubTeamsMembers

Function Remove-GitHubReposReleasesAssets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$asset_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/assets/{asset_id}'
}
Export-ModuleMember Remove-GitHubReposReleasesAssets

Function Get-GitHubUsersSocialaccounts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/social_accounts'
}
Export-ModuleMember Get-GitHubUsersSocialaccounts

Function Get-GitHubUsersGpgkeys {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/gpg_keys'
}
Export-ModuleMember Get-GitHubUsersGpgkeys

Function Get-GitHubReposActionsVariables {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='name')][String]$name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/variables' } 
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/variables/{name}' } 
    }
}
Export-ModuleMember Get-GitHubReposActionsVariables

Function New-GitHubReposTagsProtection {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/tags/protection'
}
Export-ModuleMember New-GitHubReposTagsProtection

Function Get-GitHubReposStatsCodefrequency {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/stats/code_frequency'
}
Export-ModuleMember Get-GitHubReposStatsCodefrequency

Function Get-GitHubReposCodescanningCodeqlVariantanalysesRepos {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$codeql_variant_analysis_id,
        [Parameter(Mandatory,Position=3)][String]$repo_owner,
        [Parameter(Mandatory,Position=4)][String]$repo_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}/repos/{repo_owner}/{repo_name}'
}
Export-ModuleMember Get-GitHubReposCodescanningCodeqlVariantanalysesRepos

Function Get-GitHubFeeds {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'feeds'
}
Export-ModuleMember Get-GitHubFeeds

Function Get-GitHubReposPagesBuilds {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='build_id')][Int]$build_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/builds' } 
        'build_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/builds/{build_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposPagesBuilds

Function Get-GitHubReposEnvironmentsDeploymentprotectionrules {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3,ParameterSetName='protection_rule_id')][Int]$protection_rule_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'protection_rule_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules' } 
    }
}
Export-ModuleMember Get-GitHubReposEnvironmentsDeploymentprotectionrules

Function Get-GitHubGists {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='gist_idsha')][String]$gist_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='gist_idsha')][String]$sha,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$since,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'gist_idsha' { Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/{sha}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'gists' } 
        'gist_id' { Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}' } 
    }
}
Export-ModuleMember Get-GitHubGists

Function Set-GitHubUserInstallationsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$installation_id,
        [Parameter(Mandatory,Position=1)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/installations/{installation_id}/repositories/{repository_id}'
}
Export-ModuleMember Set-GitHubUserInstallationsRepositories

Function Get-GitHubVersions {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'versions'
}
Export-ModuleMember Get-GitHubVersions

Function Get-GitHubOrgsMigrationsArchive {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$migration_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/migrations/{migration_id}/archive'
}
Export-ModuleMember Get-GitHubOrgsMigrationsArchive

Function New-GitHubUserCodespacesStart {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}/start'
}
Export-ModuleMember New-GitHubUserCodespacesStart

Function New-GitHubReposActionsJobsRerun {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$job_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/jobs/{job_id}/rerun'
}
Export-ModuleMember New-GitHubReposActionsJobsRerun

Function Get-GitHubReposCodescanningAlerts {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='alert_number')]$alert_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Parameter(ParameterSetName='Search')]$ref,
        [Parameter(ParameterSetName='Search')]$severity,
        [Parameter(ParameterSetName='Search')]$state,
        [Parameter(ParameterSetName='Search')]$tool_guid,
        [Parameter(ParameterSetName='Search')]$tool_name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'alert_number' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/alerts/{alert_number}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/alerts' } 
    }
}
Export-ModuleMember Get-GitHubReposCodescanningAlerts

Function New-GitHubReposMerges {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/merges'
}
Export-ModuleMember New-GitHubReposMerges

Function Remove-GitHubOrgsActionsRunnersLabels {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$runner_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='name')][String]$name
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}/labels' } 
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}/labels/{name}' } 
    }
}
Export-ModuleMember Remove-GitHubOrgsActionsRunnersLabels

Function Update-GitHubReposSecurityadvisories {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ghsa_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories/{ghsa_id}'
}
Export-ModuleMember Update-GitHubReposSecurityadvisories

Function New-GitHubUserSshsigningkeys {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/ssh_signing_keys'
}
Export-ModuleMember New-GitHubUserSshsigningkeys

Function Remove-GitHubReposComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments/{comment_id}'
}
Export-ModuleMember Remove-GitHubReposComments

Function New-GitHubReposEnvironmentsVariables {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/variables'
}
Export-ModuleMember New-GitHubReposEnvironmentsVariables

Function Get-GitHubReposCommunityProfile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/community/profile'
}
Export-ModuleMember Get-GitHubReposCommunityProfile

Function Get-GitHubReposActionsArtifacts {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='artifact_id')][Int]$artifact_id,
        [Parameter(Mandatory,Position=3,ParameterSetName='artifact_idarchive_format')][String]$archive_format,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$name,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'artifact_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/artifacts/{artifact_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/artifacts' } 
        'artifact_idarchive_format' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/artifacts/{artifact_id}/{archive_format}' } 
    }
}
Export-ModuleMember Get-GitHubReposActionsArtifacts

Function Get-GitHubAssignmentsAcceptedassignments {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$assignment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'assignments/{assignment_id}/accepted_assignments'
}
Export-ModuleMember Get-GitHubAssignmentsAcceptedassignments

Function Get-GitHubUserInteractionlimits {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/interaction-limits'
}
Export-ModuleMember Get-GitHubUserInteractionlimits

Function Get-GitHubReposActionsPermissionsSelectedactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions/selected-actions'
}
Export-ModuleMember Get-GitHubReposActionsPermissionsSelectedactions

Function New-GitHubProjectsColumns {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}/columns'
}
Export-ModuleMember New-GitHubProjectsColumns

Function Update-GitHubReposPulls {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}'
}
Export-ModuleMember Update-GitHubReposPulls

Function New-GitHubReposKeys {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/keys'
}
Export-ModuleMember New-GitHubReposKeys

Function Remove-GitHubUserPackages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}'
}
Export-ModuleMember Remove-GitHubUserPackages

Function Get-GitHubMarketplacelistingStubbedPlansAccounts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$plan_id,
        [String]$direction,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'marketplace_listing/stubbed/plans/{plan_id}/accounts'
}
Export-ModuleMember Get-GitHubMarketplacelistingStubbedPlansAccounts

Function Get-GitHubReposHooks {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='hook_id')][Int]$hook_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks' } 
        'hook_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposHooks

Function Remove-GitHubTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}'
}
Export-ModuleMember Remove-GitHubTeams

Function Get-GitHubReposPagesHealth {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/health'
}
Export-ModuleMember Get-GitHubReposPagesHealth

Function Remove-GitHubOrgsTeamsDiscussionsReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsDiscussionsReactions

Function Get-GitHubOrgsActionsPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions'
}
Export-ModuleMember Get-GitHubOrgsActionsPermissions

Function New-GitHubReposAutolinks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/autolinks'
}
Export-ModuleMember New-GitHubReposAutolinks

Function Update-GitHubReposInvitations {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$invitation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/invitations/{invitation_id}'
}
Export-ModuleMember Update-GitHubReposInvitations

Function Get-GitHubReposActionsJobsLogs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$job_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/jobs/{job_id}/logs'
}
Export-ModuleMember Get-GitHubReposActionsJobsLogs

Function Get-GitHubOrgsFailedinvitations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/failed_invitations'
}
Export-ModuleMember Get-GitHubOrgsFailedinvitations

Function Get-GitHubReposTeams {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/teams'
}
Export-ModuleMember Get-GitHubReposTeams

Function New-GitHubReposBranchesProtectionRestrictionsTeams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
}
Export-ModuleMember New-GitHubReposBranchesProtectionRestrictionsTeams

Function New-GitHubReposRulesets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/rulesets'
}
Export-ModuleMember New-GitHubReposRulesets

Function Get-GitHubUserFollowers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/followers'
}
Export-ModuleMember Get-GitHubUserFollowers

Function Get-GitHubAppInstallations {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='installation_id')][Int]$installation_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$outdated,
        [Parameter(ParameterSetName='Search')][String]$since,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'app/installations' } 
        'installation_id' { Invoke-GitHub -PsBP $PsBoundParameters 'app/installations/{installation_id}' } 
    }
}
Export-ModuleMember Get-GitHubAppInstallations

Function Set-GitHubOrgsOrganizationrolesUsers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username,
        [Parameter(Mandatory,Position=2)][Int]$role_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/users/{username}/{role_id}'
}
Export-ModuleMember Set-GitHubOrgsOrganizationrolesUsers

Function Set-GitHubReposBranchesProtectionRequiredstatuschecksContexts {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
}
Export-ModuleMember Set-GitHubReposBranchesProtectionRequiredstatuschecksContexts

Function Update-GitHubReposBranchesProtectionRequiredpullrequestreviews {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews'
}
Export-ModuleMember Update-GitHubReposBranchesProtectionRequiredpullrequestreviews

Function Get-GitHubOrgsOrganizationroles {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='role_id')][Int]$role_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles' } 
        'role_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/{role_id}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsOrganizationroles

Function Set-GitHubUserBlocks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/blocks/{username}'
}
Export-ModuleMember Set-GitHubUserBlocks

Function Get-GitHubOrgsTeamsMembers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [String]$role
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/members'
}
Export-ModuleMember Get-GitHubOrgsTeamsMembers

Function Remove-GitHubReposKeys {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$key_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/keys/{key_id}'
}
Export-ModuleMember Remove-GitHubReposKeys

Function New-GitHubReposReleasesGeneratenotes {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/generate-notes'
}
Export-ModuleMember New-GitHubReposReleasesGeneratenotes

Function Get-GitHubOrgsCodespacesSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/public-key'
}
Export-ModuleMember Get-GitHubOrgsCodespacesSecretsPublickey

Function New-GitHubReposChecksuites {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-suites'
}
Export-ModuleMember New-GitHubReposChecksuites

Function Set-GitHubOrgsMemberships {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/memberships/{username}'
}
Export-ModuleMember Set-GitHubOrgsMemberships

Function Update-GitHubProjectsColumnsCards {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$card_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/cards/{card_id}'
}
Export-ModuleMember Update-GitHubProjectsColumnsCards

Function Get-GitHubReposTopics {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/topics'
}
Export-ModuleMember Get-GitHubReposTopics

Function Get-GitHubReposCommits {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter()][Switch]$GetAll,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='ref')][String]$ref,
        [Parameter(ParameterSetName='Search')][String]$author,
        [Parameter(ParameterSetName='Search')][String]$committer,
        [Parameter(ParameterSetName='Search')][String]$path,
        [Parameter(ParameterSetName='Search')][String]$sha,
        [Parameter(ParameterSetName='Search')][String]$since,
        [Parameter(ParameterSetName='Search')][String]$until
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ref' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{ref}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits' } 
    }
}
Export-ModuleMember Get-GitHubReposCommits

Function Update-GitHubTeamsDiscussionsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number,
        [Parameter(Mandatory,Position=2)][Int]$comment_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}'
}
Export-ModuleMember Update-GitHubTeamsDiscussionsComments

Function Remove-GitHubReposReleases {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$release_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}'
}
Export-ModuleMember Remove-GitHubReposReleases

Function Set-GitHubReposIssuesLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/labels'
}
Export-ModuleMember Set-GitHubReposIssuesLabels

Function New-GitHubReposCodescanningSarifs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/sarifs'
}
Export-ModuleMember New-GitHubReposCodescanningSarifs

Function Remove-GitHubUsersPackagesVersions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$username,
        [Parameter(Mandatory,Position=3)][Int]$package_version_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}'
}
Export-ModuleMember Remove-GitHubUsersPackagesVersions

Function New-GitHubReposPullsReviewsEvents {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3)][Int]$review_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/events'
}
Export-ModuleMember New-GitHubReposPullsReviewsEvents

Function New-GitHubReposPages {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages'
}
Export-ModuleMember New-GitHubReposPages

Function Remove-GitHubReposBranchesProtectionRestrictionsUsers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRestrictionsUsers

Function Get-GitHubGistsStarred {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [String]$since
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/starred'
}
Export-ModuleMember Get-GitHubGistsStarred

Function Get-GitHubReposActionsRunsAttempts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id,
        [Parameter(Mandatory,Position=3)][Int]$attempt_number,
        [Switch]$exclude_pull_requests
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}'
}
Export-ModuleMember Get-GitHubReposActionsRunsAttempts

Function New-GitHubOrgsInvitations {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/invitations'
}
Export-ModuleMember New-GitHubOrgsInvitations

Function Get-GitHubUserMigrationsArchive {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$migration_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations/{migration_id}/archive'
}
Export-ModuleMember Get-GitHubUserMigrationsArchive

Function Set-GitHubReposPullsUpdatebranch {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/update-branch'
}
Export-ModuleMember Set-GitHubReposPullsUpdatebranch

Function Get-GitHubUserOrgs {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/orgs'
}
Export-ModuleMember Get-GitHubUserOrgs

Function Get-GitHubReposCommentsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments/{comment_id}/reactions'
}
Export-ModuleMember Get-GitHubReposCommentsReactions

Function Get-GitHubOrgsDependabotSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/public-key'
}
Export-ModuleMember Get-GitHubOrgsDependabotSecretsPublickey

Function Get-GitHubOrgsHooksDeliveries {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='delivery_id')][Int]$delivery_id,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$cursor,
        [Parameter(ParameterSetName='Search')][Switch]$redelivery
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'delivery_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}/deliveries' } 
    }
}
Export-ModuleMember Get-GitHubOrgsHooksDeliveries

Function Get-GitHubReposActionsRunsPendingdeployments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments'
}
Export-ModuleMember Get-GitHubReposActionsRunsPendingdeployments

Function Set-GitHubReposInteractionlimits {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/interaction-limits'
}
Export-ModuleMember Set-GitHubReposInteractionlimits

Function Remove-GitHubReposBranchesProtectionRequiredsignatures {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_signatures'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRequiredsignatures

Function New-GitHubOrgsTeamsDiscussionsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions'
}
Export-ModuleMember New-GitHubOrgsTeamsDiscussionsReactions

Function New-GitHubReposPullsCommentsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions'
}
Export-ModuleMember New-GitHubReposPullsCommentsReactions

Function Get-GitHubAdvisories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$ghsa_id,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$after,
        [Parameter(ParameterSetName='Search')][String]$before,
        [Parameter(ParameterSetName='Search')][String]$cve_id,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$modified,
        [Parameter(ParameterSetName='Search')][String]$published,
        [Parameter(ParameterSetName='Search')][String]$severity,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$type,
        [Parameter(ParameterSetName='Search')][String]$updated,
        [Parameter(ParameterSetName='Search')][Switch]$is_withdrawn,
        [Parameter(ParameterSetName='Search')]$affects,
        [Parameter(ParameterSetName='Search')]$cwes,
        [Parameter(ParameterSetName='Search')]$ecosystem
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ghsa_id' { Invoke-GitHub -PsBP $PsBoundParameters 'advisories/{ghsa_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'advisories' } 
    }
}
Export-ModuleMember Get-GitHubAdvisories

Function Get-GitHubReposCodespacesSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/secrets/public-key'
}
Export-ModuleMember Get-GitHubReposCodespacesSecretsPublickey

Function New-GitHubReposBranchesProtectionRestrictionsApps {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
}
Export-ModuleMember New-GitHubReposBranchesProtectionRestrictionsApps

Function Get-GitHubReposProjects {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/projects'
}
Export-ModuleMember Get-GitHubReposProjects

Function Set-GitHubOrgsCodespacesSecretsRepositories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name,
        [Parameter(Mandatory,Position=2,ParameterSetName='repository_id')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}/repositories' } 
        'repository_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}' } 
    }
}
Export-ModuleMember Set-GitHubOrgsCodespacesSecretsRepositories

Function Set-GitHubReposDependabotSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubReposDependabotSecrets

Function Get-GitHubReposPulls {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='pull_number')][Int]$pull_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$base,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$head,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'pull_number' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls' } 
    }
}
Export-ModuleMember Get-GitHubReposPulls

Function Get-GitHubReposGitBlobs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$file_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/blobs/{file_sha}'
}
Export-ModuleMember Get-GitHubReposGitBlobs

Function Get-GitHubOrgsSettingsBillingSharedstorage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/settings/billing/shared-storage'
}
Export-ModuleMember Get-GitHubOrgsSettingsBillingSharedstorage

Function Set-GitHubTeamsProjects {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/projects/{project_id}'
}
Export-ModuleMember Set-GitHubTeamsProjects

Function Get-GitHubOrgsSecurityadvisories {
    [CmdletBinding()]
    param (
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$sort,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/security-advisories'
}
Export-ModuleMember Get-GitHubOrgsSecurityadvisories

Function New-GitHubReposHooksPings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/pings'
}
Export-ModuleMember New-GitHubReposHooksPings

Function Remove-GitHubOrgsOrganizationrolesUsers {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username,
        [Parameter(Mandatory,Position=2,ParameterSetName='role_id')][Int]$role_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'role_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/users/{username}/{role_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/users/{username}' } 
    }
}
Export-ModuleMember Remove-GitHubOrgsOrganizationrolesUsers

Function Get-GitHubUsersSettingsBillingActions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/settings/billing/actions'
}
Export-ModuleMember Get-GitHubUsersSettingsBillingActions

Function Get-GitHubReposPrivatevulnerabilityreporting {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/private-vulnerability-reporting'
}
Export-ModuleMember Get-GitHubReposPrivatevulnerabilityreporting

Function Remove-GitHubRepos {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}'
}
Export-ModuleMember Remove-GitHubRepos

Function Get-GitHubUserSubscriptions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/subscriptions'
}
Export-ModuleMember Get-GitHubUserSubscriptions

Function New-GitHubOrgsCodespacesAccessSelectedusers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/access/selected_users'
}
Export-ModuleMember New-GitHubOrgsCodespacesAccessSelectedusers

Function Get-GitHubTeamsDiscussionsCommentsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number,
        [Parameter(Mandatory,Position=2)][Int]$comment_number,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}/reactions'
}
Export-ModuleMember Get-GitHubTeamsDiscussionsCommentsReactions

Function New-GitHubOrgsPersonalaccesstokenrequests {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='pat_request_id')][Int]$pat_request_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-token-requests' } 
        'pat_request_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-token-requests/{pat_request_id}' } 
    }
}
Export-ModuleMember New-GitHubOrgsPersonalaccesstokenrequests

Function Get-GitHubOrgsPackagesVersions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$org,
        [Parameter(Mandatory,Position=3,ParameterSetName='package_version_id')][Int]$package_version_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'package_version_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}/versions' } 
    }
}
Export-ModuleMember Get-GitHubOrgsPackagesVersions

Function Get-GitHubReposEnvironmentsSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/secrets/public-key'
}
Export-ModuleMember Get-GitHubReposEnvironmentsSecretsPublickey

Function Set-GitHubReposPullsMerge {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/merge'
}
Export-ModuleMember Set-GitHubReposPullsMerge

Function Update-GitHubReposCheckruns {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-runs/{check_run_id}'
}
Export-ModuleMember Update-GitHubReposCheckruns

Function Remove-GitHubOrgsCodespacesSecretsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name,
        [Parameter(Mandatory,Position=2)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubOrgsCodespacesSecretsRepositories

Function Update-GitHubRepos {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}'
}
Export-ModuleMember Update-GitHubRepos

Function Remove-GitHubAppInstallationsSuspended {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$installation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app/installations/{installation_id}/suspended'
}
Export-ModuleMember Remove-GitHubAppInstallationsSuspended

Function Update-GitHubProjects {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/{project_id}'
}
Export-ModuleMember Update-GitHubProjects

Function Get-GitHubOrgsMembersCodespaces {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members/{username}/codespaces'
}
Export-ModuleMember Get-GitHubOrgsMembersCodespaces

Function Remove-GitHubGistsStar {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/star'
}
Export-ModuleMember Remove-GitHubGistsStar

Function Remove-GitHubReposHooks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}'
}
Export-ModuleMember Remove-GitHubReposHooks

Function New-GitHubReposDeployments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments'
}
Export-ModuleMember New-GitHubReposDeployments

Function Set-GitHubReposNotifications {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/notifications'
}
Export-ModuleMember Set-GitHubReposNotifications

Function Remove-GitHubReposLabels {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/labels/{name}'
}
Export-ModuleMember Remove-GitHubReposLabels

Function Remove-GitHubTeamsProjects {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/projects/{project_id}'
}
Export-ModuleMember Remove-GitHubTeamsProjects

Function Get-GitHubTeamsDiscussionsComments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number,
        [Parameter(Mandatory,Position=2,ParameterSetName='comment_number')][Int]$comment_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments' } 
        'comment_number' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}' } 
    }
}
Export-ModuleMember Get-GitHubTeamsDiscussionsComments

Function Get-GitHubTeamsProjects {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='project_id')][Int]$project_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'project_id' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/projects/{project_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/projects' } 
    }
}
Export-ModuleMember Get-GitHubTeamsProjects

Function New-GitHubTeamsDiscussionsCommentsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number,
        [Parameter(Mandatory,Position=2)][Int]$comment_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}/reactions'
}
Export-ModuleMember New-GitHubTeamsDiscussionsCommentsReactions

Function Get-GitHubOrgsHooksConfig {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}/config'
}
Export-ModuleMember Get-GitHubOrgsHooksConfig

Function Set-GitHubReposActionsPermissionsAccess {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions/access'
}
Export-ModuleMember Set-GitHubReposActionsPermissionsAccess

Function Remove-GitHubOrgsMembersCodespaces {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username,
        [Parameter(Mandatory,Position=2)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members/{username}/codespaces/{codespace_name}'
}
Export-ModuleMember Remove-GitHubOrgsMembersCodespaces

Function New-GitHubReposDeploymentsStatuses {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$deployment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments/{deployment_id}/statuses'
}
Export-ModuleMember New-GitHubReposDeploymentsStatuses

Function Get-GitHubReposCodescanningCodeqlVariantanalyses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$codeql_variant_analysis_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}'
}
Export-ModuleMember Get-GitHubReposCodescanningCodeqlVariantanalyses

Function Remove-GitHubOrgsBlocks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/blocks/{username}'
}
Export-ModuleMember Remove-GitHubOrgsBlocks

Function Update-GitHubReposChecksuitesPreferences {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-suites/preferences'
}
Export-ModuleMember Update-GitHubReposChecksuitesPreferences

Function New-GitHubReposGitTags {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/tags'
}
Export-ModuleMember New-GitHubReposGitTags

Function Enable-GitHubReposActionsWorkflows {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$workflow_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows/{workflow_id}/enable'
}
Export-ModuleMember Enable-GitHubReposActionsWorkflows

Function Get-GitHubUserMarketplacepurchasesStubbed {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/marketplace_purchases/stubbed'
}
Export-ModuleMember Get-GitHubUserMarketplacepurchasesStubbed

Function Get-GitHubReposCodespacesPermissionscheck {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref,
        [Parameter(Mandatory,Position=3)][String]$devcontainer_path
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/permissions_check'
}
Export-ModuleMember Get-GitHubReposCodespacesPermissionscheck

Function Get-GitHubReposAutomatedsecurityfixes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/automated-security-fixes'
}
Export-ModuleMember Get-GitHubReposAutomatedsecurityfixes

Function Remove-GitHubReposDependabotSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubReposDependabotSecrets

Function Get-GitHubUserMigrationsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$migration_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations/{migration_id}/repositories'
}
Export-ModuleMember Get-GitHubUserMigrationsRepositories

Function Get-GitHubOrgsOrganizationfinegrainedpermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-fine-grained-permissions'
}
Export-ModuleMember Get-GitHubOrgsOrganizationfinegrainedpermissions

Function New-GitHubReposPullsRequestedreviewers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers'
}
Export-ModuleMember New-GitHubReposPullsRequestedreviewers

Function Remove-GitHubReposBranchesProtectionEnforceadmins {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionEnforceadmins

Function Get-GitHubOrgsCodescanningAlerts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$sort,
        $severity,
        $state,
        $tool_guid,
        $tool_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/code-scanning/alerts'
}
Export-ModuleMember Get-GitHubOrgsCodescanningAlerts

Function New-GitHubOrgsTeamsDiscussionsCommentsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3)][Int]$comment_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions'
}
Export-ModuleMember New-GitHubOrgsTeamsDiscussionsCommentsReactions

Function New-GitHubReposSecurityadvisoriesCve {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ghsa_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories/{ghsa_id}/cve'
}
Export-ModuleMember New-GitHubReposSecurityadvisoriesCve

Function New-GitHubOrgsRepos {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/repos'
}
Export-ModuleMember New-GitHubOrgsRepos

Function Get-GitHubReposDependabotSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/secrets/{secret_name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/secrets' } 
    }
}
Export-ModuleMember Get-GitHubReposDependabotSecrets

Function Get-GitHubTeamsDiscussionsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/reactions'
}
Export-ModuleMember Get-GitHubTeamsDiscussionsReactions

Function Set-GitHubOrgsOutsidecollaborators {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/outside_collaborators/{username}'
}
Export-ModuleMember Set-GitHubOrgsOutsidecollaborators

Function Remove-GitHubGists {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}'
}
Export-ModuleMember Remove-GitHubGists

Function New-GitHubProjectsColumnsMoves {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$column_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/{column_id}/moves'
}
Export-ModuleMember New-GitHubProjectsColumnsMoves

Function Find-GitHubSearchCode {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$q,
        [String]$order,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/code'
}
Export-ModuleMember Find-GitHubSearchCode

Function Remove-GitHubReposVulnerabilityalerts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/vulnerability-alerts'
}
Export-ModuleMember Remove-GitHubReposVulnerabilityalerts

Function New-GitHubReposDispatches {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dispatches'
}
Export-ModuleMember New-GitHubReposDispatches

Function Get-GitHubReposCodescanningAlertsInstances {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$alert_number,
        $ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/instances'
}
Export-ModuleMember Get-GitHubReposCodescanningAlertsInstances

Function New-GitHubUserRepos {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/repos'
}
Export-ModuleMember New-GitHubUserRepos

Function Get-GitHubOrgsHooks {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='hook_id')][Int]$hook_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'hook_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks' } 
    }
}
Export-ModuleMember Get-GitHubOrgsHooks

Function Remove-GitHubUserMigrationsArchive {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$migration_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations/{migration_id}/archive'
}
Export-ModuleMember Remove-GitHubUserMigrationsArchive

Function Get-GitHubOrgsInvitations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$invitation_source,
        [String]$role
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/invitations'
}
Export-ModuleMember Get-GitHubOrgsInvitations

Function Get-GitHubReposContents {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$path,
        [String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/contents/{path}'
}
Export-ModuleMember Get-GitHubReposContents

Function Update-GitHubOrgs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}'
}
Export-ModuleMember Update-GitHubOrgs

Function New-GitHubUsersPackagesRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$username,
        [String]$token
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/packages/{package_type}/{package_name}/restore'
}
Export-ModuleMember New-GitHubUsersPackagesRestore

Function New-GitHubReposMergeupstream {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/merge-upstream'
}
Export-ModuleMember New-GitHubReposMergeupstream

Function Get-GitHubAssignmentsGrades {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$assignment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'assignments/{assignment_id}/grades'
}
Export-ModuleMember Get-GitHubAssignmentsGrades

Function Remove-GitHubUserCodespacesSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubUserCodespacesSecrets

Function Remove-GitHubOrgsPackagesVersions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2)][String]$org,
        [Parameter(Mandatory,Position=3)][Int]$package_version_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}'
}
Export-ModuleMember Remove-GitHubOrgsPackagesVersions

Function Get-GitHubReposActionsWorkflowsTiming {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$workflow_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing'
}
Export-ModuleMember Get-GitHubReposActionsWorkflowsTiming

Function Set-GitHubReposContents {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$path
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/contents/{path}'
}
Export-ModuleMember Set-GitHubReposContents

Function Set-GitHubOrgsCodespacesSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubOrgsCodespacesSecrets

Function Get-GitHubUserCodespacesSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets' } 
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}' } 
    }
}
Export-ModuleMember Get-GitHubUserCodespacesSecrets

Function Get-GitHubUserCodespacesMachines {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}/machines'
}
Export-ModuleMember Get-GitHubUserCodespacesMachines

Function Update-GitHubOrgsTeamsDiscussionsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3)][Int]$comment_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}'
}
Export-ModuleMember Update-GitHubOrgsTeamsDiscussionsComments

Function Get-GitHubReposComments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='comment_id')][Int]$comment_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments' } 
        'comment_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments/{comment_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposComments

Function Set-GitHubTeamsMemberships {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/memberships/{username}'
}
Export-ModuleMember Set-GitHubTeamsMemberships

Function Get-GitHubReposBranchesProtectionRequiredstatuschecks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRequiredstatuschecks

Function Remove-GitHubOrgsOrganizationrolesTeams {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2,ParameterSetName='role_id')][Int]$role_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/teams/{team_slug}' } 
        'role_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/teams/{team_slug}/{role_id}' } 
    }
}
Export-ModuleMember Remove-GitHubOrgsOrganizationrolesTeams

Function Remove-GitHubReposAutolinks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$autolink_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/autolinks/{autolink_id}'
}
Export-ModuleMember Remove-GitHubReposAutolinks

Function Get-GitHubReposStargazers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/stargazers'
}
Export-ModuleMember Get-GitHubReposStargazers

Function Remove-GitHubReposDeployments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$deployment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments/{deployment_id}'
}
Export-ModuleMember Remove-GitHubReposDeployments

Function Get-GitHubReposActionsWorkflowsRuns {
    [CmdletBinding()]
    param (
        [Int]$check_suite_id,
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$workflow_id,
        [String]$actor,
        [String]$branch,
        [String]$created,
        [String]$event,
        [String]$head_sha,
        [String]$status,
        [Switch]$exclude_pull_requests
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs'
}
Export-ModuleMember Get-GitHubReposActionsWorkflowsRuns

Function Get-GitHubReposPullsCommits {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/commits'
}
Export-ModuleMember Get-GitHubReposPullsCommits

Function Get-GitHubReposHooksDeliveries {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$hook_id,
        [Parameter(Mandatory,Position=3,ParameterSetName='delivery_id')][Int]$delivery_id,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$cursor,
        [Parameter(ParameterSetName='Search')][Switch]$redelivery
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'delivery_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks/{hook_id}/deliveries' } 
    }
}
Export-ModuleMember Get-GitHubReposHooksDeliveries

Function Set-GitHubOrgsActionsVariablesRepositories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$name,
        [Parameter(Mandatory,Position=2,ParameterSetName='repository_id')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'repository_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}/repositories/{repository_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}/repositories' } 
    }
}
Export-ModuleMember Set-GitHubOrgsActionsVariablesRepositories

Function Get-GitHubReposAutolinks {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='autolink_id')][Int]$autolink_id
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'autolink_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/autolinks/{autolink_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/autolinks' } 
    }
}
Export-ModuleMember Get-GitHubReposAutolinks

Function Get-GitHubReposIssuesAssignees {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number,
        [Parameter(Mandatory,Position=3)][String]$assignee
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/assignees/{assignee}'
}
Export-ModuleMember Get-GitHubReposIssuesAssignees

Function New-GitHubReposStatuses {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/statuses/{sha}'
}
Export-ModuleMember New-GitHubReposStatuses

Function Get-GitHubRepositories {
    [CmdletBinding()]
    param (
        [Int]$since
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repositories'
}
Export-ModuleMember Get-GitHubRepositories

Function Get-GitHubTeamsTeams {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$team_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/teams'
}
Export-ModuleMember Get-GitHubTeamsTeams

Function Get-GitHubTeamsInvitations {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$team_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/invitations'
}
Export-ModuleMember Get-GitHubTeamsInvitations

Function Get-GitHubOrgsPersonalaccesstokenrequestsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$pat_request_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-token-requests/{pat_request_id}/repositories'
}
Export-ModuleMember Get-GitHubOrgsPersonalaccesstokenrequestsRepositories

Function Remove-GitHubUserCodespacesSecretsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$secret_name,
        [Parameter(Mandatory,Position=1)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubUserCodespacesSecretsRepositories

Function New-GitHubUserPackagesRestore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [String]$token
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}/restore'
}
Export-ModuleMember New-GitHubUserPackagesRestore

Function Remove-GitHubReposBranchesProtectionRequiredstatuschecks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRequiredstatuschecks

Function Get-GitHubNotificationsThreadsSubscription {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$thread_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications/threads/{thread_id}/subscription'
}
Export-ModuleMember Get-GitHubNotificationsThreadsSubscription

Function New-GitHubUserEmails {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/emails'
}
Export-ModuleMember New-GitHubUserEmails

Function Get-GitHubReposCodespacesMachines {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$client_ip,
        [String]$location,
        [String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/machines'
}
Export-ModuleMember Get-GitHubReposCodespacesMachines

Function Get-GitHubReposPullsFiles {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/files'
}
Export-ModuleMember Get-GitHubReposPullsFiles

Function Get-GitHubUserMembershipsOrgs {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='org')][String]$org,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/memberships/orgs' } 
        'org' { Invoke-GitHub -PsBP $PsBoundParameters 'user/memberships/orgs/{org}' } 
    }
}
Export-ModuleMember Get-GitHubUserMembershipsOrgs

Function Get-GitHubReposPagesBuildsLatest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages/builds/latest'
}
Export-ModuleMember Get-GitHubReposPagesBuildsLatest

Function New-GitHubOrgsMembersCodespacesStop {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username,
        [Parameter(Mandatory,Position=2)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/members/{username}/codespaces/{codespace_name}/stop'
}
Export-ModuleMember New-GitHubOrgsMembersCodespacesStop

Function Set-GitHubOrgsActionsOidcCustomizationSub {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/oidc/customization/sub'
}
Export-ModuleMember Set-GitHubOrgsActionsOidcCustomizationSub

Function Get-GitHubReposInteractionlimits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/interaction-limits'
}
Export-ModuleMember Get-GitHubReposInteractionlimits

Function Remove-GitHubOrgsDependabotSecrets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/secrets/{secret_name}'
}
Export-ModuleMember Remove-GitHubOrgsDependabotSecrets

Function New-GitHubOrgsHooks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks'
}
Export-ModuleMember New-GitHubOrgsHooks

Function New-GitHubReposActionsVariables {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/variables'
}
Export-ModuleMember New-GitHubReposActionsVariables

Function Get-GitHubTeamsMemberships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/memberships/{username}'
}
Export-ModuleMember Get-GitHubTeamsMemberships

Function New-GitHubReposBranchesProtectionRequiredstatuschecksContexts {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
}
Export-ModuleMember New-GitHubReposBranchesProtectionRequiredstatuschecksContexts

Function Remove-GitHubUserInstallationsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$installation_id,
        [Parameter(Mandatory,Position=1)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/installations/{installation_id}/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubUserInstallationsRepositories

Function Get-GitHubOrgsOrganizationrolesTeams {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$role_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/{role_id}/teams'
}
Export-ModuleMember Get-GitHubOrgsOrganizationrolesTeams

Function Update-GitHubReposComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments/{comment_id}'
}
Export-ModuleMember Update-GitHubReposComments

Function Get-GitHubReposGitMatchingrefs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/matching-refs/{ref}'
}
Export-ModuleMember Get-GitHubReposGitMatchingrefs

Function Remove-GitHubGistsComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id,
        [Parameter(Mandatory,Position=1)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/comments/{comment_id}'
}
Export-ModuleMember Remove-GitHubGistsComments

Function New-GitHubTeamsDiscussionsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/comments'
}
Export-ModuleMember New-GitHubTeamsDiscussionsComments

Function New-GitHubOrgsProjects {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/projects'
}
Export-ModuleMember New-GitHubOrgsProjects

Function Set-GitHubReposActionsOidcCustomizationSub {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/oidc/customization/sub'
}
Export-ModuleMember Set-GitHubReposActionsOidcCustomizationSub

Function Remove-GitHubOrgsActionsVariables {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}'
}
Export-ModuleMember Remove-GitHubOrgsActionsVariables

Function Set-GitHubOrgsCodespacesAccess {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/access'
}
Export-ModuleMember Set-GitHubOrgsCodespacesAccess

Function Get-GitHubReposCodespaces {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces'
}
Export-ModuleMember Get-GitHubReposCodespaces

Function Get-GitHubGistsPublic {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [String]$since
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/public'
}
Export-ModuleMember Get-GitHubGistsPublic

Function Remove-GitHubReposBranchesProtectionRequiredstatuschecksContexts {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRequiredstatuschecksContexts

Function New-GitHubOrgsHooksPings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$hook_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/hooks/{hook_id}/pings'
}
Export-ModuleMember New-GitHubOrgsHooksPings

Function New-GitHubUserProjects {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/projects'
}
Export-ModuleMember New-GitHubUserProjects

Function Remove-GitHubReposPrivatevulnerabilityreporting {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/private-vulnerability-reporting'
}
Export-ModuleMember Remove-GitHubReposPrivatevulnerabilityreporting

Function Get-GitHubUserCodespacesSecretsRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}/repositories'
}
Export-ModuleMember Get-GitHubUserCodespacesSecretsRepositories

Function Get-GitHubReposPullsMerge {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/merge'
}
Export-ModuleMember Get-GitHubReposPullsMerge

Function Find-GitHubSearchRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$q,
        [String]$order,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/repositories'
}
Export-ModuleMember Find-GitHubSearchRepositories

Function Update-GitHubTeamsDiscussions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}'
}
Export-ModuleMember Update-GitHubTeamsDiscussions

Function Get-GitHubGistsStar {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/star'
}
Export-ModuleMember Get-GitHubGistsStar

Function Get-GitHubTeamsDiscussions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='discussion_number')][Int]$discussion_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions' } 
        'discussion_number' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}' } 
    }
}
Export-ModuleMember Get-GitHubTeamsDiscussions

Function Get-GitHubOrgsDependabotAlerts {
    [CmdletBinding()]
    param (
        [Int]$first,
        [Int]$last,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$ecosystem,
        [String]$package,
        [String]$scope,
        [String]$severity,
        [String]$sort,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/dependabot/alerts'
}
Export-ModuleMember Get-GitHubOrgsDependabotAlerts

Function New-GitHubReposGitBlobs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/blobs'
}
Export-ModuleMember New-GitHubReposGitBlobs

Function Update-GitHubReposCodescanningDefaultsetup {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/default-setup'
}
Export-ModuleMember Update-GitHubReposCodescanningDefaultsetup

Function Set-GitHubReposBranchesProtection {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection'
}
Export-ModuleMember Set-GitHubReposBranchesProtection

Function Get-GitHubGistsComments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='comment_id')][Int]$comment_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/comments' } 
        'comment_id' { Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/comments/{comment_id}' } 
    }
}
Export-ModuleMember Get-GitHubGistsComments

Function Get-GitHubOrgsCopilotBillingSeats {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/billing/seats'
}
Export-ModuleMember Get-GitHubOrgsCopilotBillingSeats

Function New-GitHubReposActionsRunsCancel {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/cancel'
}
Export-ModuleMember New-GitHubReposActionsRunsCancel

Function Get-GitHubUser {
    [CmdletBinding()]
    param ( )
    Invoke-GitHub -PsBP $PsBoundParameters 'user'
}
Export-ModuleMember Get-GitHubUser

Function Set-GitHubOrgsActionsSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubOrgsActionsSecrets

Function Get-GitHubUserKeys {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='key_id')][Int]$key_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/keys' } 
        'key_id' { Invoke-GitHub -PsBP $PsBoundParameters 'user/keys/{key_id}' } 
    }
}
Export-ModuleMember Get-GitHubUserKeys

Function Get-GitHubReposPullsCommentsReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions'
}
Export-ModuleMember Get-GitHubReposPullsCommentsReactions

Function Get-GitHubReposGitRef {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/ref/{ref}'
}
Export-ModuleMember Get-GitHubReposGitRef

Function Get-GitHubOrgsInvitationsTeams {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$invitation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/invitations/{invitation_id}/teams'
}
Export-ModuleMember Get-GitHubOrgsInvitationsTeams

Function Find-GitHubSearchUsers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$q,
        [String]$order,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'search/users'
}
Export-ModuleMember Find-GitHubSearchUsers

Function New-GitHubReposIssues {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues'
}
Export-ModuleMember New-GitHubReposIssues

Function Get-GitHubOrgsActionsCacheUsagebyrepository {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/cache/usage-by-repository'
}
Export-ModuleMember Get-GitHubOrgsActionsCacheUsagebyrepository

Function Get-GitHubReposActionsRunsAttemptsLogs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$run_id,
        [Parameter(Mandatory,Position=3)][Int]$attempt_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/logs'
}
Export-ModuleMember Get-GitHubReposActionsRunsAttemptsLogs

Function Set-GitHubReposEnvironmentsSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubReposEnvironmentsSecrets

Function Get-GitHubReposDeployments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='deployment_id')][Int]$deployment_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$environment,
        [Parameter(ParameterSetName='Search')][String]$ref,
        [Parameter(ParameterSetName='Search')][String]$sha,
        [Parameter(ParameterSetName='Search')][String]$task,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments' } 
        'deployment_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments/{deployment_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposDeployments

Function Get-GitHubOrgsCopilotBilling {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/billing'
}
Export-ModuleMember Get-GitHubOrgsCopilotBilling

Function Get-GitHubReposCodespacesDevcontainers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/devcontainers'
}
Export-ModuleMember Get-GitHubReposCodespacesDevcontainers

Function New-GitHubTeamsDiscussionsReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1)][Int]$discussion_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/discussions/{discussion_number}/reactions'
}
Export-ModuleMember New-GitHubTeamsDiscussionsReactions

Function Get-GitHubOrgsOrganizationrolesUsers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$role_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/{role_id}/users'
}
Export-ModuleMember Get-GitHubOrgsOrganizationrolesUsers

Function Get-GitHubReposSecurityadvisories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='ghsa_id')][String]$ghsa_id,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$after,
        [Parameter(ParameterSetName='Search')][String]$before,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$state
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories' } 
        'ghsa_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/security-advisories/{ghsa_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposSecurityadvisories

Function Get-GitHubReposBranchesProtectionRestrictionsTeams {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRestrictionsTeams

Function Get-GitHubTeamsRepos {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][Int]$team_id,
        [Parameter(Mandatory,Position=1,ParameterSetName='ownerrepo')][String]$owner,
        [Parameter(Mandatory,Position=2,ParameterSetName='ownerrepo')][String]$repo,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ownerrepo' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/repos/{owner}/{repo}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'teams/{team_id}/repos' } 
    }
}
Export-ModuleMember Get-GitHubTeamsRepos

Function Get-GitHubUserRepos {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [String]$affiliation,
        [String]$before,
        [String]$direction,
        [String]$since,
        [String]$sort,
        [String]$type,
        [String]$visibility
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/repos'
}
Export-ModuleMember Get-GitHubUserRepos

Function New-GitHubGistsForks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/forks'
}
Export-ModuleMember New-GitHubGistsForks

Function New-GitHubReposReleasesAssets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$release_id,
        [Parameter(Mandatory,Position=3)][String]$name,
        [String]$label
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}/assets'
}
Export-ModuleMember New-GitHubReposReleasesAssets

Function Remove-GitHubReposIssuesReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number,
        [Parameter(Mandatory,Position=3)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubReposIssuesReactions

Function Remove-GitHubReposGitRefs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/refs/{ref}'
}
Export-ModuleMember Remove-GitHubReposGitRefs

Function New-GitHubReposActionsRunnersLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
}
Export-ModuleMember New-GitHubReposActionsRunnersLabels

Function Get-GitHubReposBranchesProtectionRequiredpullrequestreviews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRequiredpullrequestreviews

Function Remove-GitHubUserKeys {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$key_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/keys/{key_id}'
}
Export-ModuleMember Remove-GitHubUserKeys

Function New-GitHubUserSocialaccounts {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/social_accounts'
}
Export-ModuleMember New-GitHubUserSocialaccounts

Function Get-GitHubReposNotifications {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$before,
        [String]$since,
        [Switch]$all,
        [Switch]$participating
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/notifications'
}
Export-ModuleMember Get-GitHubReposNotifications

Function Get-GitHubReposChecksuites {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_suite_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-suites/{check_suite_id}'
}
Export-ModuleMember Get-GitHubReposChecksuites

Function Get-GitHubMarketplacelistingPlansAccounts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][Int]$plan_id,
        [String]$direction,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'marketplace_listing/plans/{plan_id}/accounts'
}
Export-ModuleMember Get-GitHubMarketplacelistingPlansAccounts

Function Remove-GitHubReposBranchesProtectionRestrictionsTeams {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRestrictionsTeams

Function Set-GitHubReposActionsPermissions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/permissions'
}
Export-ModuleMember Set-GitHubReposActionsPermissions

Function Remove-GitHubOrgsActionsVariablesRepositories {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$name,
        [Parameter(Mandatory,Position=2)][Int]$repository_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/variables/{name}/repositories/{repository_id}'
}
Export-ModuleMember Remove-GitHubOrgsActionsVariablesRepositories

Function New-GitHubApplicationsTokenScoped {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$client_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'applications/{client_id}/token/scoped'
}
Export-ModuleMember New-GitHubApplicationsTokenScoped

Function Set-GitHubReposImport {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import'
}
Export-ModuleMember Set-GitHubReposImport

Function New-GitHubAppmanifestsConversions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$code
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'app-manifests/{code}/conversions'
}
Export-ModuleMember New-GitHubAppmanifestsConversions

Function Get-GitHubUsersInstallation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/installation'
}
Export-ModuleMember Get-GitHubUsersInstallation

Function Get-GitHubReposIssuesLabels {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/labels'
}
Export-ModuleMember Get-GitHubReposIssuesLabels

Function Get-GitHubMarketplacelistingStubbedAccounts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$account_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'marketplace_listing/stubbed/accounts/{account_id}'
}
Export-ModuleMember Get-GitHubMarketplacelistingStubbedAccounts

Function Get-GitHubUserSocialaccounts {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/social_accounts'
}
Export-ModuleMember Get-GitHubUserSocialaccounts

Function Remove-GitHubReposAutomatedsecurityfixes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/automated-security-fixes'
}
Export-ModuleMember Remove-GitHubReposAutomatedsecurityfixes

Function Get-GitHubReposTrafficClones {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$per
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/traffic/clones'
}
Export-ModuleMember Get-GitHubReposTrafficClones

Function Get-GitHubReposCodespacesNew {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$client_ip,
        [String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/new'
}
Export-ModuleMember Get-GitHubReposCodespacesNew

Function Get-GitHubReposCommitsBrancheswherehead {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$commit_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head'
}
Export-ModuleMember Get-GitHubReposCommitsBrancheswherehead

Function Get-GitHubReposTags {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/tags'
}
Export-ModuleMember Get-GitHubReposTags

Function Get-GitHubReposReleasesReactions {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$release_id,
        [String]$content
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}/reactions'
}
Export-ModuleMember Get-GitHubReposReleasesReactions

Function Get-GitHubReposEnvironments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='environment_name')][String]$environment_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'environment_name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments' } 
    }
}
Export-ModuleMember Get-GitHubReposEnvironments

Function Get-GitHubReposActivity {
    [CmdletBinding()]
    param (
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [String]$activity_type,
        [String]$actor,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$ref,
        [String]$time_period
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/activity'
}
Export-ModuleMember Get-GitHubReposActivity

Function Get-GitHubReposDeploymentsStatuses {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$deployment_id,
        [Parameter(Mandatory,Position=3,ParameterSetName='status_id')][Int]$status_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'status_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments/{deployment_id}/statuses/{status_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/deployments/{deployment_id}/statuses' } 
    }
}
Export-ModuleMember Get-GitHubReposDeploymentsStatuses

Function Set-GitHubReposCodespacesSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/codespaces/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubReposCodespacesSecrets

Function Update-GitHubReposPullsComments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments/{comment_id}'
}
Export-ModuleMember Update-GitHubReposPullsComments

Function New-GitHubOrgsActionsRunnersRemovetoken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/remove-token'
}
Export-ModuleMember New-GitHubOrgsActionsRunnersRemovetoken

Function Get-GitHubReposCommitsStatuses {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$ref
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/commits/{ref}/statuses'
}
Export-ModuleMember Get-GitHubReposCommitsStatuses

Function Get-GitHubUserMigrations {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='migration_id')][Int]$migration_id,
        [Parameter(ParameterSetName='migration_id')][String[]]$exclude,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'migration_id' { Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations/{migration_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/migrations' } 
    }
}
Export-ModuleMember Get-GitHubUserMigrations

Function Get-GitHubReposAssignees {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='assignee')][String]$assignee,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/assignees' } 
        'assignee' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/assignees/{assignee}' } 
    }
}
Export-ModuleMember Get-GitHubReposAssignees

Function Update-GitHubReposIssues {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}'
}
Export-ModuleMember Update-GitHubReposIssues

Function Get-GitHubUsersEvents {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/events'
}
Export-ModuleMember Get-GitHubUsersEvents

Function Get-GitHubReposCheckruns {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$check_run_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/check-runs/{check_run_id}'
}
Export-ModuleMember Get-GitHubReposCheckruns

Function Get-GitHubOrgsMemberships {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/memberships/{username}'
}
Export-ModuleMember Get-GitHubOrgsMemberships

Function Get-GitHubOrgsRulesets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='ruleset_id')][Int]$ruleset_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ruleset_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets/{ruleset_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/rulesets' } 
    }
}
Export-ModuleMember Get-GitHubOrgsRulesets

Function Get-GitHubUsersSettingsBillingPackages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/settings/billing/packages'
}
Export-ModuleMember Get-GitHubUsersSettingsBillingPackages

Function Update-GitHubReposImportLfs {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import/lfs'
}
Export-ModuleMember Update-GitHubReposImportLfs

Function Get-GitHubReposActionsRuns {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='run_id')][Int]$run_id,
        [Parameter(ParameterSetName='Search')][Int]$check_suite_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$actor,
        [Parameter(ParameterSetName='Search')][String]$branch,
        [Parameter(ParameterSetName='Search')][String]$created,
        [Parameter(ParameterSetName='Search')][String]$event,
        [Parameter(ParameterSetName='Search')][String]$head_sha,
        [Parameter(ParameterSetName='Search')][String]$status,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll,
        [Switch]$exclude_pull_requests
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs' } 
        'run_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runs/{run_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposActionsRuns

Function Get-GitHubReposEnvironmentsSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/secrets' } 
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}' } 
    }
}
Export-ModuleMember Get-GitHubReposEnvironmentsSecrets

Function Get-GitHubReposBranchesProtectionRequiredsignatures {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/required_signatures'
}
Export-ModuleMember Get-GitHubReposBranchesProtectionRequiredsignatures

Function Get-GitHubUsersFollowers {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/followers'
}
Export-ModuleMember Get-GitHubUsersFollowers

Function Set-GitHubOrgsActionsPermissionsRepositories {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='repository_id')][Int]$repository_id,
        [Parameter(ParameterSetName='Search')][HashTable]$Body
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'repository_id' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/repositories/{repository_id}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/repositories' } 
    }
}
Export-ModuleMember Set-GitHubOrgsActionsPermissionsRepositories

Function Remove-GitHubReposCommentsReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$comment_id,
        [Parameter(Mandatory,Position=3)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/comments/{comment_id}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubReposCommentsReactions

Function Remove-GitHubReposEnvironmentsDeploymentbranchpolicies {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name,
        [Parameter(Mandatory,Position=3)][Int]$branch_policy_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}'
}
Export-ModuleMember Remove-GitHubReposEnvironmentsDeploymentbranchpolicies

Function Set-GitHubNotifications {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications'
}
Export-ModuleMember Set-GitHubNotifications

Function Update-GitHubReposImportAuthors {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$author_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import/authors/{author_id}'
}
Export-ModuleMember Update-GitHubReposImportAuthors

Function Remove-GitHubReposMilestones {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$milestone_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/milestones/{milestone_number}'
}
Export-ModuleMember Remove-GitHubReposMilestones

Function Get-GitHubOrgsActionsSecretsPublickey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/secrets/public-key'
}
Export-ModuleMember Get-GitHubOrgsActionsSecretsPublickey

Function New-GitHubReposHooks {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/hooks'
}
Export-ModuleMember New-GitHubReposHooks

Function Get-GitHubOrgsCodespacesSecrets {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1,ParameterSetName='secret_name')][String]$secret_name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'secret_name' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets/{secret_name}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/codespaces/secrets' } 
    }
}
Export-ModuleMember Get-GitHubOrgsCodespacesSecrets

Function Get-GitHubReposCollaboratorsPermission {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/collaborators/{username}/permission'
}
Export-ModuleMember Get-GitHubReposCollaboratorsPermission

Function Remove-GitHubProjectsColumns {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$column_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/{column_id}'
}
Export-ModuleMember Remove-GitHubProjectsColumns

Function Set-GitHubUserFollowing {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/following/{username}'
}
Export-ModuleMember Set-GitHubUserFollowing

Function Remove-GitHubReposCollaborators {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/collaborators/{username}'
}
Export-ModuleMember Remove-GitHubReposCollaborators

Function Update-GitHubApplicationsToken {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$client_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'applications/{client_id}/token'
}
Export-ModuleMember Update-GitHubApplicationsToken

Function New-GitHubReposGitTrees {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/trees'
}
Export-ModuleMember New-GitHubReposGitTrees

Function Get-GitHubReposPullsComments {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='commentscomment_id')][Int]$comment_id,
        [Parameter(Mandatory,Position=2,ParameterSetName='pull_numbercomments')][Int]$pull_number,
        [Parameter(ParameterSetName='pull_numbercomments')][Int]$page,
        [Parameter(ParameterSetName='pull_numbercomments')][Int]$per_page,
        [Parameter(ParameterSetName='pull_numbercomments')][String]$direction,
        [Parameter(ParameterSetName='pull_numbercomments')][String]$since,
        [Parameter(ParameterSetName='pull_numbercomments')][String]$sort,
        [Parameter(ParameterSetName='pull_numbercomments')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'pull_numbercomments' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/comments' } 
        'comments' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments' } 
        'commentscomment_id' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/comments/{comment_id}' } 
    }
}
Export-ModuleMember Get-GitHubReposPullsComments

Function New-GitHubReposPullsCommentsReplies {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$pull_number,
        [Parameter(Mandatory,Position=3)][Int]$comment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pulls/{pull_number}/comments/{comment_id}/replies'
}
Export-ModuleMember New-GitHubReposPullsCommentsReplies

Function Set-GitHubReposActionsRunnersLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
}
Export-ModuleMember Set-GitHubReposActionsRunnersLabels

Function New-GitHubReposDependencygraphSnapshots {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependency-graph/snapshots'
}
Export-ModuleMember New-GitHubReposDependencygraphSnapshots

Function New-GitHubReposIssuesLabels {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/labels'
}
Export-ModuleMember New-GitHubReposIssuesLabels

Function Get-GitHubAssignments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$assignment_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'assignments/{assignment_id}'
}
Export-ModuleMember Get-GitHubAssignments

Function Get-GitHubReposDependabotAlerts {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='alert_number')]$alert_number,
        [Parameter(ParameterSetName='Search')][Int]$first,
        [Parameter(ParameterSetName='Search')][Int]$last,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$after,
        [Parameter(ParameterSetName='Search')][String]$before,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$ecosystem,
        [Parameter(ParameterSetName='Search')][String]$manifest,
        [Parameter(ParameterSetName='Search')][String]$package,
        [Parameter(ParameterSetName='Search')][String]$scope,
        [Parameter(ParameterSetName='Search')][String]$severity,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'alert_number' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/alerts/{alert_number}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/alerts' } 
    }
}
Export-ModuleMember Get-GitHubReposDependabotAlerts

Function Get-GitHubOrgsSecuritymanagers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/security-managers'
}
Export-ModuleMember Get-GitHubOrgsSecuritymanagers

Function Get-GitHubUsersSettingsBillingSharedstorage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/settings/billing/shared-storage'
}
Export-ModuleMember Get-GitHubUsersSettingsBillingSharedstorage

Function New-GitHubGists {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists'
}
Export-ModuleMember New-GitHubGists

Function New-GitHubUserCodespacesPublish {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$codespace_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/{codespace_name}/publish'
}
Export-ModuleMember New-GitHubUserCodespacesPublish

Function Remove-GitHubUserEmails {
    [CmdletBinding()]
    param (
        [HashTable]$Body
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/emails'
}
Export-ModuleMember Remove-GitHubUserEmails

Function Remove-GitHubOrgsTeamsDiscussionsCommentsReactions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$discussion_number,
        [Parameter(Mandatory,Position=3)][Int]$comment_number,
        [Parameter(Mandatory,Position=4)][Int]$reaction_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions/{reaction_id}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsDiscussionsCommentsReactions

Function Get-GitHubReposSubscription {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/subscription'
}
Export-ModuleMember Get-GitHubReposSubscription

Function Remove-GitHubOrgsCopilotBillingSelectedusers {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/copilot/billing/selected_users'
}
Export-ModuleMember Remove-GitHubOrgsCopilotBillingSelectedusers

Function Get-GitHubOrgsPropertiesValues {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String]$repository_query
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/properties/values'
}
Export-ModuleMember Get-GitHubOrgsPropertiesValues

Function Get-GitHubGistsCommits {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$gist_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'gists/{gist_id}/commits'
}
Export-ModuleMember Get-GitHubGistsCommits

Function Remove-GitHubNotificationsThreadsSubscription {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$thread_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'notifications/threads/{thread_id}/subscription'
}
Export-ModuleMember Remove-GitHubNotificationsThreadsSubscription

Function Remove-GitHubOrgsInvitations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$invitation_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/invitations/{invitation_id}'
}
Export-ModuleMember Remove-GitHubOrgsInvitations

Function Update-GitHubReposReleases {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$release_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/releases/{release_id}'
}
Export-ModuleMember Update-GitHubReposReleases

Function Update-GitHubReposActionsVariables {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/variables/{name}'
}
Export-ModuleMember Update-GitHubReposActionsVariables

Function Remove-GitHubProjectsColumnsCards {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][Int]$card_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'projects/columns/cards/{card_id}'
}
Export-ModuleMember Remove-GitHubProjectsColumnsCards

Function Remove-GitHubReposPages {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/pages'
}
Export-ModuleMember Remove-GitHubReposPages

Function Get-GitHubReposLabels {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2,ParameterSetName='name')][String]$name,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/labels' } 
        'name' { Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/labels/{name}' } 
    }
}
Export-ModuleMember Get-GitHubReposLabels

Function Update-GitHubReposDependabotAlerts {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)]$alert_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/dependabot/alerts/{alert_number}'
}
Export-ModuleMember Update-GitHubReposDependabotAlerts

Function Get-GitHubEnterprisesDependabotAlerts {
    [CmdletBinding()]
    param (
        [Int]$first,
        [Int]$last,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$enterprise,
        [String]$after,
        [String]$before,
        [String]$direction,
        [String]$ecosystem,
        [String]$package,
        [String]$scope,
        [String]$severity,
        [String]$sort,
        [String]$state
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'enterprises/{enterprise}/dependabot/alerts'
}
Export-ModuleMember Get-GitHubEnterprisesDependabotAlerts

Function Get-GitHubOrgsActionsRunnersLabels {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$runner_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/runners/{runner_id}/labels'
}
Export-ModuleMember Get-GitHubOrgsActionsRunnersLabels

Function Get-GitHubReposImportLargefiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import/large_files'
}
Export-ModuleMember Get-GitHubReposImportLargefiles

Function Get-GitHubOrgsActionsPermissionsRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/actions/permissions/repositories'
}
Export-ModuleMember Get-GitHubOrgsActionsPermissionsRepositories

Function Set-GitHubUserCodespacesSecrets {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$secret_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'user/codespaces/secrets/{secret_name}'
}
Export-ModuleMember Set-GitHubUserCodespacesSecrets

Function Get-GitHubUsersOrgs {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/orgs'
}
Export-ModuleMember Get-GitHubUsersOrgs

Function Get-GitHubReposCodescanningDefaultsetup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/code-scanning/default-setup'
}
Export-ModuleMember Get-GitHubReposCodescanningDefaultsetup

Function Remove-GitHubReposActionsArtifacts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$artifact_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/actions/artifacts/{artifact_id}'
}
Export-ModuleMember Remove-GitHubReposActionsArtifacts

Function Update-GitHubOrgsOrganizationroles {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][Int]$role_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/organization-roles/{role_id}'
}
Export-ModuleMember Update-GitHubOrgsOrganizationroles

Function Get-GitHubOrgsTeamsDiscussions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2,ParameterSetName='discussion_number')][Int]$discussion_number,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$pinned,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions' } 
        'discussion_number' { Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/discussions/{discussion_number}' } 
    }
}
Export-ModuleMember Get-GitHubOrgsTeamsDiscussions

Function Get-GitHubOrgsPersonalaccesstokenrequests {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String[]]$owner,
        [String]$direction,
        [String]$last_used_after,
        [String]$last_used_before,
        [String]$permission,
        [String]$repository,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-token-requests'
}
Export-ModuleMember Get-GitHubOrgsPersonalaccesstokenrequests

Function Get-GitHubUserStarred {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='ownerrepo')][String]$owner,
        [Parameter(Mandatory,Position=1,ParameterSetName='ownerrepo')][String]$repo,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$direction,
        [Parameter(ParameterSetName='Search')][String]$sort,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'ownerrepo' { Invoke-GitHub -PsBP $PsBoundParameters 'user/starred/{owner}/{repo}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/starred' } 
    }
}
Export-ModuleMember Get-GitHubUserStarred

Function Get-GitHubReposStatsParticipation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/stats/participation'
}
Export-ModuleMember Get-GitHubReposStatsParticipation

Function Get-GitHubInstallationRepositories {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'installation/repositories'
}
Export-ModuleMember Get-GitHubInstallationRepositories

Function New-GitHubReposIssuesReactions {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][Int]$issue_number
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/issues/{issue_number}/reactions'
}
Export-ModuleMember New-GitHubReposIssuesReactions

Function Get-GitHubReposGitCommits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$commit_sha
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/git/commits/{commit_sha}'
}
Export-ModuleMember Get-GitHubReposGitCommits

Function Get-GitHubOrgsPersonalaccesstokens {
    [CmdletBinding()]
    param (
        [Int]$page,
        [Int]$per_page,
        [Parameter(Mandatory,Position=0)][String]$org,
        [String[]]$owner,
        [String]$direction,
        [String]$last_used_after,
        [String]$last_used_before,
        [String]$permission,
        [String]$repository,
        [String]$sort
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/personal-access-tokens'
}
Export-ModuleMember Get-GitHubOrgsPersonalaccesstokens

Function Get-GitHubUserBlocks {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0,ParameterSetName='username')][String]$username,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'username' { Invoke-GitHub -PsBP $PsBoundParameters 'user/blocks/{username}' } 
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/blocks' } 
    }
}
Export-ModuleMember Get-GitHubUserBlocks

Function Set-GitHubOrgsTeamsMemberships {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/memberships/{username}'
}
Export-ModuleMember Set-GitHubOrgsTeamsMemberships

Function Remove-GitHubOrgsOutsidecollaborators {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$username
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/outside_collaborators/{username}'
}
Export-ModuleMember Remove-GitHubOrgsOutsidecollaborators

Function Set-GitHubReposEnvironments {
    [CmdletBinding()]
    param (
        [HashTable]$Body,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$environment_name
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/environments/{environment_name}'
}
Export-ModuleMember Set-GitHubReposEnvironments

Function Get-GitHubUserPackagesVersions {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$package_type,
        [Parameter(Mandatory,Position=1)][String]$package_name,
        [Parameter(Mandatory,Position=2,ParameterSetName='package_version_id')][Int]$package_version_id,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][String]$state,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}/versions' } 
        'package_version_id' { Invoke-GitHub -PsBP $PsBoundParameters 'user/packages/{package_type}/{package_name}/versions/{package_version_id}' } 
    }
}
Export-ModuleMember Get-GitHubUserPackagesVersions

Function Get-GitHubReposImportAuthors {
    [CmdletBinding()]
    param (
        [Int]$since,
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/import/authors'
}
Export-ModuleMember Get-GitHubReposImportAuthors

Function Remove-GitHubReposBranchesProtectionRestrictions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo,
        [Parameter(Mandatory,Position=2)][String]$branch
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/branches/{branch}/protection/restrictions'
}
Export-ModuleMember Remove-GitHubReposBranchesProtectionRestrictions

Function Set-GitHubReposAutomatedsecurityfixes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$owner,
        [Parameter(Mandatory,Position=1)][String]$repo
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'repos/{owner}/{repo}/automated-security-fixes'
}
Export-ModuleMember Set-GitHubReposAutomatedsecurityfixes

Function Remove-GitHubOrgsTeamsProjects {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)][String]$org,
        [Parameter(Mandatory,Position=1)][String]$team_slug,
        [Parameter(Mandatory,Position=2)][Int]$project_id
    )
    Invoke-GitHub -PsBP $PsBoundParameters 'orgs/{org}/teams/{team_slug}/projects/{project_id}'
}
Export-ModuleMember Remove-GitHubOrgsTeamsProjects

Function Get-GitHubUsersFollowing {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        [Parameter(Mandatory,Position=0)][String]$username,
        [Parameter(Mandatory,Position=1,ParameterSetName='target_user')][String]$target_user,
        [Parameter(ParameterSetName='Search')][Int]$page,
        [Parameter(ParameterSetName='Search')][Int]$per_page,
        [Parameter(ParameterSetName='Search')][Switch]$GetAll
    )
    Switch ($PsCmdlet.ParameterSetName) {
        'Search' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/following' } 
        'target_user' { Invoke-GitHub -PsBP $PsBoundParameters 'users/{username}/following/{target_user}' } 
    }
}
Export-ModuleMember Get-GitHubUsersFollowing

