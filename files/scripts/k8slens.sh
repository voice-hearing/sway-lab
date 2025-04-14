#!/usr/bin/bash

set -ouex pipefail


wget --quiet --output-document /usr/bin/k8slens \
    "https://api.k8slens.dev/binaries/latest.x86_64.AppImage"

chmod +x /usr/bin/k8slens
