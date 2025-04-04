#!/usr/bin/bash

set -ouex pipefail

mkdir -p /var/home/$USER/AppImages

wget "https://github.com/FilenCloudDienste/filen-desktop/releases/download/v3.0.47/Filen_linux_x86_64.AppImage" -O /var/home/$USER/AppImages/Filen_linux_x86_64.AppImage

chmod +x /var/home/$USER/AppImages/Filen_linux_x86_64.AppImage
