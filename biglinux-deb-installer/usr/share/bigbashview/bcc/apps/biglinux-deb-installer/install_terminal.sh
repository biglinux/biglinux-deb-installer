#!/bin/bash

#Install .deb packages
#           
#Author Bruno Goncalves  <www.biglinux.com.br>
#License: GPLv2 or later                       
#################################################


PID_BIG_DEB_INSTALLER="$$" WINDOW_ID="$WINDOW_ID" ./install_terminal_resize.sh &

OIFS=$IFS
IFS=$'\n'

rm -f /tmp/biglinux-deb-installer-error

if [ "$APT_UPDATE" = "1" ]; then
    apt update
else
    apt --allow-downgrades -y install $REINSTALL $(cat /tmp/biglinux-deb-installer-list) 2> >(tee /tmp/biglinux-deb-installer-error)
fi

if [ "$(xwininfo -id $WINDOW_ID 2>&1 | grep -i "No such window")" != "" ]; then
    kill -9 $PID_BIG_DEB_INSTALLER
    exit 0
fi

IFS=$OIFS
