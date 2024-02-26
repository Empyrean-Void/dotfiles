#!/bin/bash

BAT=$(acpi -b | grep -m1 -oE '[0-9]+%')
BAT_PERCENTAGE="$BAT"

echo "$BAT_PERCENTAGE"

exit 0
