#!/bin/bash
# main.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/support.sh"

AptInstallIfNeededm "lsb-release" "dialog"
CheckOs2 "Ubuntu" "21.04"
ContinueOrAbort

gaptgetupdate
gaptgetupgrade
gaptgetupdate
gaptgetdistupgrade
gaptgetupdate

AptInstallIfNeededm "apt-transport-https" "git" "curl" "mc"

ReConfigureBashRc


gpause


