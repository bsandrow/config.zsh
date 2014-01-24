# ---------
# OH MY ZSH
# ---------

export ZSH=$HOME/.oh-my-zsh         # oh-my-zsh config directory
export ZSH_CUSTOM="$HOME/.zsh.d"    # oh-my-zsh customization directory

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pyre"

# CASE_SENSITIVE="true"             # case-sensitive completion
# DISABLE_AUTO_UPDATE="true"        # Disable auto-update
export UPDATE_ZSH_DAYS=30           # Up
# DISABLE_LS_COLORS="true"            # Disable colors in ls
# DISABLE_AUTO_TITLE="true"           # disable automatic setting of terminal title
# DISABLE_CORRECTION="true"           # Disable command autocorrection
# COMPLETION_WAITING_DOTS="true"      # Display red dots while waiting for completion?

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Don't automatically attempt to load virtualenvs when cd'ing around.
DISABLE_VENV_CD=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew fabric git virtualenv virtualenvwrapper tmuxinator pip python vundle)

source $ZSH/oh-my-zsh.sh

# ------------------
# User Configuration
# ------------------

export PATH=$HOME/bin:/usr/local/bin:$PATH

setopt NOBEEP       # No more beeps! Huzzah! \o/
setopt NO_NOMATCH   # Don't die when a glob expansion matches no files

export EDITOR=vim
export VISUAL=vim

# Make pip require that a VirtualEnv is set, but create the 'syspip' command
# quickly override that if we need to.
export PIP_REQUIRE_VIRTUALENV=true
function syspip() { PIP_REQUIRE_VIRTUALENV="" pip "$@"; }

export WORKON_HOME="$HOME/.virtualenvs"

function nginx_referer() {
    local logfile="$1"
    local pager="${PAGER:-less}"
    awk '{ print $11 }' < "$logfile" | sort | uniq -c | sort -nr | "$pager"
}

# export MANPATH="/usr/local/man:$MANPATH"
