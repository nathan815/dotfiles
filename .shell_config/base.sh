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
# Lazy-load NVM so shell stays fast
export NVM_DIR="$HOME/.nvm"

load_nvm() {
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

nvm() { load_nvm; nvm "$@"; }
node() { load_nvm; node "$@"; }
npm() { load_nvm; npm "$@"; }
npx() { load_nvm; npx "$@"; }


# heroku autocomplete setup
#HEROKU_AC_BASH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# Go
export PATH="$PATH:$HOME/go/bin"
