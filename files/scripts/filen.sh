#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

wget "https://github.com/FilenCloudDienste/filen-desktop/releases/download/v3.0.47/Filen_linux_x86_64.AppImage" -O ~/AppImages/Filen_linux_x86_64.AppImage

chmod +x ~/AppImages/Filen_linux_x86_64.AppImage
