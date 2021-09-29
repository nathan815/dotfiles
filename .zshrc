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

autoload -U select-word-style
select-word-style bash

# Add iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
