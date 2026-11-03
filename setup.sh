#!/bin/bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine wine32 xvfb x11vnc novnc websockify openbox fonts-noto-cjk
