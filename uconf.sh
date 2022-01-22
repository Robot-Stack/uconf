#!/bin/bash
# uconf.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/stratum.sh"
source "$ScriptDir/support.sh"

gapt "lsb-release" "dialog"
scheckos "Ubuntu" "21.10"
gcontinueorabort "NaitWatch personal setup script."
MakeDefaultDirs
gup

#Generic terminal/basic programs
sudo add-apt-repository --yes ppa:ethereum/ethereum >/dev/null
sudo apt-get update >/dev/null

gapt "wget" "apt-transport-https" "snapcraft" "gdebi-core" "git" "curl" "mc" "ffmpeg" "nodejs" "npm" "solc" "python3" "python3-pip" "python-is-python3"
gnpm "ganache-cli@latest" "web3@latest" "http-server@latest" "npx" "yarn"


#Generic UI Tools
gapt "libreoffice" "gimp" "inkscape" "flameshot" 
gsnap "code" "telegram-desktop"
sgdebi "github-desktop"
sgdebi "remix-ide"

code --install-extension yzhang.markdown-all-in-one >/dev/null #Markdown preview extension
code --install-extension axosoft.gitkraken-glo #GitKraken boards extension
code --install-extension eamodio.gitlens #GitLens boards extension

code --install-extension ms-python.python #Python extension for Visual Studio Code
:'
#creating python ui quick
sudo pip install pyside6

ms-python.vscode-pylance
ms-python.python
ms-vscode.powershell

seanwu.vscode-qt-for-python

sudo apt-get install qttools5-dev-tools
sudo apt-get install qttools5-dev
'

code --install-extension juanblanco.solidity >/dev/null



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