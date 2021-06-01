#!/bin/bash

# https://urukrama.wordpress.com/2007/12/03/confirm-to-shut-down-reboot-or-log-out-in-openbox/

gxmessage "Are you sure you want to shut down your computer?" \
  -center -title "Take action" \
  -font "Sans bold 10" \
  -default "Cancel" \
  -buttons "_Cancel":1,"_Log out":2,"_Reboot":3,"_Shut down":4 \
  >/dev/null

case $? in
  1) echo "Exit";;
  2) openbox --exit;;
  3) systemctl reboot;;
  4) systemctl poweroff;;
esac
