#!/bin/bash
set -eu -o pipefail

# Terminal: disable "Show Mark" option
defaults write com.apple.Terminal ShowLineMarks -int 0

# Fix font rendering for non-retina displays (since macOS 10.14 Mojave)
defaults write -globalDomain AppleFontSmoothing -int 3
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false
