#!/bin/bash
set -eu -o pipefail

# Terminal: disable "Show Mark" option
defaults write com.apple.Terminal ShowLineMarks -int 0
