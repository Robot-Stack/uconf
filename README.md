# uconf


## Description
uconf is personal setup script to for Ubuntu with the required software for me.
I just upped it here to have it quickly availible.
The generic.sh file can contain something intresting e.g. gcheckapt() which checks for already installed packages without just bruteforce installing them.

## How to start
Copy & Paste friendly version for terminal.
The loader copies all files to $HOME/uconf directory and than executes uconf.sh

```bash
v=$HOME/uconf;mkdir -p $v; wget -q --no-cache --no-cookies -O $v/loader.sh https://raw.githubusercontent.com/NaitWatch/uconf/main/loader.sh && bash $v/loader.sh
```
```Batchfile
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NaitWatch/uconf/main/LICENSE','C:\temp\license')"
```

Bash and Cmd compatible powershell command:
```
echo "$(state=`apt --installed list 2>/dev/null | grep "^powershell/.*installed"` ;scmp="${state%/*}";if [ "$scmp" != "powershell" ]; then sudo apt-get update ; sudo apt-get install -y wget apt-transport-https software-properties-common ; wget -q -nc https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb ; sudo dpkg -i packages-microsoft-prod.deb ; sudo apt-get update ; rm -f packages-microsoft-prod.deb; sudo apt-get install -y powershell ; fi; pwsh -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NaitWatch/uconf/main/helloworld.ps1','helloworld.ps1')" )"; pwsh helloworld.ps1; echo && powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NaitWatch/uconf/main/helloworld.ps1','%userprofile%\helloworld.ps1')" 2>err.log && del err.log && powershell -ExecutionPolicy UnRestricted "%userprofile%/helloworld.ps1"
```

*Italic*

**Bold**

**_Italicold_**

This  looks great :wink:



### oiii

Tag: `Sample: Done` `Wiki: Done`

[Visual Studio Community 2019](https://visualstudio.microsoft.com/) (Workloads: Managed Desktop, Native Desktop)

[Visual Studio Code](https://code.visualstudio.com/)

# Quicklinks 
[Markdown Guide](https://www.markdownguide.org)

[Github basic-writing](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

[Github emoji-cheat-sheet](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)


[Azure DevOps Services REST API 6.0](https://docs.microsoft.com/en-us/rest/api/azure/devops/git/?view=azure-devops-rest-6.0)

[Stackoverflow](https://www.stackoverflow.com)

[Visual Studio Image Library](https://www.microsoft.com/en-us/download/details.aspx?id=35825)


# Introduction 
# Getting Started
## Installation process
## File/Folder description
## Points of interest
# Software dependencies
