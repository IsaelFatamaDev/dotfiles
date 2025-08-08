#!/bin/bash

# Script para forzar el escalado correcto de Chrome en Wayland/Hyprland

# Variables de entorno específicas para Chrome
export CHROME_EXTRA_ARGS="--force-device-scale-factor=1.0 --high-dpi-support=1 --disable-features=VizDisplayCompositor"
export CHROMIUM_FLAGS="--force-device-scale-factor=1.0 --high-dpi-support=1 --disable-features=VizDisplayCompositor"
export ELECTRON_FORCE_IS_MASQUERADE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Forzar escalado de monitor
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=1

echo "Configuración de escalado para Chrome aplicada"
echo "Variables de entorno configuradas para escalado 1.0"
