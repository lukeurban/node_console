export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export EDITOR=nvim

alias xx="exit"
alias qq="exit"
alias cc="clear"
alias l="ls -l"
alias la="ls -al"
