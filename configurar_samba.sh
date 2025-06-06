#!/bin/bash

# Variables
SAMBA_CONF="/etc/samba/smb.conf"
SHARE_PATH="/home/julio/Publica"
SHARE_NAME="Publica"
USER="julio"

# Verificar si Samba está instalado
if ! command -v smbd &> /dev/null; then
    echo "Instalando Samba..."
    sudo apt update && sudo apt install -y samba
fi

# Crear la carpeta compartida si no existe
if [ ! -d "$SHARE_PATH" ]; then
    echo "Creando carpeta $SHARE_PATH..."
    mkdir -p "$SHARE_PATH"
fi

# Asignar permisos adecuados
echo "Asignando permisos..."
sudo chown -R "$USER":"$USER" "$SHARE_PATH"
sudo chmod -R 777 "$SHARE_PATH"

# Agregar configuración al archivo smb.conf
echo "Configurando Samba..."
sudo bash -c "cat >> $SAMBA_CONF" <<EOL

[$SHARE_NAME]
   path = $SHARE_PATH
   browseable = yes
   writable = yes
   guest ok = yes
   force user = $USER
   create mask = 0777
   directory mask = 0777
EOL

# Reiniciar Samba para aplicar cambios
echo "Reiniciando Samba..."
sudo systemctl restart smbd nmbd

echo "Configuración completada. La carpeta '$SHARE_PATH' ya está compartida como '$SHARE_NAME'."
