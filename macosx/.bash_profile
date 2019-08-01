beep() {
    afplay /System/Library/Sounds/Glass.aiff
}

s() {
    sleep "$1" && beep
}

myip() {
    ifconfig en0 | grep 'inet ' | cut -d ' ' -f 2
}

yt() {
    (cd ~/Downloads/_youtube-backlog && youtube-dl "$@")
}

yta() {
    (cd ~/Downloads/_youtube-backlog && youtube-dl -f 140 "$@")
}

export PS1="\n\[\e[32;1m\][\u@\H \W]\$ \[\e[0m\]"
export PATH="~/bin:$PATH"

alias ls='ls -GF'
alias ll='ls -l'
alias grep='grep --color'
alias rand='echo $(($RANDOM % 100))'
alias notify="terminal-notifier -sound default -message $1"
alias nettop='nettop -dP'
alias ftp_start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist && echo "Serving FTP from IP address $(myip)"'
alias ftp_stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
alias wiki='cd ~/Documents/Wiki/src'

# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# bash history configuration
#export HISTIGNORE="ls:ll:cd:pwd"
export HISTFILESIZE=50000
export HISTSIZE=50000
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="[$(tput setaf 6)%F %T$(tput sgr0)]: " # colorful date

# for ipython
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fixes crontab -e
export EDITOR=vim
