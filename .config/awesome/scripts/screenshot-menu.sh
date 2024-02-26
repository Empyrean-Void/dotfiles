#!/bin/sh

# Options
screen='󰹑 Entire screen'
window='󱣵 Select window'

rofi_cmd() {
   rofi -dmenu \
      -i -l 2 -p "Screenshot:"
}

run_rofi() {
   echo -e "$screen\n$window" | rofi_cmd
}

run_cmd() {
   if [[ $1 == '--screen' ]]; then
      scrot -d 1 ~/Pictures/screenshots/%Y-%m-%d-%H-%M-%S.png
      notify-send "Screenshot captured"
   elif [[ $1 == '--window' ]]; then
      scrot -s ~/Pictures/screenshots/%Y-%m-%d-%H-%M-%S.png
      notify-send "Screenshot captured"
   else
      exit 0
   fi
}

chosen="$(run_rofi)"

case ${chosen} in
   $screen)
      run_cmd --screen
      ;;
   $window)
      run_cmd --window
      ;;
esac
