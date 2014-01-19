# Keys
# ~~~~

bindkey -e

bindkey '\C-w' vi-backward-kill-word
bindkey '\M-w' backward-kill-word

case $TERM in
    rxvt*|urxvt*)
        bindkey '^?' backward-delete-char
        bindkey '\e[1~' beginning-of-line
        bindkey '\e[4~' end-of-line
        bindkey '\e[5~' up-line-or-history
        bindkey '\e[3~' delete-char
        bindkey '\e[6~' down-line-or-history
        bindkey '\e[A' up-line-or-search
        bindkey '\e[D' backward-char
        bindkey '\e[B' down-line-or-search
        bindkey '\e[C' forward-char
        bindkey '\e[2~' overwrite-mode
        bindkey '\e[1;5C' forward-word
        bindkey '\e[1;5D' backward-word
        #bindkey '\e[7~' beginning-of-line
        #bindkey '\e[8~' end-of-line
        ;;
    *)
        ;;
esac

# vim:set ft=zsh:
