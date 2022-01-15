#!/bin/bash
# main.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/stratum.sh"
source "$ScriptDir/support.sh"



sapth "lsb-release" "dialog"
CheckOs2 "Ubuntu" "21.04"
ContinueOrAbort

gaptgetupdate
gaptgetupgrade
gaptgetupdate
gaptgetdistupgrade
gaptgetupdate

sapt "apt-transport-https" "git" "curl" "mc"

ReConfigureBashRc


gpause


#code --install-extension yzhang.markdown-all-in-one
#code --list-extensions --show-versions
#code --list-extensions
#code --uninstall-extension yzhang.markdown-all-in-one