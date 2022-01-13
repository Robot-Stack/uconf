#!/bin/bash
# uconf.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
wget -q --no-cache --no-cookies  -O $ScriptDir/generic.sh https://raw.githubusercontent.com/GrindWhale/uconf/main/generic.sh
wget -q --no-cache --no-cookies  -O $ScriptDir/support.sh https://raw.githubusercontent.com/GrindWhale/uconf/main/support.sh
wget -q --no-cache --no-cookies  -O $ScriptDir/uconf.sh https://raw.githubusercontent.com/GrindWhale/uconf/main/main.sh
chmod +x "$ScriptDir/uconf.sh"
bash "$ScriptDir/uconf.sh"