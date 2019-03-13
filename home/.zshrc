source $HOME/.zplug/init.zsh

# To manage zplug itself like other packages
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Editor
export EDITOR=vim

# Plugins from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug 'plugins/colored-man-pages', from:oh-my-zsh

# Homeshick
zplug "andsens/homeshick", use:"homeshick.sh", defer:0
zplug "andsens/homeshick", use:"completions", defer:2

# Syntax highlighting for commands, load last
# https://github.com/zsh-users/zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# Theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, as:theme
SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_COLOR="red"
SPACESHIP_USER_SHOW="always"
SPACESHIP_DIR_SHOW="true"
SPACESHIP_DIR_TRUNC_REPO="false"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH=~/.local/bin:$PATH

source $HOME/.aliases

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# History Tweaks
#
# The main idea here is to avoid having a bunch of duplicates.
# Additionally, the history size is increased.
#
# See http://zsh.sourceforge.net/Doc/Release/Options.html
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
export HISTFILE=~/.zsh_history # Required when using zplug
export HISTSIZE=10000
export SAVEHIST=10000
setopt share_history
