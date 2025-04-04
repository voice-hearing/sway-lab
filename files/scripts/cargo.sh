#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

cargo install sworkstyle && cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide


