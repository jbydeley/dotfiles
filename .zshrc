export PATH=$PATH:$HOME/.local/bin

# Set Helix as the default editor
export EDITOR="hx"
export VISUAL="hx"
export SUDO_EDITOR="hx"
export GIT_EDITOR="hx"

if [ -d "$HOME/.fzf" ]; then
  export PATH=$PATH:$HOME/.fzf/bin
fi

if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
fi

source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/keybinds.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/styles.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/git.zsh

# Shell integrations
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fzf --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always -n --line-range :500 {}'"
eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Add any custom overrides and secrets that won't be committed to git. Right? Right.
if [ -d "$HOME/.overrides" ]; then
  for file in $HOME/.overrides/*.zsh; do
    source $file
  done
fi

