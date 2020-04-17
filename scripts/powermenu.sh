#!/usr/bin/env bash

rofi_command="rofi -theme arrpee"

# Options
lock="  Lock"
logout="  Logout"
suspend="  Suspend"
reboot="  Reboot"
shutdown="  Shutdown"

# Variable passed to rofi
options="$lock\n$logout\n$suspend\n$shutdown\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -dmenu -i)"
case $chosen in
    $lock)
        ~/.dotfiles/scripts/lock.sh
        ;;
    $logout)
        awesome-client 'awesome.quit()'
        ;;
    $suspend)
        systemctl suspend
        ;;
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
esac