# OpenApi-To-PowerShell
Human readable OpenApi to PowerShell Module Code Generator
I couldn't find a convertor that was easy to use, and generated code that wasn't readable, so I decided to create my own
Requirements :
* Powershell 6 or 7

# Creating a module in few steps
* Copy your `myproject.json` open api specification file into the `Projects` Folder
* Run the command `ConvertProject.ps1 MyProjectName -GenerateMainModule`
* Retrieve your module in the Output folder :
  * `MyProject.ps1` : The volatile file that contains all the specifications. You shouldn't modify this one
  * `MyProject.ps1m` : The module file that you will want to modify
  * `MyProject.ps1d` : The manifest file that is required

Almost done, you need to edit the `MyProject.ps1m` and sort out the authentication. This is not yet automated. Initially, the module will work if the API is using bearer token. You will need to change it if it is using another authenticating mechanism.

# Information about how to work with those files
* The `.ps1` file is meant to be volatile. You should try not to make any modification in it. The idea is that if a new version of the API comes out, you can simply run this script again, and done ! It's updated.
* If you have an Open API `.yml` file, you will need to convert it to a `.json` file. Many online convertors exist. Powershell does not have built-in conversion tools.
* The `.json` file in the *Projects*  need to have the same name as your project
* All files you need are in the *Output* folder

# About authentication
There are so many different authentication mechanism out there, that best is have you sort this out.
You will need to modify your psm1 file until it works. Please remember that after modifying a module file, you need to reload the module with a -force swith `import-module MyProject -force`

# How to use the generated module ?
* Load the module `import-module mymodule`
* Load your credentials to the module : `initialize-MyProject -Credential $Credential`
  * Where `$Credential` is a PsCredential Object

# Customize your project and the output commands
Before customizing, let's agree on how we name things.
* Powershell functions : `Get-MyProjectMyAction`
  * `Get` is the **verb**
  * `MyProjectMyAction` is the **Noun**
* An API Call : `get` on `api\v1\myApiPath\Function1\Function2`
  * `get` is the web request **Method**
  * `api\v1\myApiPath\Function1\Function2` is the **Function**
  * `Function2` is the **Last Function**

Understanding the above will help you understand the below

The converter offers different switches to help you dress up your commands
* *LastFunctionToVerb* : a hash table that will convert the verb depending on the Last Function
  * Example : `@{ disable = "Disable" }`
  * Will convert as example : `Set-MyProjectActionDisable` to `Disable-MyProjectAction`
* *FunctionRename* : Will map new names to generated functions
  * Exmaple : `@{ New-MyProjectSomeThing = "Start-MyProjectSomething" }`
* *AdditionalSwitches* : Will add additional parameters depending on an existing parameter
  * Exmaple : `@{ page = @{ GetAll = @{ Type = "Switch"  ; Parameter = @() }} }`
  * Will add a GetAll variable each time the variable page is possible

# This project is still at an early stage
At the moment, this project will create all the functions required to convert open API projects to a list of powershell commands.
There is already a list of improvements that I can think of :
* So many different OpenApi specifications, some may not yet be implemented
* No help file generated, but this might come


# Examples :
You will find in the examples folder some examples containing :
* The **Downloaded** initial json file
* The **Manually Buit** Generated.ps1 file which are the commands used to build the actual project
* A **Manually Buit** generate.ps1 file that contains the used switches to generate the file
* A **Automated Buit** .ps1d manifest file
* The **manually Buit** .psm1 file
* And finally the **Generated** .ps1 file that contains all the functions

Yes, the main file has to be manually buit, this function will come. At the moment, you need to copy paste / adapt to your need what is there

# Credential examples
* Github
  * Generate a token : https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
  * Store it in a credential object where the username can be anything, and the password is the token value, please check below example
    * `$Cred = Get-Credential -Message "Please Enter your github token now" -UserName Anything`
    * `Initialize-GitHub -credential $Cred`
  * You can thereafter run any command you like

# Real case senarios
## JiraCloud v3
1. Download from Jira the Open API descriptor of the v3 of Jira Cloud to the projects folder
2. Run `.\ConvertProject.ps1 -ProjectName JiraCloud -FunctionRenamePattern @{ "RestApi3" = "" } -GenerateMainModule`
Done ! But JiraCloud is full of renaming patters. You can use instead the JiraCloud.psm1 file I have created for JiraCloud in the `Examples\JiraCloud` folder. The ps1m file contains some specific data in the `Format-JiraCloud` section. You might want to change the `switch -Regex ($Type)` section.

**How to use the module** :
```
# Load the module
Import-Module .\JiraCloud.psd1 -force

# Set the credentials and the portal you are using ($Cred is a PsCredential object)
Initialize-JiraCloud -Credential $cred -EndPoint My-jira.atlassian.net

# Do a JQL search
Search-JiraCloud -jql "type = 'Epic'" -maxResults 1

# Get an issue
Get-JiraIssue XXXX-1234`
```

## Cisco Secure Endpoint API
1. Download all the yaml file fir the v1 API from [The Cisco API reference Guide](https://developer.cisco.com/docs/secure-endpoint/auditlog/)
2. Convert all the .yaml files to .json files
  * You can use many  online converters
  * Or you can install the powershell-yaml module (`install-module powershell-yaml`) and convert them this way (this will also change the name of the files by starting them with the required `AMP1`)
    * `dir *.yaml | % { $_ | get-content |  ConvertFrom-Yaml | ConvertTo-Json -Depth 20 | out-file ("AMP1_" +  ($_.name -replace "yaml","json") )`
3. Copy the .json files (all filenames should be starting by `AMP1` and ending with the `.json` file extension) to the **\Projects** folder
4. All Set, you are ready to generate the module :
```
.\ConvertProject.ps1 -ProjectName Amp1 -MultipleFiles -AdditionalParameters  @{
  limit = @{
        offset = @{ Type = "BigInt"  ; Parameter = @() }
    }
  } -FunctionRenamePattern @{ "Amp1V1" = "Amp1" } -GenerateMainModule
```
  * *ProjectName* is the mandatory variable to filter the correct .json inputs
  * *MultipleFiles* is required for this API as we have multiple json files for this API
  * *AdditionalParameters* this API is missing some commands. In case an API function has a `limit` variable, I want to make sure the `offset` variable
  * *FunctionRenamePattern* All the functions will start with `Amp1v1`. I don't care about the V1, so I want to remove it. This will change any  `Amp1v1` to  `Amp1`
  * *GenerateMainModule* will generate the psm1 and psd1 files

* Done ! in the \Output folder, you should now have 3 AMP1 files (ps1/psm1/psd1)
```
Import-module \output\Amp1.psd1

# Next, tell the API which credential to use (you will be prompted for username/password, which should look like 1a2b3333cccc4444dddd/1a2b33cc-1a2b-1a2b-1a2b33cc)
Initialize-Amp1 -Credential  (get-credential)

# Done, you can now run any command such as :
Get-Amp1Computers
```
* Final Note : I improved the generated API, you can find the modified ps1m file under /Examples/Amp1

# FAQ
## Why do I have a strange variable ending with an `X` (example : hostX)
* Some variables are belonging to the Powershell system, and can't/shouldn't be used. You can easily find more  if you search for **about_Automatic_Variables** that will explain you why our script can't use those. Those variables HAD to be renamed, and adding an X is a way to get around this issue. Don't worry, the query will make the correct API call. You can safely ignore the trailing X.

