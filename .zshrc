# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZSH HOME
export ZSH=$HOME/.config/zsh

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS


### ---- theme config -------------------------------------
## source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

### ---- plugins config -------------------------------------

source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $ZSH/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh




## Bindings 

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey -M viins '^[[Z' autosuggest-accept 
#bindkey -M vicmd '^[[Z' autosuggest-accept

# VIM
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk


# aliases
#
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

com() {
  git add .
  git commit -m $1
  git push
}


# opam configuration
[[ ! -r /Users/kevingruber/.opam/opam-init/init.zsh ]] || source /Users/kevingruber/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
