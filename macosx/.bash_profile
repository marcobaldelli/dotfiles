# settings common to linux and macOS
[ -f ./.bash_aliases ] && . ./.bash_aliases
[ -f ./.bash_exports ] && . ./.bash_exports
[ -f ./.bash_prompt ] && . ./.bash_prompt

# macOS specific settings

beep() {
    afplay /System/Library/Sounds/Glass.aiff
}

s() {
    declare -r seconds="$1"
    sleep "$seconds" && beep
}

# brew install bash-completion
# shellcheck source=/dev/null
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi
