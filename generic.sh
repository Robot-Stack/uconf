#!/bin/bash
# generic.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')" #asdasd

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

gdistupgrade()
{
    if [ "$1" = "normal" ] ; then
        sudo apt-get -y dist-upgrade
    elif [ "$1" = "stderr only" ] ; then
        sudo apt-get -y dist-upgrade >/dev/null
    elif [ "$1" = "verbose stderr" ] ; then
        echo "sudo apt-get -y dist-upgrade"
        sudo apt-get -y dist-upgrade >/dev/null
    elif [ "$1" = "hidden stderr" ] ; then
        sudo apt-get -y dist-upgrade >/dev/null
    elif [ "$1" = "hidden null" ] ; then
        sudo apt-get -y dist-upgrade >/dev/null 2>&1
    else
        echo "Dryrun: $2"
    fi
}

gupgrade()
{
    if [ "$1" = "normal" ] ; then
        sudo apt-get -y upgrade
    elif [ "$1" = "stderr only" ] ; then
        sudo apt-get -y upgrade >/dev/null
    elif [ "$1" = "verbose stderr" ] ; then
        echo "sudo apt-get -y upgrade"
        sudo apt-get -y upgrade >/dev/null
    elif [ "$1" = "hidden stderr" ] ; then
        sudo apt-get -y upgrade >/dev/null
    elif [ "$1" = "hidden null" ] ; then
        sudo apt-get -y upgrade >/dev/null 2>&1
    else
        echo "Dryrun: $2"
    fi
}

gupdate()
{
    if [ "$1" = "normal" ] ; then
        sudo apt-get -y update
    elif [ "$1" = "stderr only" ] ; then
        sudo apt-get -y update >/dev/null
    elif [ "$1" = "verbose stderr" ] ; then
        echo "sudo apt-get -y update"
        sudo apt-get -y update >/dev/null
    elif [ "$1" = "hidden stderr" ] ; then
        sudo apt-get -y update >/dev/null
    elif [ "$1" = "hidden null" ] ; then
        sudo apt-get -y update >/dev/null 2>&1
    else
        echo "Dryrun: $2"
    fi
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
        if [ "$1" = "hidden stderr" ] ; then
            gapt "hidden stderr" "$2"
        elif [ "$1" = "verbose stderr" ] ; then
            gapt "verbose stderr" "$2"
        else
            gapt "verbose stderr" "$2"
        fi
    else
        if [ "$1" = "verbose stderr" ] ; then
        gpecho "60" " " "Package: " "$2" "(is installed)"
        fi
    fi
}

gpecho()
{
    local paddwidth="$1"
    local paddchar="$2"
    local prefix="$3"
    local dynamic="$4"
    local suffix="$5"
    local padding=$(printf %$paddwidth\s |tr " " "$paddchar")
    local mix="$prefix$dynamic"
    local result=$(printf "%s%s %s\n" "$mix" "${padding:${#mix}}" "$suffix")
    echo "$result"
}

gcontinueorabort()
{
    exec 3>&1
    local selection=$(dialog \
        --backtitle "$1" \
        --title "Menu" \
        --clear \
        --cancel-label "Exit" \
        --menu "WARNING!!! This script can damage your system. Use on your own risk." 20 40 4 \
        "A" "Abort" \
        "C" "Continue" \
        2>&1 1>&3)
    local exitcode=$?
    exec 3>&-
    echo $selection $exitcode

    if [ "$selection" != "C" ] ; then
        clear
        echo "Aborted."
        exit
    fi
    clear
}

gsnap()
{
    if [ "$1" = "normal" ] ; then
        sudo snap install --classic $2
    elif [ "$1" = "stderr only" ] ; then
        sudo snap install --classic $2 >/dev/null
    elif [ "$1" = "verbose stderr" ] ; then
        echo "sudo snap install --classic $2 >/dev/null"
        sudo snap install --classic $2 >/dev/null
    elif [ "$1" = "hidden stderr" ] ; then
        sudo snap install --classic $2 >/dev/null
    elif [ "$1" = "hidden null" ] ; then
        sudo snap install --classic $2 >/dev/null 2>&1
    else
        echo "Dryrun: $2"
    fi
}

