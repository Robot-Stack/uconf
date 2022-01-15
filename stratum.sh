#!/bin/bash
# stratum.sh

#verbosity="verbose stderr"
#verbosity="hidden stderr"
verbosity="verbose stderr"

sapt()
{
    CommandOptionLoop "gcheckapt" "verbose stderr" "$@"
}

sapth()
{
    CommandOptionLoop "gcheckapt" "hidden stderr" "$@"
}

scheckos()
{
    local os=$(gdisplayos)
    local version=$(gdisplayosver)
    if [ "$os" = "$1" ] && [ "$version" = "$2" ]; then
        echo "$os $version checked (ok)"
    else
        echo "Expected $1 $2 found $os $version. (abort)"
        exit
    fi
}

supdate()
{
    gupdate "$verbosity"
}

supgrade()
{
    gupgrade "$verbosity"
}

sgdistupgrade()
{
    gdistupgrade "$verbosity"
}

supdateall()
{
    supdate "$verbosity"
    supgrade "$verbosity"
    supdate "$verbosity"
    sgdistupgrade "$verbosity"
    supdate "$verbosity"
}