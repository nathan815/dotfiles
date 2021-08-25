source ~/.shell_config/base.sh

load_config ~/.bash/prompt.sh

function reload() {
    source ~/.bashrc
    echo "Reloaded from ~/.bashrc"
}

# Add iTerm2 Shell Integration
export ITERM2_SQUELCH_MARK=1
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
