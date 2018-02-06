#!/bin/bash
set -eu -o pipefail
brew=/usr/local/bin/brew

# Update source packages
$brew update
$brew upgrade
$brew cleanup

# Update binary packages
$brew cask upgrade --greedy
$brew cask cleanup
