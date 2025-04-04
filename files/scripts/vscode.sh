#!/usr/bin/bash

set -ouex pipefail

# Ensure USER variable is set
USER=${USER:-$(whoami)}

# Your existing script content
echo "Running as user: $USER"

mkdir -p /var/home/$USER/AppImages

wget "https://github.com/valicm/VSCode-AppImage/releases/download/latest/VSCode-x86_64.AppImage" -O /var/home/$USER/AppImages/VSCode-x86_64.AppImage

chmod +x /var/home/$USER/AppImages/VSCode-x86_64.AppImage
