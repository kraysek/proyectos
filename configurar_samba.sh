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

# Agregar configuración al archivo smb.conf solo si no existe ya
if ! grep -q "\[$SHARE_NAME\]" "$SAMBA_CONF"; then
    echo "Configurando Samba..."
    sudo tee -a "$SAMBA_CONF" > /dev/null <<EOL

[$SHARE_NAME]
   path = $SHARE_PATH
   browseable = yes
   writable = yes
   guest ok = yes
   force user = $USER
   create mask = 0777
   directory mask = 0777
EOL
else
    echo "La sección [$SHARE_NAME] ya existe en smb.conf"
fi

# Validar configuración
echo "Validando configuración de Samba..."
if testparm; then
    echo "Configuración válida."
else
    echo "Error en la configuración de Samba. Revisa /etc/samba/smb.conf"
    exit 1
fi

# Reiniciar Samba para aplicar cambios
echo "Reiniciando Samba..."
sudo systemctl restart smbd nmbd

# Asegurar que el firewall permita tráfico de Samba
echo "Ajustando firewall..."
sudo ufw allow 445/tcp
sudo ufw allow 139/tcp
sudo ufw reload

echo "Configuración completada. La carpeta '$SHARE_PATH' ya está compartida como '$SHARE_NAME'."