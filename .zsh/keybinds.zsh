# Press up / down to navigate history with search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Alternative key bindings if the above don't work
bindkey "^[OA" history-search-backward
bindkey "^[OB" history-search-forward

# For Ctrl + Left Arrow (backward-word)
bindkey '^[[1;5D' backward-word
bindkey '^[[5D' backward-word # Another common one

# For Ctrl + Right Arrow (forward-word)
bindkey '^[[1;5C' forward-word
bindkey '^[[5C' forward-word # Another common one

