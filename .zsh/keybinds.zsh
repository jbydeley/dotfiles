bindkey -e

# Press up / down to navigate history with search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Alternative key bindings if the above don't work
bindkey "^[OA" history-search-backward
bindkey "^[OB" history-search-forward