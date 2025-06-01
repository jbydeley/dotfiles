# Display
alias ls="ls --color"
alias l="ls -lah"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias z="cd"

# Git
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gs="git status --short"

alias ga="git add --patch"
alias gc="git commit"

alias gp="git push"
alias gu="git pull"

alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(yellow)%G?%C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias gco="git checkout"

alias gi="git init"
alias gcl="git clone"

# Tmux
alias tn="tmux new-session -s"
alias tl="tmux list-sessions"
alias ta="tmux attach-session"

