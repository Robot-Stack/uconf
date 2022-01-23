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
gppa "https://packages.microsoft.com/keys/microsoft.asc" "https://packages.microsoft.com/ubuntu/21.10/prod"
gapt "solc" "powershell" # command

#Snap Package manager
gapt "snapcraft" 
gsnap "code" "telegram-desktop" # ui

#NPM Package manager
gapt "nodejs" "npm"
gnpm "ganache-cli@latest" "web3@latest" "http-server@latest" "npx" "yarn" # command

#Gdebi bin packages
gapt "gdebi-core"
sgdebi "github-desktop" #ui
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

#gcodeext "seanwu.vscode-qt-for-python" #Solidity

ReConfigureBashRc
gpause
exit

#https://code.visualstudio.com/docs/setup/linux
#code --list-extensions --show-versions


#notworking
#sapt "openjdk-8-jdk"
#sudo snap install netbeans --classic

: '
sudo apt-get -y update
sudo apt-get -y upgrade
Extracting templates from packages: 100%
setting xserver-xorg-legacy/xwrapper/allowed_users from configuration file
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y update
sudo apt-get -y install apt-transport-https >/dev/null
sudo apt-get -y install snapcraft >/dev/null
sudo apt-get -y install gdebi-core >/dev/null
sudo apt-get -y install git >/dev/null
sudo apt-get -y install curl >/dev/null
sudo apt-get -y install mc >/dev/null
sudo apt-get -y install ffmpeg >/dev/null
Extracting templates from packages: 100%
sudo apt-get -y install libreoffice >/dev/null
Extracting templates from packages: 100%
sudo apt-get -y install gimp >/dev/null
sudo apt-get -y install inkscape >/dev/null
Extracting templates from packages: 100%
sudo apt-get -y install flameshot >/dev/null
sudo snap install --classic code >/dev/null
sudo snap install --classic telegram-desktop >/dev/null
Warning: flag --classic ignored for strictly confined snap telegram-desktop

export PATH=$PATH:/home/valgrind/uconf to /home/valgrind/.bashrc
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