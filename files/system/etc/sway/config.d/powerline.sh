#!/usr/bin/env bash
fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi
version=5.2
zip=Fira_Code_v${version}.zip
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
fc-cache -f
