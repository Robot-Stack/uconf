#!/bin/bash
# stratum.sh


sapt()
{
    CommandOptionLoop "gcheckapt" "show" "$@"
}

sapth()
{
    CommandOptionLoop "gcheckapt" "hidden" "$@"
}
