#!/bin/sh
sudo journalctl --vacuum-size=0
sudo find /var/log -type f -delete
sudo rm -f $HISTFILE
sudo cat /dev/null > $HISTFILE
