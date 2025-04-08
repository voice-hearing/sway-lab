#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

#!/bin/sh
# Adapted from https://piware.de/gitweb/?p=bin.git;a=blob_plain;f=build-debian-toolbox
# Thanks Martin Pitt!

set -eux

# See https://gallery.ecr.aws/debian/debian for list of releases
# 

RELEASE=${1:-41}
DISTRO=${2:-fedora}

toolbox rm -f $RELEASE || true
podman pull ghcr.io/ublue-os/$DISTRO/$DISTRO:$RELEASE
toolbox -y create -c $RELEASE --image ghcr.io/ublue-os/$DISTRO/$DISTRO:$RELEASE

# can't do that with toolbox run yet, as we need to install sudo first
podman start $RELEASE
podman exec -it $RELEASE sh -exc 

# allow sudo with empty password
sed -i "s/nullok_secure/nullok/" /etc/pam.d/common-auth

'

# go-faster apt/dpkg
echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/unsafe-io

# location based redirector gets it wrong with company VPN; also add deb-src
sed -i "s/deb.debian.org/cloudfront.debian.net/; /^deb\b/ { p; s/^deb/deb-src/ }" /etc/apt/sources.list

apt-get update
apt-get install -y libnss-myhostname sudo eatmydata libcap2-bin dialog ssh

# allow sudo with empty password
sed -i "s/nullok_secure/nullok/" /etc/pam.d/common-auth
'

toolbox run --container $RELEASE sh -exc 
# otherwise installing systemd fails
sudo umount /var/log/journal

# useful hostname
. /etc/os-release
echo "${ID}-${VERSION_ID:-sid}" | sudo tee /etc/hostname
sudo hostname -F /etc/hostname

sudo dnf install eatmydata

sudo eatmydata dnf -y dist-upgrade

# development tools
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y git vim bash-completion wget gnupg python3 &&
sudo dnf install wget bat exa fd-find fzf rust cargo hugo go fortune-mod zeitfetch python3-i3ipc ripgrep thefuck zoxide pandoc poppler-devel poppler-utils ImageMagick jq p7zip p7zip-plugins tree exiftool btop xfce4-appearance-settings lxappearance fish && wget https://mega.nz/linux/repo/Fedora_41/x86_64/megasync-Fedora_41.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_41.x86_64.rpm" && 
sudo dnf install https://prerelease.keybase.io/keybase_amd64.rpm
