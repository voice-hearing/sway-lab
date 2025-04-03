#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

wget "https://github.com/valicm/VSCode-AppImage/releases/download/latest/VSCode-x86_64.AppImage" -O ~/AppImages/VSCode-x86_64.AppImage

chmod +x ~/AppImages/VSCode-x86_64.AppImage
