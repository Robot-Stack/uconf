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

function CheckOs2()
{
    os=$(gdisplayos)
    version=$(gdisplayosver)
    local ok=
    if [ "$os" = "$1" ] && [ "$version" = "$2" ]; then
        echo "$os $version checked (ok)"
    else
        echo "Expected $1 $2 found $os $version. (abort)"
    fi
}

function ContinueOrAbort()
{
    exec 3>&1
    selection=$(dialog \
        --backtitle "WARNING!!!" \
        --title "Menu" \
        --clear \
        --cancel-label "Exit" \
        --menu "WARNING!!! This script can damage your system. Use on your own risk." 20 40 4 \
        "A" "Abort" \
        "C" "Continue" \
        2>&1 1>&3)
    exitcode=$?
    exec 3>&-
    echo $selection $exitcode

    if [ "$selection" != "C" ] ; then
        clear
        echo "Aborted."
        exit
    fi
    clear
}