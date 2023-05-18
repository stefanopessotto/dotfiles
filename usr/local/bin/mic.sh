#!/usr/bin/bash

status_on="default"
status_off="default"
template="default"

usage () { echo "Usage: $0 --on '' --off '' --t ''" 1>&2; exit 1; }

for opt in "$@"; do
    case $opt in 
        --on=*) 
            status_on="${opt#*=}"
            ;;
        --off=*) 
            status_off="${opt#*=}"
            ;;
        --t=*) 
            template="${opt#*=}"
            ;;
        *) 
            usage
            ;;
    esac
done

# grep Yes if muted, empty otherwise
muted=$(pactl get-source-mute 0 | grep 'yes')
if [ "$muted" = "" ]; then
    echo -n "$template" | sed "s/<status>/$status_on/"
else
    echo -n "$template" | sed "s/<status>/$status_off/"
fi

