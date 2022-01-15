#!/bin/bash
# stratum.sh


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
    os=$(gdisplayos)
    version=$(gdisplayosver)
    local ok=
    if [ "$os" = "$1" ] && [ "$version" = "$2" ]; then
        echo "$os $version checked (ok)"
    else
        echo "Expected $1 $2 found $os $version. (abort)"
        exit
    fi
}

supdateh()
{
    gupdate "hidden stderr"
}

supgradeh()
{
    gupgrade "hidden stderr"
}

sgdistupgradeh()
{
    gdistupgrade "hidden stderr"
}