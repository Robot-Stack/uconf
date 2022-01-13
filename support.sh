#!/bin/bash
# support.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

function spause()
{
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}


