#! /bin/sh
find -f /var/log -type f -delete
cat /dev/null > $HISTFILE

fc -c
history -c
# zsh history
fc -p 
history -p
