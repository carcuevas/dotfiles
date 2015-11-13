DOT=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

# Aliases
alias l='ls -lGh'
alias la='l -A'
alias tree='tree -C'
alias rm='rm -i'
alias py='python'
alias ipy='ipython'
alias ty='$(which python3) ~/type.py'
alias peekd='dirs -l +1' # Complement to pushd and popd (see without popping)
alias vi='vim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsvirtualenv='lsvirtualenv -b' # Shortens the output
alias yt-mp3='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
alias rsync-mv='rsync -rvhz --progress --size-only --remove-source-files --partial-dir=.rsync-partial'
alias ds='du -s .[!.]* * | sort -rn | cut -f2 | tr "\n" "\0" | xargs -0 du -hsc'
alias sudo='sudo ' # Allows running sudo with aliases
alias today='date "+%Y%m%d"'

# Python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Fuzzy finder (https://github.com/junegunn/fzf)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# N (node version management) (https://github.com/tj/n).
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# Remove duplicates from bash history
export HISTCONTROL=ignoreboth:erasedups
