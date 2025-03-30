#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Add Nerd Fonts
curl -Lo /etc/yum.repos.d/_copr_che-nerd-fonts-"${FEDORA_MAJOR_VERSION}".repo https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-"${FEDORA_MAJOR_VERSION}"/che-nerd-fonts-fedora-"${FEDORA_MAJOR_VERSION}".repo

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

version=5.2
zip=Fira_Code_v${version}.zip
curl --fail --location --show-error https://github.com/tonsky/FiraCode/releases/download/${version}/${zip} --output ${zip}
unzip -o -q -d ${fonts_dir} ${zip}
rm ${zip}

echo "fc-cache -f"
fc-cache -f
