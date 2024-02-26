#!/bin/sh

# Options
shutdown='󰐥 Shutdown'
reboot='󰜉 Reboot'
suspend='󰤄 Suspend'
lock='󰌾 Lock'

rofi_cmd() {
   rofi -dmenu \
      -i -l 4 -p "Power menu:"
}

run_rofi() {
   echo -e "$lock\n$suspend\n$reboot\n$shutdown" | rofi_cmd
}

run_cmd() {
   if [[ $1 == '--shutdown' ]]; then
      systemctl poweroff
   elif [[ $1 == '--reboot' ]]; then
      systemctl reboot
   elif [[ $1 == '--suspend' ]]; then
      systemctl suspend
   elif [[ $1 == '--lock' ]]; then
      betterlockscreen -l
   else
      exit 0
   fi
}

chosen="$(run_rofi)"

case ${chosen} in
   $shutdown)
      run_cmd --shutdown
      ;;
   $reboot)
      run_cmd --reboot
      ;;
   $suspend)
      run_cmd --suspend
      ;;
   $lock)
      run_cmd --lock
      ;;
esac
