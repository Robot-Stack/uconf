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
    echo "apt-get -y update >/dev/null"
    sudo apt-get -y update >/dev/null
}

gaptgetupgrade()
{
    echo "apt-get -y upgrade >/dev/null"
    sudo apt-get -y upgrade >/dev/null
}

gaptgetdistupgrade()
{
    echo "apt-get -y dist-upgrade >/dev/null"
    sudo apt-get -y dist-upgrade >/dev/null
}

gdoreleaseupgrade()
{
    Replace "/etc/update-manager/release-upgrades" "Prompt=lts" "Prompt=normal"
    echo "do-release-upgrade -f DistUpgradeViewNonInteractive >/dev/null"
    sudo do-release-upgrade -f DistUpgradeViewNonInteractive >/dev/null
}


gaptgetyi()
{
    #stdout and stderr to null              >/dev/null 2>&1
    #stdout to null                         >/dev/null
    echo "apt-get -y install $1  >/dev/null"
    sudo apt-get -y install $1  >/dev/null
}

gaptgetyim()
{
    for arg; do
        gaptgetyi "$arg"
    done
}



#$str="GenFiltEff=7.092200e-01"
#$value=${str#*=}


#str=$(lsb_release -r);str="${str#*:}"";str="${str#"${str%%[![:space:]]*}"}";echo "$str"

#
