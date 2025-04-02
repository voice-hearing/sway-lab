#!/bin/sh

set -ouex pipefail

# ensure that RPM post-install don't break with alternatives reqs
mkdir -p /var/lib/alternatives

# apps install
/tmp/apps/kopiaui.sh
