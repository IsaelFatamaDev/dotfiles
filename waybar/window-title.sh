#!/bin/bash

# Script para mostrar la ventana activa solo cuando existe
# Si no hay ventana activa, no muestra nada

# Verificar si hyprctl está disponible
if ! command -v hyprctl &> /dev/null; then
    exit 0
fi

# Obtener información de la ventana activa
WINDOW_INFO=$(hyprctl activewindow -j 2>/dev/null)

# Verificar si hay una ventana válida
if [ $? -ne 0 ] || [ -z "$WINDOW_INFO" ] || [ "$WINDOW_INFO" = "null" ]; then
    exit 0
fi

# Extraer el título usando jq si está disponible, sino usar grep
if command -v jq &> /dev/null; then
    WINDOW_TITLE=$(echo "$WINDOW_INFO" | jq -r '.title // ""' 2>/dev/null)
    WINDOW_CLASS=$(echo "$WINDOW_INFO" | jq -r '.class // ""' 2>/dev/null)
else
    WINDOW_TITLE=$(echo "$WINDOW_INFO" | grep -o '"title":"[^"]*"' | cut -d'"' -f4)
    WINDOW_CLASS=$(echo "$WINDOW_INFO" | grep -o '"class":"[^"]*"' | cut -d'"' -f4)
fi

# Si no hay título válido, salir sin mostrar nada
if [ -z "$WINDOW_TITLE" ] || [ "$WINDOW_TITLE" = "null" ] || [ "$WINDOW_TITLE" = "" ]; then
    exit 0
fi

# Truncar título si es muy largo
if [ ${#WINDOW_TITLE} -gt 50 ]; then
    WINDOW_TITLE="${WINDOW_TITLE:0:47}..."
fi

# Aplicar iconos según la clase o título
case "$WINDOW_CLASS" in
    "firefox"|"Firefox") echo "🌐 $WINDOW_TITLE" ;;
    "google-chrome"|"Google-chrome"|"chrome") echo "🌐 $WINDOW_TITLE" ;;
    "code"|"Code") echo "💻 $WINDOW_TITLE" ;;
    "kitty") echo "⚡ $WINDOW_TITLE" ;;
    "nautilus"|"Nautilus") echo "📁 $WINDOW_TITLE" ;;
    "discord"|"Discord") echo "💬 $WINDOW_TITLE" ;;
    "spotify"|"Spotify") echo "🎵 $WINDOW_TITLE" ;;
    *)
        # Fallback por título si la clase no coincide
        case "$WINDOW_TITLE" in
            *"Firefox"*) echo "🌐 $WINDOW_TITLE" ;;
            *"Chrome"*) echo "🌐 $WINDOW_TITLE" ;;
            *"Visual Studio Code"*) echo "💻 $WINDOW_TITLE" ;;
            *) echo "📱 $WINDOW_TITLE" ;;
        esac
    ;;
esac
