#!/bin/bash
set -eu -o pipefail
brew=/usr/local/bin/brew

# Update source packages
$brew update
$brew upgrade -y

# Update binary packages
$brew upgrade --cask --greedy -y

# Clean up
#$brew cleanup -s
$brew cleanup --prune=all
