#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Fedora 41 Distrobox setup without Podman commands
# Original concept: https://piware.de/gitweb/?p=bin.git;a=blob_plain;f=build-debian-toolbox

RELEASE=${1:-41}
DISTRO=${2:-fedora}

# Remove existing container
distrobox rm -f $RELEASE || true

# Create container from Fedora image
distrobox create -n $RELEASE --image registry.fedoraproject.org/$DISTRO:$RELEASE

# Configure container environment
distrobox enter --name $RELEASE -- sh -exc '
# Update base system
dnf -y update

# Install core utilities
dnf install -y sudo hostname util-linux dialog dnf-plugins-core

# Configure passwordless sudo
echo "%wheel ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/wheel-nopasswd
chmod 440 /etc/sudoers.d/wheel-nopasswd

# Set hostname
hostnamectl set-hostname fedora-${RELEASE}

# Install development tools
dnf groupinstall -y "Development Tools"
dnf install -y git vim bash-completion wget gnupg python3 &&
dnf install wget bat exa fd-find fzf rust cargo hugo go fortune-mod zeitfetch python3-i3ipc ripgrep thefuck zoxide pandoc poppler-devel poppler-utils ImageMagick jq p7zip p7zip-plugins tree exiftool btop xfce4-appearance-settings lxappearance fish && wget https://mega.nz/linux/repo/Fedora_41/x86_64/megasync-Fedora_41.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_41.x86_64.rpm" && sudo dnf install https://prerelease.keybase.io/keybase_amd64.rpm

    

# Clean package cache
dnf clean all
'

distrobox enter --name $RELEASE
