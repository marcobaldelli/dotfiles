# settings common to linux and macOS
# shellcheck source=/dev/null
[ -f "${HOME}/.bash_aliases" ] && . "${HOME}/.bash_aliases"
[ -f "${HOME}/.bash_exports" ] && . "${HOME}/.bash_exports"
[ -f "${HOME}/.bash_prompt"  ] && . "${HOME}/.bash_prompt"

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
