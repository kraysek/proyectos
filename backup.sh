#!/bin/bash

# Definir las carpetas de origen y el destino
ORIGENES=(
    "/home/kraysek/Descargas"
    "/home/kraysek/Documentos"
    "/home/kraysek/Dropbox"
    "/home/kraysek/Git"
    "/home/kraysek/Imágenes"
    "/home/kraysek/MEGAsync"
    "/home/kraysek/vGrive"
    "/home/kraysek/Vídeos"
)

DESTINO="/media/kraysek/RESPALDO/"

# Crear el directorio de destino si no existe
mkdir -p "$DESTINO"

# Copiar cada carpeta de origen al destino
for ORIGEN in "${ORIGENES[@]}"; do
    if [ -d "$ORIGEN" ]; then
        echo "Respaldando $ORIGEN a $DESTINO"
        rsync -av --progress "$ORIGEN/" "$DESTINO$(basename "$ORIGEN")/"
    else
        echo "Directorio $ORIGEN no existe, saltando..."
    fi
done

echo "Respaldo completado."

