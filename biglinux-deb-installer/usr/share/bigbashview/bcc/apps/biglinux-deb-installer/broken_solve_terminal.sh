#!/bin/bash

#Install .deb packages
#           
#Author Bruno Goncalves  <www.biglinux.com.br>
#License: GPLv2 or later                       
#################################################


PID_BIG_DEB_INSTALLER="$$" WINDOW_ID="$WINDOW_ID" ./broken_solve_terminal_resize.sh &

apt -y -f install

dpkg --configure -a


