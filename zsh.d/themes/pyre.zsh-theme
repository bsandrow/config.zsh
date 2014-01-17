local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status} %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(meta_prompt_info)%{$fg_bold[blue]%}%% %{$reset_color%}'

function meta_prompt_info() {
    local metainfo
    set -A metainfo "$(git_prompt_info)" "$(virtualenv_prompt_info)"

    metainfo=${${(pj: :)metainfo}%%[[:space:]]}
    if [[ -n "$metainfo" ]]; then
        echo "$metainfo "
    fi
}

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="(virtualenv:%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_PREFIX="(git:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# vim:set ft=zsh:
