# OpenApi-To-PowerShell
Human readable OpenApi to PowerShell Module Code Generator
I couldn't find a convertor that was easy to use, and generated code that wasn't readable, so I decided to create my own
Requirements :
* Powershell 6 or 7

# Step 1 : Create the .ps1 file
Note : The `.ps1` file is meant to be volatile. You should try not to make any modification in it. The idea is that if a new version of the API comes out, you can simply run the instruction again to update it.
* If you have a `.yml` file, convert it to a `.json` file. Many online convertors exist.
* copy the `.json` file to the *Projects* Directory, and name the file the exact name of your project
* Run the command `ConvertProject.ps1 MyProjectName` (which should also be the name of the `.json` file)
* Find the `.ps1` file in the *Output* folder

# Step 2 : Create the .ps1m (and .ps1d) files
As the `.ps1` file contains all the commands that you will be doing, the `.ps1m` should contain 2 functions that will do all the API calls :
* `invoke-MyProject`
* `initialize-MyProject`
This code is not yet generated, and you will need to get inspired by the examples that are in this repository.
Only once, you will need to create a manifest file. There is a built in command that will do it for you, example :
* `New-ModuleManifest -Path E:\OpenApi-To-PowerShell\Examples\GitHub\GitHub.psd1 -Author OpenApi-To-PowerShell -NestedModules GitHub.ps1 -CmdletsToExport * -FunctionsToExport * -VariablesToExport * -AliasesToExport *`

# How to use the new module ?
* Load the module `import-module mymodule`
* Load your credentials to the module : `initialize-MyProject -Credential $Credential`
  * Where `$Credential` is a PsCredential Object
* Done ! You should be able to use any commands

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
* YES : This is not perfect, and you may encounter bug
* YES : This does not yet automatically create module files, but just a .ps1 file which needs to be incorporated to a module
* YES : There is not yet the invoke-PROJECT commands
* YES : The help file is not yet generated, but this might come


# Examples :
You will find in the examples folder some examples containing :
* The **Downloaded** initial json file
* The **Manually Buit** Generated.ps1 file which are the commands used to build the actual project
* A **Manually Buit** generate.ps1 file that contains the used switches to generate the file
* A **Automated Buit** .ps1d manifest file
* The **manually Buit** .psm1 file
* And finally the **Generated** .ps1 file that contains all the functions

Yes, the main file has to be manually buit, this function will come. At the moment, you need to copy paste / adapt to your need what is there

