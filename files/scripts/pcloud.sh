#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

wget "https://github.com/voice-hearing/sway-lab/blob/main/files/system/pcloud/pcloud.AppImage" -O ~/pcloud.AppImage

chmod +x ~/pcloud.AppImage
