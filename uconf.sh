#!/bin/bash
# main.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/support.sh"


gaptgetyim "lsb-release"
CheckOs "Ubuntu"
CheckOsVer "21.04"



gaptgetupdate
gaptgetupgrade
gaptgetupdate
gaptgetdistupgrade
gaptgetupdate
gaptgetupgrade
gaptgetupdate
gdoreleaseupgrade

gaptgetyim "apt-transport-https" "git" "curl" "mc"

ReConfigureBashRc




gpause

