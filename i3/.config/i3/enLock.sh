#!/bin/bash
xset +dpms      # Re-enable DPMS
xset dpms 600 900 950 #Reset timeouts
xautolock -time 10 -locker "betterlockscreen -l" -detectsleep &  # Restart locker
notify-send "DPMS/Lock ENABLED"
