#!/usr/bin/env bash

# TO DO: attach a date+count to the backup file
# TO DO: dinamically construct packages array
# TO DO: optionally pass specific packages by argument
# TO DO: argument to see an output preview (don't do anything)
# TO DO: generate log

EXEC=true # Set to false to see an output preview (don't execute)

BASE=$(pwd)
case "$(uname -a)" in
  *[Dd]arwin* ) OS="osx" ;;
  *[Uu]buntu* ) OS="ubuntu" ;;
  *           ) OS= ;;
esac

# Packages represent folders that contains files/dirs
# to symlink and/or install.sh files to execute.
PACKAGES=($BASE $OS vim)

set -e

#####################
#  Status Messages  #
#####################

boot() {
  printf "\r[ \033[00;35m--\033[0m ] $1\n"
}

info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

warning() {
  printf "\r  [ \033[0;33m!!\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

skip() {
  printf "\r  [ \033[00;30m>>\033[0m ] $1\n"
}

#############################
#  Link & Install Packages  #
#############################

link_files() {
  info "linking files from $1"
  for src in $(find -H "$1" -maxdepth 1 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"

    if [ -L "$dst" ] && [ "$(readlink $dst)" -ef "$src" ]; then
      skip "skipped $dst"
      continue
    fi

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
      $EXEC && mv "$dst" "${dst}.backup"
      warning "moved $dst to ${dst}.backup"
    fi

    $EXEC && ln -s "$src" "$dst"
    success "linked $src to $dst"
  done
}

run_installation() {
  info "running installation at $1"
  if [ -f $1/install.sh ]; then
    $EXEC && source $1/install.sh
    success "done $1/install.sh"
  fi
}

echo 'bootstrapping...'

for package in ${PACKAGES[@]}; do
  echo ''
  boot "$(basename $package)"

  if [[ $package != $BASE ]]; then
    package="$BASE/$package"
  fi
  link_files $package
  run_installation $package
done

echo ''
echo 'done.'
