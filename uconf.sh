#!/bin/bash
# uconf.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/stratum.sh"
source "$ScriptDir/support.sh"

#Install confirmation script requirements
gapt "lsb-release" "dialog"
scheckos "Ubuntu" "21.10"
gcontinueorabort "NaitWatch personal setup script."
MakeDefaultDirs
gup

#Install script requirements
gapt "apt-transport-https" "wget" "gdebi-core"

#Apt Package manager (main,universe,restricted,multiverse)
gapt "git" "curl" "mc" "ffmpeg" "solc" "python3" "python-is-python3" # command
gapt "libreoffice" "gimp" "inkscape" "flameshot" "qttools5-dev-tools" "qttools5-dev" # ui

#Apt Package manager (custom)
gppa "ppa:ethereum/ethereum"
gapt "solc" # command

#Snap Package manager
gapt "snapcraft" 
gsnapc "powershell" # command
gsnapc "gitkraken" "code" "telegram-desktop" #ui
gsnap "vlc" #ui

#NPM Package manager
gapt "nodejs" "npm"
gnpm "ganache-cli" "web3@latest" "http-server@latest" "npx" "yarn" # command

#Gdebi bin packages
gapt "gdebi-core"
sgdebi "remix-ide" #ui

#Python pip package manager
gapt "python3-pip"
gpip "pyside6"

#Visual Studio Code extensions
gcodeext "ms-python.python" #Python
gcodeext "ms-python.vscode-pylance" #Pylance
gcodeext "ms-vscode.powershell" #Powershell
gcodeext "yzhang.markdown-all-in-one" #Markdown preview
gcodeext "axosoft.gitkraken-glo" #GitKraken boards
gcodeext "eamodio.gitlens" #GitLens
gcodeext "juanblanco.solidity" #Solidity

#gcodeext "seanwu.vscode-qt-for-python"

ReConfigureBashRc
gpause
exit


#notworking
#sapt "openjdk-8-jdk"
#sudo snap install netbeans --classic

: '

'

:'Fresh install steps
-install virtualbox guest addtions
-enable clipboard bidirectional
-connect online accounts (google)
-login gmail in firebox
-login firebox sync
-login github
-login discord
launch https://github.com/NaitWatch/uconf
'