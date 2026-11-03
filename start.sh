#!/bin/bash
pkill -f Game.exe; wineserver -k 2>/dev/null
pkill x11vnc; pkill websockify; pkill Xvfb
rm -f /tmp/.X1-lock
sleep 1
export DISPLAY=:1
Xvfb :1 -screen 0 640x480x24 &
sleep 1
openbox &
x11vnc -display :1 -forever -nopw -shared -rfbport 5900 &
websockify --web /usr/share/novnc 6080 localhost:5900 &
sleep 2
cd "$(dirname "$0")/Faraway story"
wine Game.exe
