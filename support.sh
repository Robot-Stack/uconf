#!/bin/bash
# support.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

function spause()
{
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}

function ReConfigureBashRc()
{
    echo "export PATH=\$PATH:$ScriptDir to $HOME/.bashrc"
    AppendStringOnce "export PATH=\$PATH:$ScriptDir" "$HOME/.bashrc"
}

