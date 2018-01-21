#!/bin/bash
set -eu -o pipefail

# Update source packages
brew update
brew upgrade
brew cleanup

# Update binary packages
brew cask upgrade --greedy
brew cask cleanup
