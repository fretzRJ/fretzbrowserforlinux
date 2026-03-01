#!/bin/bash

# Simple installer for Fretz Browser
# ⚠️ WARNING: This script uses sudo to install packages!

echo "⚠️  This installer uses sudo. You will be asked for your password."

read -p "Do you want to continue? [y/N]: " answer
case "$answer" in
    [yY]|[yY][eE][sS])
        echo "Continuing installation..."
        ;;
    *)
        echo "Installation cancelled."
        exit 1
        ;;
esac

DEB_URL="https://github.com/fretzRJ/fretzbrowserforlinux/raw/refs/heads/main/fretzbrowser_1.0.deb"
DEB_FILE="fretzbrowser_1.0.deb"

echo "Downloading Fretz Browser..."
wget -O $DEB_FILE $DEB_URL

echo "Installing Fretz Browser..."
sudo dpkg -i $DEB_FILE

echo "Fixing missing dependencies if any..."
sudo apt install -f -y

echo "Cleaning up..."
rm $DEB_FILE

echo "✅ Fretz Browser is installed! You can run it with: fretzbrowser"
