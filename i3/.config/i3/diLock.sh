#!/bin/bash
xset -dpms      # Disable DPMS
xset s noblank  # Ensure no blanking
pkill xautolock # Stop locker
notify-send "DPMS/Lock DISABLED"
