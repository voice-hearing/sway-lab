#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Add Nerd Fonts
curl -Lo /etc/yum.repos.d/_copr_che-nerd-fonts-"${fedora-$releasever-$basearch}".repo https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-"${fedora-$releasever-$basearch}"/che-nerd-fonts-fedora-"${fedora-$releasever-$basearch}".repo
