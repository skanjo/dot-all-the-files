if [ -d "/opt/homebrew/bin" ] ; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -s ~/.bashrc ]; then
    source ~/.bashrc
fi
