#!/bin/bash
# support.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

function ReConfigureBashRc()
{
    echo "export PATH=\$PATH:$ScriptDir to $HOME/.bashrc"
    AppendStringOnce "export PATH=\$PATH:$ScriptDir" "$HOME/.bashrc"
}

function MakeDefaultDirs()
{
    mkdir -p "$HOME/Documents/GitHub"
}


