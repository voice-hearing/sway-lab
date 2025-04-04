#!/usr/bin/bash

set -ouex pipefail

mkdir -p /var/home/$USER/AppImages

wget "https://github.com/valicm/VSCode-AppImage/releases/download/latest/VSCode-x86_64.AppImage" -O /var/home/$USER/AppImages/VSCode-x86_64.AppImage

chmod +x /var/home/$USER/AppImages/VSCode-x86_64.AppImage
