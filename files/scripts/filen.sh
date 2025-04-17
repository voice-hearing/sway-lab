#!/usr/bin/bash

set -ouex pipefail

# Set default value for USER if not set
: "${USER:=default_user}"

# Add your script logic here
echo "Running script as user: ${USER}"

# Rest of the script

mkdir -p /var/home/$USER/AppImages

wget --quiet --output-document /var/home/$USER/AppImages \

"https://github.com/FilenCloudDienste/filen-desktop/releases/download/v3.0.47/Filen_linux_x86_64.AppImage"

chmod +x /var/home/$USER/AppImages/Filen_linux_x86_64.AppImage
