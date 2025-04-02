#!/usr/bin/env sh

# Original author: Michalis Georgiou <mechmg93@gmail.comr>
# Modified by Andrew http://www.webupd8.org <andrew@webupd8.org>
# Current version by Kassius Iacchus https://github.com/iacchus/
# Further adjustments based on user's feedback
# basedupon feedback updated by Arvind Autar arvind.autar@gmail.com

# Dependencies:
# Install `wget` on Debian/Ubuntu with:
# apt install wget

# Usage:
# 0. Copy the contents of this script to a file named "install_fonts.sh".
# 1. Make this file executable: chmod +x install_fonts.sh
# 2. Run: ./install_fonts.sh

_wgeturl="https://github.com/google/fonts/archive/main.tar.gz"
_archive="google-fonts"
_directory="fonts-main"

echo "Connecting to Github server to download fonts..."
wget $_wgeturl -O $_archive.tar.gz

echo "Extracting the downloaded archive..."
tar -zxvf $_archive.tar.gz

echo "Creating the /usr/share/fonts/truetype/$_archive folder"
mkdir -p ~/.local/share/fonts/truetype/$_archive

echo "Installing fonts categorized by their metadata..."

find $PWD/$_directory -iname METADATA.pb -exec grep "category: " {} + | cut -d \" -f 2 | sort | uniq | while read category; do 
    find $(find $_directory -iname METADATA.pb -exec grep "category: \"$category\"" {} + | sed -e 's/\/METADATA.pb.*//g') -iname "*.ttf" -exec install -D -m644 -t ~/.local/usr/share/fonts/truetype/$_archive/$category/ {} + 2>/dev/null; 
done

echo "Updating the font cache"
fc-cache -f
rm $_archive.tar.gz
echo "Well Done!"
