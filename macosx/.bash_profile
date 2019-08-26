[ -f "${HOME}/.bash_aliases" ] && . "${HOME}/.bash_aliases"

beep() {
    afplay /System/Library/Sounds/Glass.aiff
}

s() {
    declare -r seconds="$1"
    sleep "$seconds" && beep
}

export PS1='\n\[\e[32;1m\][\u@\h \W]\$ \[\e[0m\]'
export PATH="$HOME/bin:$PATH"

# brew install bash-completion
# shellcheck source=/dev/null
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi

# bash history configuration
export HISTFILESIZE=50000
export HISTSIZE=50000
export HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="[%F %T]: " && export HISTTIMEFORMAT

# for ipython
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fixes crontab -e
export EDITOR=vim
