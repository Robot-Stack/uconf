#!/bin/bash
# uconf.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/stratum.sh"
source "$ScriptDir/support.sh"

sapth "lsb-release" "dialog"
scheckos "Ubuntu" "21.10"
gcontinueorabort "NaitWatch personal setup script."
supdateall

#Generic terminal/basic programs
sapt "apt-transport-https" "snapcraft" "gdebi-core" "git" "curl" "mc" "ffmpeg"

#Generic UI Tools
sapt "libreoffice" "gimp" "inkscape" "flameshot" 
ssnap "code" "telegram-desktop"

MakeDefaultDirs

wget https://github.com/shiftkey/desktop/releases/download/release-2.9.6-linux1/GitHubDesktop-linux-2.9.6-linux1.deb -O GitHubDesktop-linux-2.9.6-linux1.deb
sudo gdebi -n GitHubDesktop-linux-2.9.6-linux1.deb
rm -f GitHubDesktop-linux-2.9.6-linux1.deb

ReConfigureBashRc
gpause
exit

#https://code.visualstudio.com/docs/setup/linux

#code --install-extension yzhang.markdown-all-in-one
#code --list-extensions --show-versions
#code --list-extensions
#code --uninstall-extension yzhang.markdown-all-in-one

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
