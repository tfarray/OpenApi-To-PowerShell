# OpenApi-To-PowerShell
Human readable OpenApi to PowerShell Module Code Generator
I couldn't find a convertor that was easy to use, and generated code that wasn't readable, so I decided to create my own
Requirements :
* Powershell 6 or 7

# How to create a module
* If you have a yml file, convert it to a json file. Many convertors exist on the web
* copy the .json file to the Projects Directory, and name the file the exact name of your project
* Run the command `ConvertProject.ps1 MyProjectName` (which should also be the json file name)
* Find the .ps1 file in the output folder
* Build your own functions using the examples :
  * invoke-MyProject
  * initialize-MyProject

# Customize your project
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
* LastFunctionToVerb : a hash table that will convert the verb depending on the Last Function
  * Example : `@{ disable = "Disable" }`
  * Will convert as example : Set-MyProjectActionDisable to Disable-MyProjectAction
* FunctionRename : Will map new names to generated functions
  * Exmaple : `@{ New-MyProjectSomeThing = "Start-MyProjectSomething" }`
* AdditionalSwitches : Will add additional parameters depending on an existing parameter
  * Exmaple : `@{ page = @{ GetAll = @{ Type = "Switch"  ; Parameter = @() }} }`
  * Will add a GetAll variable each time the variable page is possible

# This project is still at an early stage
At the moment, this project will create all the functions required to convert open API projects to a list of powershell commands.
YES : This is not perfect, and you may encounter bug
YES : This does not yet automatically create module files, but just a .ps1 file which needs to be incorporated to a module
YES : There is not yet the invoke-PROJECT commands
YES : The help file is not yet generated, but this might come


#