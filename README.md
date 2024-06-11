# OpenApi-To-PowerShell
Human readable OpenApi to PowerShell Module Code Generator
I couldn't find a convertor that was easy to use, and generated code that wasn't readable, so I decided to create my own
Requirements :
* Powershell 6 or 7

# Creating a module in few steps
* Copy your `myproject.json` open api specification file into the `Projects` Folder
* Run the command `ConvertProject.ps1 MyProjectName -GenerateMainModule`
* Retrieve your module in the Output folder :
  * `MyProject.ps1` : The volatile file that contains all the specifications
  * `MyProject.ps1m` : The module file that you will want to improve
  * `MyProject.ps1d` : The manifest file that is required

Almost done, you need to edit the `MyProject.ps1m` and sort out the authentication. This is not yet automated. The generated file will be ready in case you are using a token, but there are many different authentication mechanism out there, and you may have to adapt the module file.

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