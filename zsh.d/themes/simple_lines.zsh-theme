local return_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local basic_info="$FG[202]%n$reset_color on $FG[001]%m$reset_color in $FG[107]%~$reset_color"

function meta_prompt_info() {
    local metainfo
    set -A metainfo "$(git_prompt_info)" "$(virtualenv_prompt_info)"

    metainfo=${${(pj: :)metainfo}%%[[:space:]]}
    if [[ -n "$metainfo" ]]; then
        echo "($metainfo)"
    fi
}

PROMPT='%{${basic_info} $(meta_prompt_info)%{$reset_color%}
%}${return_status}%{$reset_color%} '

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="virtualenv:%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}'%{$fg[default]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[default]%}"

# vim:set ft=zsh:
