# ALL HAIL THE NEW VIM
alias vim="nvim"
export VISUAL=nvim
export EDITOR=nvim
vf() {
    nvim $(fzf --preview="cat {}")
}

# QUICK JUMP TO TEXT FILES
alias todo="vim ~/Dropbox/txt/todo.md"
alias books="vim ~/Dropbox/txt/reading.txt"
alias food="vim ~/Dropbox/txt/food-suggestions.txt"
alias linux="vim ~/Dropbox/linux/linux.txt"

# NOTES
alias note="~/Dropbox/linux/shell-scripts/note.sh"
notes() {
    nvim $(find ~/Dropbox/txt/notebook/*.md | fzf --preview="cat {}")
}

# RENDER MARKDOWN
alias fread="~/Dropbox/linux/shell-scripts/fread.sh"

# GIT
alias st="git status"
alias cm="git commit -m"
alias cam="git commit -am"

# YOUTUBE-DL
alias dlm='youtube-dl -f mp4 -o "~/Downloads/%(title)s.%(ext)s"'
alias dla='youtube-dl -x --audio-format=flac -o "~/Downloads/%(title)s.%(ext)s"' 

# MY PUBLIC IP
alias myip="curl ipinfo.io/ip"

# PROCESS TABLE SEARCH

