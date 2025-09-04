export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

export EDITOR=nvim
export VISUAL="$EDITOR"
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="afowler"
# ZSH_THEME="lambda"
ZSH_THEME="gearworks"

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

eval "$(zoxide init zsh)"
eval "$(ssh-agent)" > /dev/null

alias cat="bat"
alias vim="nvim"
alias ls="eza --git"
alias vimconf="pushd ~/.config/nvim >/dev/null; nvim; popd >/dev/null"
alias cd="z"
alias open="xdg-open"
alias fetch="fastfetch"

# Turso
export PATH="$PATH:/home/tom/.turso"

export PATH="$PATH:/home/tom/.local/bin/odin"
export PATH="$PATH:/home/tom/.local/bin/smlnj/bin"
export PATH="$PATH:/home/tom/.local/wine-proton-10.0-1-amd64/bin"
export CCACHE_DISABLE=1
