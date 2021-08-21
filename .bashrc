source ~/.shell_config/base.sh

load_config ~/.bash/prompt.sh

function reload() {
    source ~/.bashrc
    echo "Reloaded from ~/.bashrc"
}

# Prompt
export PS1="\w $ "

# Add iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
