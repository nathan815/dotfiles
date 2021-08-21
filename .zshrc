source ~/.dotfiles_base/base.sh

function reload() {
    source ~/.zshrc
    echo "Reloaded from ~/.zshrc"
}

load_config ~/.zsh/completion.zsh
load_config ~/.zsh/prompt.zsh
load_config ~/.zsh/secrets.zsh

autoload -U select-word-style
select-word-style bash

# Add iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
