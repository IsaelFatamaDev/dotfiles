#!/bin/bash

# Script para optimizar la calidad de fuentes en Full HD
# Ejecutar este script antes de iniciar Hyprland

# Configuración para fuentes nítidas en Full HD
export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
export _JAVA_AWT_WM_NONREPARENTING=1

# Configuración para aplicaciones GTK
export GDK_SCALE=1
export GDK_DPI_SCALE=1.0

# Configuración para aplicaciones Qt
export QT_SCALE_FACTOR=1.0
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Configuración para Electron apps
export ELECTRON_FORCE_IS_MASQUERADE=1

# Configuración para Java apps
export _JAVA_OPTIONS="-Dsun.java2d.xrender=true"

# Configuración para Firefox
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1

# Configuración para Chrome/Chromium
export CHROME_EXTRA_ARGS="--force-device-scale-factor=1.0 --high-dpi-support=1 --force-device-scale-factor=1"

# Configuración para VS Code
export VSCODE_DEV=1

echo "Configuración de fuentes Full HD aplicada"
echo "Variables de entorno configuradas para calidad óptima en Full HD"
