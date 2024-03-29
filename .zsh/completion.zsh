# Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Heroku completion
HEROKU_AC_BASH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PA

# ZSH Completion inline
#export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
