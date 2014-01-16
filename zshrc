export PIP_REQUIRE_VIRTUALENV=true
export PROMPT="%F{blue}%n%f@%F{magenta}%m%f %F{green}%~%f %% "
export EDITOR=vim VISUAL=vim

#export PATH="$PATH:$HOME/bin"


bindkey -e

alias ll='ls -l'
alias rsync='rsync --max-size=200M --modify-window=2'

term_title() {
    echo -ne "\e];$*\a"
}
alias stt='term_title'

syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
