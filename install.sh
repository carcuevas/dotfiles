if command -v curl > /dev/null; then
  COMMAND='curl -fsSL'
else
  COMMAND='wget -O -'
fi

# Oh My Zsh
sh -c "$($COMMAND https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Pyenv
sh -c "$($COMMAND https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer)"

# nvm
sh -c "$($COMMAND https://raw.githubusercontent.com/creationix/nvm/master/install.sh)"

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
  sh -c "~/.tmux/plugins/tpm/bin/install_plugins"
