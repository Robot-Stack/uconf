#!/bin/bash
# generic.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

function gpause()
{
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}

function AppendStringOnce()
{
    grep -qxF "$1" $2 || echo "$1" >> $2
}

function Replace()
{
    sudo sed -i -e "s/$2/$3/g" $1
}

function gLTrim()
{
    local str=$1
    str="${str#"${str%%[![:space:]]*}"}"
    echo "$str"
}

function gRTrim()
{
    local str=$1
    str="${str%"${str##*[![:space:]]}"}"  
    echo "$str"
}

function gTrim()
{
    local str=$(gRTrim "$(gLTrim "$1")")
    echo "$str"
}

function gdisplayos()
{
    local str=$(lsb_release -i)
    str="${str#*:}"
    str="${str#"${str%%[![:space:]]*}"}"
    str="${str%"${str##*[![:space:]]}"}"  
    echo "$str"
}

function gdisplayosver()
{
    local str=$(lsb_release -r)
    str="${str#*:}"
    str="${str#"${str%%[![:space:]]*}"}"
    str="${str%"${str##*[![:space:]]}"}"  
    echo "$str"
}

gaptgetupdate()
{
    sudo apt-get -y update
}

gaptgetupgrade()
{
    sudo apt-get -y upgrade
}

gaptgetdistupgrade()
{
    sudo apt-get -y dist-upgrade
}

gdoreleaseupgrade()
{
    Replace "/etc/update-manager/release-upgrades" "Prompt=lts" "Prompt=normal"
    sudo do-release-upgrade -f DistUpgradeViewNonInteractive
    sudo apt-get -y autoremove
    sudo apt-get -y update
    sudo apt --fix-broken install
    sudo apt-get -y update
}


gaptgetyi()
{
    #stdout and stderr to null              >/dev/null 2>&1
    #stdout to null                         >/dev/null
    sudo apt-get -y install $1
}

gaptgetyi2()
{
    #stdout and stderr to null              >/dev/null 2>&1
    #stdout to null                         >/dev/null
    sudo apt-get -y install $1
}

gaptgetyim()
{
    for arg; do
        gaptgetyi "$arg"
    done
}

AptInstallIfNeeded()
{
    local test="$1"
    local str=$(apt --installed list 2>/dev/null | grep "^$test/.*")
    str="${str%/*}"

    if [ "$1" = "$str" ] ; then
        echo "Skipping: apt-get -y install $1 >/dev/null"
    else
        echo "Executeing: apt-get -y install $1 >/dev/null"
        sudo apt-get -y install $1 >/dev/null
    fi
}

AptInstallIfNeededm()
{
    for arg; do
        AptInstallIfNeeded "$arg"
    done
}
