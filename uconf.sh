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



ReConfigureBashRc
gpause

#https://code.visualstudio.com/docs/setup/linux

#code --install-extension yzhang.markdown-all-in-one
#code --list-extensions --show-versions
#code --list-extensions
#code --uninstall-extension yzhang.markdown-all-in-one

#notworking
#sapt "openjdk-8-jdk"
#sudo snap install netbeans --classic
