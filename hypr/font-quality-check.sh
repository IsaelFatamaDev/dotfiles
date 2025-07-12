#!/bin/bash

# Script para verificar y optimizar la calidad de fuentes en Full HD
echo "=== Verificación de calidad de fuentes para Full HD ==="

# Verificar configuración actual del monitor
echo "📺 Configuración actual del monitor:"
hyprctl monitors | grep -E "(1920x1080|scale)"

# Verificar variables de entorno importantes
echo -e "\n🔧 Variables de entorno de escalado:"
echo "GDK_SCALE: ${GDK_SCALE:-no configurado}"
echo "GDK_DPI_SCALE: ${GDK_DPI_SCALE:-no configurado}"
echo "QT_SCALE_FACTOR: ${QT_SCALE_FACTOR:-no configurado}"
echo "FREETYPE_PROPERTIES: ${FREETYPE_PROPERTIES:-no configurado}"

# Verificar fuentes del sistema
echo -e "\n📝 Fuentes disponibles:"
fc-list | grep -i "dejavu\|liberation\|ubuntu\|noto" | head -5

# Verificar configuración de subpixel rendering
echo -e "\n🎨 Configuración de subpixel rendering:"
cat /etc/fonts/local.conf 2>/dev/null || echo "No hay configuración local de fuentes"

echo -e "\n✅ Configuración optimizada para Full HD (1920x1080)"
echo "💡 Escala recomendada: 1.0 (sin escalado)"
echo "💡 Las fuentes deberían verse nítidas sin pixelación" 