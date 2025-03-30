#!/bin/bash

# Define the path to the RPM package
default_rpm_path="files/system/nordvpn*.rpm"

# Function to install Cloudflare Warp
install_nordvpn() {
    local rpm_path=${1:-$default_rpm_path}

    if ls $rpm_path &>/dev/null; then
        echo "Installing nordvpn from $rpm_path using rpm-ostree..."
        sudo rpm-ostree install $rpm_path && echo "Nordvpn installed successfully." || echo "Failed to install Nordvpn."
    else
        echo "No RPM packages found at $rpm_path. Please verify the path."
        exit 1
    fi
}

# Function to uninstall Cloudflare Warp
uninstall_warp() {
    echo "Uninstalling Nordvpn using rpm-ostree..."
    if sudo rpm-ostree uninstall nordvpn; then
        echo "Nordvpn uninstalled successfully."
    else
        echo "Failed to uninstall Norddvpn or it may not be installed."
        exit 1
    fi
}

# Main script logic
case "$1" in
    install-nordvpn)
        install_nordvpn "$2"
        ;;
    uninstall-nordvpn)
        uninstall_nordvpn
        ;;
    *)
        echo "Usage: $0 {install-nordvpn [rpm_path] | uninstall-nordvpn}"
        exit 1
        ;;
esac
