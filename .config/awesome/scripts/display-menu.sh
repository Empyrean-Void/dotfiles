#!/bin/sh

# Options
dual="󰍺 Dual displays"
external="󰍹 External display"
laptop="󰌢 Laptop display"

rofi_cmd() {
   rofi -dmenu \
      -i -l 3 -p "Select display:"
}

run_rofi() {
   echo -e "$dual\n$external\n$laptop" | rofi_cmd
}

run_cmd() {
   if [[ $1 == '--dual' ]]; then
      xrandr --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output eDP-1 --mode 1920x1080 --pos 1920x0 --rotate normal 
   elif [[ $1 == '--external' ]]; then
      xrandr --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output eDP-1 --off 
   elif [[ $1 == '--laptop' ]]; then
      xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output HDMI-1-0 --off 
   else
      exit 0
   fi
}

chosen="$(run_rofi)"

case ${chosen} in
   $dual)
      run_cmd --dual
      ;;
   $external)
      run_cmd --external
      ;;
   $laptop)
      run_cmd --laptop
      ;;
esac
