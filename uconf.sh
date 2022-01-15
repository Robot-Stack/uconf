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

sapt "apt-transport-https" "git" "curl" "mc" "flameshot"

ReConfigureBashRc


gpause
#code --install-extension yzhang.markdown-all-in-one
#code --list-extensions --show-versions
#code --list-extensions
#code --uninstall-extension yzhang.markdown-all-in-one
