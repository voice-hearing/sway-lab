#!/usr/bin/bash

set -ouex pipefail

mkdir -p /var/home/$USER/AppImages

wget "https://github.com/voice-hearing/sway-lab/blob/main/files/system/pcloud/pcloud.AppImage" -O /var/home/$USER/AppImages/pcloud.AppImage

chmod +x /var/home/$USER/AppImages/pcloud.AppImage
