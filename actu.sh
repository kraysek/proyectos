#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
flatpak update -y
snap refresh

echo "Sistema actualizado, Hasta luego"
exit