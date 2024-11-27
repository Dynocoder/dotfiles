#!/bin/bash

if [ -d /sys/class/power_supply/ACAD ]; then
  status=$(cat /sys/class/power_supply/ACAD/online );

  if [ $status -eq 0 ]; then
    echo "On battery start the battery saver!!";
    BRIGHTNESS_PATH="/sys/class/backlight/amdgpu_bl1/brightness"

    system76-power profile battery
    echo 180 | sudo tee "$BRIGHTNESS_PATH" > /dev/null
  else
    echo "On Power, chugging it!!";
  fi
else
    echo "No info";
fi
