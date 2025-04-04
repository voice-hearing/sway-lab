#!/usr/bin/bash

set -ouex pipefail

mkdir -p /$HOME/AppImages

# Check if the file exists before moving it
if [ -f "files/system/pcloud/pcloud.AppImage" ]; then
    mv files/system/pcloud/pcloud.AppImage /$HOME/AppImages
else
    echo "Error: pcloud.AppImage file not found in files/system/pcloud/"
    exit 1
fi
