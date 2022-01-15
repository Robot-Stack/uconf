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

CommandOptionLoop()
{
    local arrVar=()
    #function parameters to bash array
    for arg; do
        arrVar+=("$arg")
    done
    #first element to option
    local command=${arrVar[0]}
    local option=${arrVar[1]}
    #remove first element
    arrVar=("${arrVar[@]:1}")
    arrVar=("${arrVar[@]:1}")

    #loop over the array
    for i in "${arrVar[@]}"
    do
        $command "$option" "$i"
    done
}

CommandLoop()
{
    local arrVar=()
    #function parameters to bash array
    for arg; do
        arrVar+=("$arg")
    done
    #first element to option
    local command=${arrVar[0]}
    
    #remove first element
    arrVar=("${arrVar[@]:1}")

    #loop over the array
    for i in "${arrVar[@]}"
    do
        $command "$i"
    done
}

gapt()
{
    if [ "$1" = "normal" ] ; then
        sudo apt-get -y install $2
    elif [ "$1" = "stderr only" ] ; then
        sudo apt-get -y install $2 >/dev/null
    elif [ "$1" = "verbose stderr" ] ; then
        echo "sudo apt-get -y install $2 >/dev/null"
        sudo apt-get -y install $2 >/dev/null
    elif [ "$1" = "hidden stderr" ] ; then
        sudo apt-get -y install $2 >/dev/null
    elif [ "$1" = "hidden null" ] ; then
        sudo apt-get -y install $2 >/dev/null 2>&1
    else
        echo "Dryrun: $2"
    fi
}

gcheckapt()
{
    local test="$2"
    local str=$(apt --installed list 2>/dev/null | grep "^$test/.*")
    str="${str%/*}"

    if [ "$2" != "$str" ] ; then
        if [ "$1" = "hidden" ] ; then
            gapt "hidden stderr" "$2"
        elif [ "$1" = "show" ] ; then
            gapt "verbose stderr" "$2"
        else
            gapt "verbose stderr" "$2"
        fi
    else
        if [ "$1" = "show" ] ; then
        gpecho "60" " " "Package: " "$2" "(is installed)"
        fi
    fi
}

gpecho()
{
    paddwidth="$1"
    paddchar="$2"
    prefix="$3"
    dynamic="$4"
    suffix="$5"
    padding=$(printf %$paddwidth\s |tr " " "$paddchar")
    mix="$prefix$dynamic"
    result=$(printf "%s%s %s\n" "$mix" "${padding:${#mix}}" "$suffix")
    echo "$result"
}