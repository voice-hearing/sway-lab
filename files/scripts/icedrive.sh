#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

wget "https://cdn.icedrive.net/static/apps/linux/IcedriveMounted-v3.33-x86_64.AppImage" -O ~/AppImages/IcedriveMounted-v3.33-x86_64.AppImage

chmod +x ~/AppImages/IcedriveMounted-v3.33-x86_64.AppImage
