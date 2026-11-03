#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 640x480x24 &
openbox &
x11vnc -display :1 -forever -nopw -shared -rfbport 5900 &
websockify --web /usr/share/novnc 6080 localhost:5900 &
sleep 2
cd "/workspaces/Faraway-story-web-port/Faraway story"
wine Game.exe
