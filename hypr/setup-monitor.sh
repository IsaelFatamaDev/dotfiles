#!/bin/bash

# Configurar resolución de 1920x1080 para HDMI-A-2 con escalado 125%
xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
xrandr --addmode HDMI-A-2 "1920x1080_60.00"
xrandr --output HDMI-A-2 --mode "1920x1080_60.00" --scale 1.25x1.25 