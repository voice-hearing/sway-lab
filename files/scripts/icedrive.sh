#!/usr/bin/bash

set -ouex pipefail

mkdir -p /var/home/$USER/AppImages

wget "https://cdn.icedrive.net/static/apps/linux/IcedriveMounted-v3.33-x86_64.AppImage" -O /var/home/$USER/AppImages/IcedriveMounted-v3.33-x86_64.AppImage

chmod +x /var/home/$USER/AppImages/IcedriveMounted-v3.33-x86_64.AppImage
