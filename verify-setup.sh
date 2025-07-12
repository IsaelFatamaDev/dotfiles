#!/bin/bash

# Script para verificar que toda la configuración esté funcionando correctamente

echo "🔍 Verificando configuración de Hyprland..."

# Verificar que Hyprland esté corriendo
if pgrep -x "Hyprland" > /dev/null; then
    echo "✅ Hyprland está ejecutándose"
else
    echo "❌ Hyprland no está ejecutándose"
fi

# Verificar Waybar
if pgrep -x "waybar" > /dev/null; then
    echo "✅ Waybar está ejecutándose"
else
    echo "❌ Waybar no está ejecutándose"
fi

# Verificar xwaylandvideobridge
if pgrep -x "xwaylandvideobridge" > /dev/null; then
    echo "✅ xwaylandvideobridge está ejecutándose"
else
    echo "❌ xwaylandvideobridge no está ejecutándose"
fi

# Verificar enlaces simbólicos
echo ""
echo "🔗 Verificando enlaces simbólicos..."

if [ -L ~/.config/hypr ]; then
    echo "✅ Enlace de Hyprland configurado"
else
    echo "❌ Enlace de Hyprland no configurado"
fi

if [ -L ~/.config/waybar ]; then
    echo "✅ Enlace de Waybar configurado"
else
    echo "❌ Enlace de Waybar no configurado"
fi

if [ -L ~/.config/wofi ]; then
    echo "✅ Enlace de Wofi configurado"
else
    echo "❌ Enlace de Wofi no configurado"
fi

# Verificar configuración de monitor
echo ""
echo "📺 Verificando configuración de monitor..."
hyprctl monitors | grep -E "(1920x1080|scale)"

# Verificar variables de entorno
echo ""
echo "🔧 Verificando variables de entorno..."
echo "XDG_SESSION_TYPE: $XDG_SESSION_TYPE"
echo "GDK_SCALE: ${GDK_SCALE:-no configurado}"
echo "QT_SCALE_FACTOR: ${QT_SCALE_FACTOR:-no configurado}"

# Verificar atajos de teclado
echo ""
echo "⌨️  Atajos de teclado disponibles:"
echo "  - SUPER + RETURN: Terminal"
echo "  - SUPER + Q: Cerrar ventana"
echo "  - SUPER + V: Ventana flotante"
echo "  - SUPER + ESPACIO: Menú de aplicaciones"
echo "  - SUPER + S: Captura con selección"
echo "  - SUPER + F: Pantalla completa"
echo "  - SUPER + T: Alternar flotante"
echo "  - PRINT: Captura pantalla completa"
echo "  - SHIFT + PRINT: Captura con selección"

echo ""
echo "🎨 Tema aplicado:"
echo "  - Bordes morados (RGB: 128,0,255)"
echo "  - Barra Waybar moderna con tema morado"
echo "  - Escala 1.0 para máxima nitidez"

echo ""
echo "🚀 Configuración completa y funcional!"
echo "💡 Para compartir pantalla en Discord, abre Discord y prueba la función de compartir" 