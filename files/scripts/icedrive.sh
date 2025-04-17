#!/usr/bin/bash

set -ouex pipefail

#!/bin/sh

# Set default value for USER if not set
: "${USER:=default_user}"

# Add your script logic here
echo "Running script as user: ${USER}"

# Rest of the script

mkdir -p /var/home/$USER/AppImages

wget --quiet --output-document /var/home/$USER/AppImages \

"https://cdn.icedrive.net/static/apps/linux/IcedriveMounted-v3.33-x86_64.AppImage"

chmod +x /var/home/$USER/AppImages/IcedriveMounted-v3.33-x86_64.AppImage
