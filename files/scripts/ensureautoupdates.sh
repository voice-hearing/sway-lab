#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

systemctl enable podman-auto-update.timer
systemctl --global enable podman-auto-update.timer
systemctl --global enable flatpak-user-update.timer
systemctl enable flatpak-system-update.timer
systemctl enable rpm-ostreed-automatic.timer

