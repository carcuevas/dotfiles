BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
ROOT=$(dirname "$BASE")

source "$ROOT/utils.sh"

# TO DO: install: alols/xcape (github), 
    # gnome-tweak-tool (try to use xmodmap)

# TO DO: Configure caps lock:
# 1. swap caps and ctrl with gnome-tweak-tool or any other tool
# xcape -e '#66=Escape' # if gnome-tweak-tool
# xcape -e 'Control_L=Escape' # else

info 'Updating apt-get packages...'
sudo apt-get update

info 'Installing apt-get packages...'
packages_batch "sudo apt-get" "-y install"

# TODO (romeira): install virtualenv && virtualenvwrapper locally {06/12/15 05:14}
# info 'Installing python packages...'
# packages_batch pip install
