#! /bin/bash
find /var/log -type f -delete
rm $HISTFILE
cat /dev/null > $HISTFILE
