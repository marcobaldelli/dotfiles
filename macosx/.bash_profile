beep() {
    afplay /System/Library/Sounds/Glass.aiff
}

s() {
    sleep "$1" && beep
}

myip() {
    ifconfig en0 | grep 'inet ' | cut -d ' ' -f 2
}

_youtubedl() {
    declare -r url="$1"
    declare -r format="${2:-bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best}"
    declare -r download_dir="$HOME/Downloads/_youtube-backlog"
    (cd "$download_dir" && youtube-dl -f "$format" "$url")
}

_youtubedl_audio () {
    declare -r url="$1"
    declare -r format='bestaudio[ext=m4a]'
    _youtubedl "$url" "$format"
}

export PS1="\n\[\e[32;1m\][\u@\H \W]\$ \[\e[0m\]"
export PATH="~/bin:$PATH"

alias ftp_start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist && echo "Serving FTP from IP address $(myip)"'
alias ftp_stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
alias grep='grep --color'
alias ll='ls -l'
alias ls='ls -GF'
alias nettop='nettop -dP'
alias notify="terminal-notifier -sound default -message $1"
alias rand='echo $(($RANDOM % 100))'
alias t="tree -C -a -I '.git|.DS_Store' --noreport"
alias wiki='cd ~/Documents/Wiki/src'
alias yt='_youtubedl'
alias yta='_youtubedl_audio'

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
