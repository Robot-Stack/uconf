#!/bin/bash
# main.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/support.sh"

gaptgetupdate
gaptgetupgrade
gaptgetupdate
gaptgetdistupgrade
gaptgetupdate
gaptgetupgrade
gaptgetupdate
gdoreleaseupgrade

gaptgetyim "apt-transport-https" "lsb-release" "git" "curl" "mc"

ReConfigureBashRc




gpause

