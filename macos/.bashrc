# Environment

# Opt-out of Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Opt-out of Cloudflar analytics
export CREATE_CLOUDFLARE_TELEMETRY_DISABLED=1

export EDITOR='subl -w'

# Auto enable Corepack when ASDF installs new NodeJS version
export ASDF_NODEJS_AUTO_ENABLE_COREPACK=1

if [ -d "/opt/homebrew/bin" ] ; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# LM Studio CLI (lms)
if [ -d "$HOME/.lmstudio/bin" ] ; then
  export PATH="$HOME/.lmstudio/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# 1Password SSH Agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# JetBrains Toolbox scripts
export PATH="$PATH:/Users/samer/Library/Application Support/JetBrains/Toolbox/scripts"

# LM Studio
export PATH="$PATH:/Users/samer/.lmstudio/bin"


# ulimit -n 1048576


# Useful aliases
alias ll="ls -al"
alias la="ls -lAh"
alias md5sum='md5 -r'


# Prompt
export PS1="\u@\h \w $ "

if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
  source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi


# History
set -o history
shopt -s histappend
SHELL_SESSION_HISTORY=0
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL='ignorespace'
export HISTIGNORE="exit:history:ll:la"
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"


# Source bash completion if available
if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
  source /opt/homebrew/etc/profile.d/bash_completion.sh
fi


# asdf configuration
source /opt/homebrew/opt/asdf/libexec/asdf.sh
