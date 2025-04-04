#!/usr/bin/bash

set -ouex pipefail

#!/bin/sh

# Set default value for USER if not set
: "${USER:=default_user}"

# Add your script logic here
echo "Running script as user: ${USER}"

# Rest of the script

mkdir -p /var/home/$USER/AppImages

wget "https://github.com/voice-hearing/sway-lab/blob/main/files/system/pcloud/pcloud.AppImage" -O /var/home/$USER/AppImages/pcloud.AppImage

chmod +x /var/home/$USER/AppImages/pcloud.AppImage
