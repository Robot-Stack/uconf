#!/bin/bash
# main.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"
source "$ScriptDir/generic.sh"
source "$ScriptDir/support.sh"

ReConfigureBashRc

gaptgetyim "terminator"

spause
gpause

