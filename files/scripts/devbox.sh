#!/usr/bin/bash

set -ouex pipefail


wget --quiet --output-document /usr/bin/devbox \
    "https://releases.jetify.com/devbox" && \

chmod +x /usr/bin/devbox
