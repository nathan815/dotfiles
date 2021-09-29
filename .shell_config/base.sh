function load_config() {
	file="$1"
	if [ -f $file ]; then
        source $file
	else
        print "Error: config file not found: $file"
	fi
}

load_config ~/.shell_config/aliases.sh
load_config ~/.shell_config/functions.sh

# Android
export PATH="$PATH:/usr/local/bin:~/Library/Android/sdk:~/Library/Android/sdk/platform-tools"

# Composer (PHP)
export PATH="$PATH:~/.composer/vendor/bin"

# Ruby
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

# Node Version Manager
# Lazy load it to keep shell startup fast
function nvm() {
	if [ "$NVM_DIR" = "" ]; then
		echo "loading nvm..."
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	fi
	nvm "$@"
}

# Set our default node version here
NODE_VERSION="v15.14.0"
export PATH="$HOME/.nvm/versions/node/$NODE_VERSION/bin:$PATH"

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
