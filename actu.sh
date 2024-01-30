#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt autoremove
flatpak update
snap refresh

echo "Sistema actualizado, Hasta luego"

exit