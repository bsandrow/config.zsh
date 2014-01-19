
export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'

export LESS='-iMR'
#export LESSCHATSET=latin1

if which vim >/dev/null 2>&1; then
    export VISUAL='vi' EDITOR='vi'
fi

if which lesspipe >/dev/null 2>&1; then
    eval "$(lesspipe)"
fi

XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/.cache}
XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

# vim:set ft=zsh:
