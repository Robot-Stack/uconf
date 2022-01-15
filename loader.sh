#!/bin/bash
# uconf.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
wget -q --no-cache --no-cookies  -O $ScriptDir/LICENSE https://raw.githubusercontent.com/NaitWatch/uconf/main/LICENSE
wget -q --no-cache --no-cookies  -O $ScriptDir/README.md https://raw.githubusercontent.com/NaitWatch/uconf/main/README.md
wget -q --no-cache --no-cookies  -O $ScriptDir/generic.sh https://raw.githubusercontent.com/NaitWatch/uconf/main/generic.sh
wget -q --no-cache --no-cookies  -O $ScriptDir/support.sh https://raw.githubusercontent.com/NaitWatch/uconf/main/support.sh
wget -q --no-cache --no-cookies  -O $ScriptDir/uconf.sh https://raw.githubusercontent.com/NaitWatch/uconf/main/uconf.sh
chmod +x "$ScriptDir/uconf.sh"
bash "$ScriptDir/uconf.sh"