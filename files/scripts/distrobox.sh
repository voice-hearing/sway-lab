# Create a Fedora (bsherman custom) container
distrobox-fedora:
    distrobox create --fedora --image fedora:latest -n fedora -Y && distrobox enter fedora -- sudo dnf install bat exa fd-find fzf rust cargo hugo go fortune-mod zeitfetch python3-i3ipc ripgrep thefuck zoxide pandoc poppler-devel poppler-utils ImageMagick jq p7zip p7zip-plugins tree exiftool btop xfce4-appearance-settings lxappearance fish
