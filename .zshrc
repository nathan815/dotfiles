function load_config() {
	if [ -f $1 ]; then
    		source $1
	else
    		print "[~/.zshrc] config file not found: $1"
	fi
}

load_config ~/.zsh/completion
load_config ~/.zsh/aliases
load_config ~/.zsh/functions
load_config ~/.zsh/prompt

autoload -U select-word-style
select-word-style bash

# Composer
export PATH="~/.composer/vendor/bin:$PATH"

# Node Version Manager
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Set Spaceship ZSH as a prompt
#export SPACESHIP_PACKAGE_SHOW=false
#autoload -U promptinit; promptinit
#prompt spaceship

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

