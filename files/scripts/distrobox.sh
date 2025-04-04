#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

distrobox create --image fedora:latest -n fedora -Y 

distrobox enter fedora

sudo dnf install bat exa fd-find fzf rust cargo hugo go fortune-mod zeitfetch python3-i3ipc ripgrep thefuck zoxide pandoc poppler-devel poppler-utils ImageMagick jq p7zip p7zip-plugins tree exiftool btop xfce4-appearance-settings lxappearance fish && wget https://mega.nz/linux/repo/Fedora_41/x86_64/megasync-Fedora_41.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_41.x86_64.rpm" && sudo dnf install https://prerelease.keybase.io/keybase_amd64.rpm
