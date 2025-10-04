# Useful aliases
alias ll="ls -al"
alias la="ls -lAh"
alias md5sum='md5 -r'

# Custom prompt (optional)
export PS1="\u@\h \w $ "

# History
SHELL_SESSION_HISTORY=0
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"

export GPG_TTY=$(tty)

# Source bash completion if available
if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
  source /opt/homebrew/etc/profile.d/bash_completion.sh
fi

# asdf configuration
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# 1Password SSH Agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
  source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/samer/.lmstudio/bin"
# End of LM Studio CLI section
