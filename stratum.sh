#!/bin/bash
# stratum.sh

#verbosity="verbose stderr"
#verbosity="hidden stderr"
verbosity="verbose stderr"

sapt()
{
    CommandOptionLoop "gcheckapt" "verbose stderr" "$@"
}

ssnap()
{
    CommandOptionLoop "gchecksnap" "verbose stderr" "$@"
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

supdateall()
{
    gupdate "$verbosity"
    gupgrade "$verbosity"
    gupdate "$verbosity"
    gdistupgrade "$verbosity"
    gupdate "$verbosity"
}

sgdebi()
{
    if [ "$1" = "github-desktop" ] ; then
        ggdebi "https://github.com/shiftkey/desktop/releases/download/release-2.9.6-linux1/GitHubDesktop-linux-2.9.6-linux1.deb"
    elif [ "$1" = "addhere" ] ; then
        ggdebi "https://github.com/trufflesuite/ganache-ui/releases/download"
    elif [ "$1" = "remix-ide" ] ; then
        ggdebi "https://github.com/ethereum/remix-desktop/releases/download/v1.3.3/remix-ide_1.3.3_amd64.deb"
    else
        echo "sgdebi: unknown $1"
    fi
}