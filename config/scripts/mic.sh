#!/usr/bin/bash
#pactl get-source-mute 0 | sed -e "s/.*yes.*/\xf1\x30/" | sed -e "s/.*no.*/\xf1\x31/"
muted=$(pactl get-source-mute 0 | grep 'yes')
if [ "$muted" = "" ]; then
    printf ""
else
    printf ""
fi

