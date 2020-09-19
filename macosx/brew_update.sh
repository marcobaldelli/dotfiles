#!/bin/bash
set -eu -o pipefail
brew=/usr/local/bin/brew

# Update source packages
$brew update
$brew upgrade

# Update binary packages
$brew upgrade --cask

# Clean up
$brew cleanup -s
