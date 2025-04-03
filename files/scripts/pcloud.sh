#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

mv files/system/pcloud $HOME/AppImages

chmod +x ~/pcloud
