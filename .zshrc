source ~/.shell_config/base.sh

function reload() {
    source ~/.zshrc
    echo "Reloaded from ~/.zshrc"
}

load_config ~/.zsh/completion.zsh
load_config ~/.zsh/prompt.zsh
load_config ~/.zsh/secrets.zsh

SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history
setopt histignorealldups

autoload -U select-word-style
select-word-style bash

# Add iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  #tea

# Created by `pipx` on 2023-11-27 04:59:17
export PATH="$PATH:/Users/nathan/.local/bin"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/nathan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
