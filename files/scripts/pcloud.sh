#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

mv files/system/pcloud/pcloud $HOME/AppImages

chmod +x ~/pcloud
