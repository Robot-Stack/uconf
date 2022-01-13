#!/bin/bash
# support.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

function ReConfigureBashRc()
{
    echo "export PATH=\$PATH:$ScriptDir to $HOME/.bashrc"
    AppendStringOnce "export PATH=\$PATH:$ScriptDir" "$HOME/.bashrc"
}

function CheckOsVer()
{
    version=$(gdisplayosver)
    if [ "$version" = "$1" ]; then
        echo "$version checked (ok)"
    else
        echo "This script is dedicated for version $1 only. (abort)"
        exit
    fi
}

function CheckOs()
{
    os=$(gdisplayos)
    if [ "$os" = "$1" ]; then
        echo "$os checked (ok)"
    else
        echo "This script is dedicated for $1 only. (abort)"
        exit
    fi
}