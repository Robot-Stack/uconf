#!/bin/bash
# main.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/support.sh"

sudo apt-get -y install "lsb-release" "dialog" >/dev/null
clear
echo "NaitWatch personal setup script."
CheckOs2 "Ubuntu" "21.04"
ContinueOrAbort

gaptgetupdate
gaptgetupgrade
gaptgetupdate
gaptgetdistupgrade
gaptgetupdate

gaptgetyim "apt-transport-https" "git" "curl" "mc"

ReConfigureBashRc


gpause

