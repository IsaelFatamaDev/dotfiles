#!/bin/bash

# Script para reiniciar waybar limpiamente
echo "🔄 Reiniciando Waybar..."

# Terminar todos los procesos de waybar
pkill -f waybar
sleep 2

# Verificar que se cerró completamente
if pgrep -f waybar > /dev/null; then
    echo "⚠️  Forzando cierre de waybar..."
    pkill -9 -f waybar
    sleep 1
fi

# Limpiar logs previos
rm -f ~/.cache/waybar.log

# Iniciar waybar con logging
echo "✅ Iniciando waybar con configuración corregida..."
waybar > ~/.cache/waybar.log 2>&1 &

# Verificar que se inició correctamente
sleep 3
if pgrep -f waybar > /dev/null; then
    echo "✅ Waybar iniciado correctamente!"
    echo "📋 Logs disponibles en: ~/.cache/waybar.log"
else
    echo "❌ Error al iniciar waybar. Revisa los logs:"
    cat ~/.cache/waybar.log
fi
