#!/bin/bash

echo "🔄 Iniciando actualización del sistema..."
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
flatpak update -y
snap refresh

echo "🧹 Iniciando limpieza post-actualización..."
sudo apt autoremove -y
sudo apt autoclean
sudo journalctl --vacuum-time=2weeks

# Vaciar papelera de forma segura
if command -v trash-empty &> /dev/null; then
    trash-empty
else
    echo "⚠️ Instalando trash-cli para vaciar la papelera..."
    sudo apt install -y trash-cli
    trash-empty
fi

echo "✅ Sistema actualizado y limpio. ¡Hasta luego!"
exit 0