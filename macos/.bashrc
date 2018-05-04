if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  source "/usr/local/etc/bash_completion.d/git-completion.bash"
fi

ulimit -n 4096

alias md5sum='md5 -r'
alias ll="ls -al"