gchecksnap()
{
    local test="$2"
    local str=$(snap list 2>/dev/null  | grep "^$test .*")
    str="${str%% *}"
    

    if [ "$2" != "$str" ] ; then
        if [ "$1" = "hidden stderr" ] ; then
            gsnap "hidden stderr" "$2"
        elif [ "$1" = "verbose stderr" ] ; then
            gsnap "verbose stderr" "$2"
        else
            gsnap "verbose stderr" "$2"
        fi
    else
        if [ "$1" = "verbose stderr" ] ; then
        gpecho "60" " " "Package: " "$2" "(is installed)"
        fi
    fi
}

ggetdebpackname()
{
    local packagename=$(packagename=$(dpkg --info "$1" | grep "Package:");echo ${packagename##*:})
    echo "$packagename"
}

ggdebi()
{
    local url="$1"
    local filename=$(url="$1"; echo "${url##*/}")
    local targetdir="$HOME/Downloads"
    local output="$targetdir/$filename"

    mkdir -p "$targetdir" >/dev/null

    if [ ! -f "$output" ]; then
        wget -q --no-cache --no-cookies "$url" -O "$output" >/dev/null
    fi

    if [ -f "$output" ]; then
            local packagename=$(ggetdebpackname "$output")
            local str=$(apt --installed list 2>/dev/null | grep "^$packagename/.*")
            str="${str%/*}"
            if [ "$packagename" != "$str" ] ; then
                echo "sudo gdebi -n "$output" >/dev/null"
                sudo gdebi -n "$output" >/dev/null
            else
                gpecho "60" " " "Package: " "$packagename" "(is installed)"
            fi
    fi
    
}

inpm()
{
    #stdout and stderr to null              >/dev/null 2>&1
    #stdout to null                         >/dev/null
    echo "npm install $1"
    sudo npm install $1 --global >/dev/null 2>&1
}

inpmm()
{
    for arg; do
        inpm "$arg"
    done
}


#stdCmd "sudo apt-get install solc" "verrors"
function stdCmd() {
    stderr=
    stdout=

    if [ "$2" = "normal" ] ; then
            echo "$1"
    elif [ "$2" = "errors" ] ; then
            : # do not display the command
    elif [ "$2" = "verrors" ] ; then
            echo "$1"
    elif [ "$2" = "command" ] ; then
            echo "$1"
    elif [ "$2" = "never" ] ; then
            : # do not display the command
    else
            echo "$1"
    fi

    . <({ stderr=$({ stdout="$($1)"; } 2>&1; declare -p stdout >&2); declare -p stderr; } 2>&1)

    if [ "$2" = "normal" ] ; then
            # display stdout and stderr
            if [ ! -z "${stderr}" ]
            then
                echo "$stderr"
            fi
            if [ ! -z "${stdout}" ]
            then
                echo "$stdout"
            fi
    elif [ "$2" = "errors" ] ; then
            # display stderr
            if [ ! -z "${stderr}" ]
            then
                echo "$stderr"
            fi
    elif [ "$2" = "verrors" ] ; then
            # display stderr
            if [ ! -z "${stderr}" ]
            then
                echo "$stderr"
            fi
    elif [ "$2" = "command" ] ; then
            # don't display stdout and stderr
            :
    elif [ "$2" = "never" ] ; then
            # don't display stdout and stderr
            : 
    else
            # display stdout and stderr
            if [ ! -z "${stderr}" ]
            then
                echo "$stderr"
            fi
            if [ ! -z "${stdout}" ]
            then
                echo "$stdout"
            fi
    fi

}
