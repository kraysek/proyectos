#!/bin/bash

# Contador para los nombres consecutivos
contador=1

# Nombre del script actual
script=$(basename "$0")

# Solicitar al usuario que ingrese el prefijo para los nuevos nombres
echo "Por favor, ingrese el prefijo para los nuevos nombres:"
read prefijo

# Iterar sobre cada archivo en la carpeta
for archivo in *; do
    # Verificar si el elemento es un archivo regular y no es el propio script
    if [ -f "$archivo" ] && [ "$archivo" != "$script" ]; then
        # Obtener la extensión del archivo
        extension="${archivo##*.}"
        
        # Renombrar el archivo de forma consecutiva
        nuevo_nombre="$prefijo$contador.$extension"
        mv "$archivo" "$nuevo_nombre"
        
        # Incrementar el contador
        contador=$((contador+1))
    fi
done

