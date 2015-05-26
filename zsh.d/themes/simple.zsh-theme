# local return_code="%(?:%{$fg[green]%}(^.^%):%{%B$fg[red]%}(T.T%))%{$reset_color%}"
local return_code="%(?.%{$fg[green]%}:%).%{%B$fg[red]%}:()%{$reset_color%b%}"

function meta_prompt_info() {
    local prompt_metainfo_cmds
    prompt_metainfo_cmds=('git_prompt_info' 'virtualenv_prompt_info' 'host_info')

    if type sowingo_info >/dev/null 2>&1; then
        prompt_metainfo_cmds+=('sowingo_info')
    fi

    local metainfo
    local RESULT
    local part
    metainfo=()
    for part in $prompt_metainfo_cmds; do
        RESULT="$($part)"
        if [ "$?" = "0" -a -n "$RESULT" ]; then
            metainfo+=("$RESULT")
        fi
    done

    metainfo=${(pj: :)metainfo}

    # remove trailing spaces
    metainfo=${metainfo%%[[:space:]](#c1,)}

    # remove preceeding spaces
    metainfo=${metainfo##[[:space:]](#c1,)}

    if [[ -n "$metainfo" ]]; then
        echo "$metainfo"
    fi
}

function host_info() {
    if [ -n "$SSH_CONNECTION" ]; then
        echo $HOST_INFO_THEME
    fi
}

# Unicode: BULLET U+2022
# Unicode: MIDDLE DOT U+00B7
# Unicode: WAVY DASH U+3030
# Unicode: WAVY LINE U+2307
# Unicode: WAVE DASH U+301C
# Unicode: BLACK STAR U+2605

PROMPT='$FG[107]%2/%{$reset_color%} $return_code '
RPROMPT='$(meta_prompt_info)%{$reset_color%}'

HOST_INFO_THEME="host:%{$fg[red]%}%m%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="v:%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="g:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}'%{$fg[default]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[default]%}"

# vim:set ft=zsh:
