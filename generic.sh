#!/bin/bash
# generic.sh
ScriptDir="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

function gpause()
{
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
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





