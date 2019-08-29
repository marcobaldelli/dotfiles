f() {
    declare -r pattern="$1"
    find . -type "f" -iname "*${pattern}*"
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
    declare -r format='bestaudio[ext=m4a]/bestaudio'
    __youtubedl "$url" "$format"
}

alias ag='ag --hidden'
alias cat='bat'
alias gd='git diff'
alias gdc='git diff --cached'
alias grep='grep --color=auto'
alias gs='git status'
alias ll='ls -l --color=auto'
alias ls='ls -GF --color=auto'
alias ncdu='ncdu --color dark'
alias nettop='nettop -dP'
alias notify='terminal-notifier -sound default -message'
alias rand='echo $(($RANDOM % 100))'
alias t="tree -C -a -I '.git|.DS_Store' --noreport"
alias wiki='cd ~/Documents/Wiki/src'
alias yt='__youtubedl'
alias yta='__youtubedl_audio_only'
