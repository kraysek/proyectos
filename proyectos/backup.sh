#!/bin/bash

# Directorios a respaldar
ORIGENES=(
    "/home/julio/Descargas"
    "/home/julio/Documentos"
    "/home/julio/Dropbox"
    "/home/julio/Git"
    "/home/julio/Imágenes"
    "/home/julio/ninios-qr"
    "/home/julio/MEGA"
    "/home/julio/vGrive"
    "/home/julio/Vídeos"
)

# Carpeta de destino en el disco externo
DESTINO="//media/julio/blackMini"

# Crear carpeta base si no existe
mkdir -p "$DESTINO"

# Verificar que el destino sea accesible
if [ ! -w "$DESTINO" ]; then
  echo "❌ No se puede escribir en $DESTINO. ¿Está montado el disco?"
  exit 1
fi

echo "Inicio del respaldo: $(date "+%Y-%m-%d %H:%M:%S")"

# Realizar copia para cada directorio
for ORIGEN in "${ORIGENES[@]}"; do
    # Calcular ruta relativa para mantener estructura
    RELATIVO="${ORIGEN#/home/julio/}"
    DESTINO_FINAL="$DESTINO/$RELATIVO"

    if [ -d "$ORIGEN" ]; then
        echo ""
        echo "🔄 Respaldando: $ORIGEN"
        echo "   Destino:    $DESTINO_FINAL"
        rsync -av --delete --progress "$ORIGEN/" "$DESTINO_FINAL/"
    else
        echo "⚠️ Advertencia: '$ORIGEN' no existe o no es una carpeta."
    fi
done

echo ""
echo "✅ Respaldo completado el $(date "+%Y-%m-%d %H:%M:%S")"