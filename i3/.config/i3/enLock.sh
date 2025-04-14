#!/bin/bash
xset +dpms      # Re-enable DPMS
xset dpms 600 900 0  # Reset timeouts
xautolock -time 10 -locker "i3lock-fancy" -detectsleep &  # Restart locker
notify-send "DPMS/Lock ENABLED"
