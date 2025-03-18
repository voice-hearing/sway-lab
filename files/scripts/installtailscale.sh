#!/usr/bin/env sh

# Thanks to bri for the inspiration! My script is based on this example:
# https://github.com/briorg/bluefin/blob/c62c30a04d42fd959ea770722c6b51216b4ec45b/scripts/1password.sh

set -ouex pipefail

echo "Installing Taiscale"

# On libostree systems, /opt is a symlink to /var/opt,
# which actually only exists on the live system. /var is
# a separate mutable, stateful FS that's overlaid onto
# the ostree rootfs. Therefore we need to install it into
# /usr/lib/google instead, and dynamically create a
# symbolic link /opt/google => /usr/lib/google upon
# boot.

# Prepare staging directory
# mkdir -p /var/opt # -p just in case it exists

# Prepare alternatives directory
# mkdir -p /var/lib/alternatives

# Setup repo
cat << EOF > /etc/yum.repos.d/tailscale.repo
[tailscale-stable]
name=Tailscale stable
baseurl=https://pkgs.tailscale.com/stable/fedora/$basearch
enabled=1
type=rpm
repo_gpgcheck=1
gpgcheck=1
gpgkey=https://pkgs.tailscale.com/stable/fedora/repo.gpg
EOF

# Import signing key
# rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Now let's install the packages.
rpm-ostree install tailscale

# Clean up the yum repo (updates are baked into new images)
# rm /etc/yum.repos.d/tailscale.repo -f

# And then we do the hacky dance!
# mv /var/opt/brave.com /usr/lib/brave.com # move this over here

#####
# Register path symlink
# We do this via tmpfiles.d so that it is created by the live system.
# cat >/usr/lib/tmpfiles.d/brave-browser.conf <<EOF
# L  /opt/brave.com -  -  -  -  /usr/lib/brave.com
# EOF
