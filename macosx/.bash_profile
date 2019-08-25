beep() {
    afplay /System/Library/Sounds/Glass.aiff
}

f() {
    declare -r pattern="$1"
    find . -type "f" -iname "*${pattern}*"
}

s() {
    declare -r seconds="$1"
    sleep "$seconds" && beep
}

myip() {
    ifconfig en0 | grep 'inet ' | cut -d ' ' -f 2
}

qrcode() {
    qrencode "$1" -o /tmp/qrcode.png && open /tmp/qrcode.png
}

__youtubedl() {
    declare -r url="$1"
    declare -r format="${2:-bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best}"
    declare -r download_dir="$HOME/Downloads/_youtube-backlog"
    (cd "$download_dir" && youtube-dl -f "$format" "$url")
}

__youtubedl_audio_only () {
    declare -r url="$1"
    declare -r format='bestaudio[ext=m4a]'
    __youtubedl "$url" "$format"
}

export PS1='\n\[\e[32;1m\][\u@\h \W]\$ \[\e[0m\]'
export PATH="$HOME/bin:$PATH"

alias ag='ag --hidden'
alias ftp_start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist && echo "Serving FTP from IP address $(myip)"'
alias ftp_stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
alias grep='grep --color'
alias ll='ls -l'
alias ls='ls -GF'
alias nettop='nettop -dP'
alias notify='terminal-notifier -sound default -message'
alias rand='echo $(($RANDOM % 100))'
alias t="tree -C -a -I '.git|.DS_Store' --noreport"
alias wiki='cd ~/Documents/Wiki/src'
alias yt='__youtubedl'
alias yta='__youtubedl_audio_only'

# brew install bash-completion
# shellcheck source=/dev/null
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi

# bash history configuration
#export HISTIGNORE="ls:ll:cd:pwd"
export HISTFILESIZE=50000
export HISTSIZE=50000
export HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="[$(tput setaf 6)%F %T$(tput sgr0)]: " # colorful date
export HISTTIMEFORMAT

# for ipython
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fixes crontab -e
export EDITOR=vim
