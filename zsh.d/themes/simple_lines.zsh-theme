local return_status="%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ %s)"
local basic_info="$FG[202]%n$reset_color on $FG[001]%m$reset_color in $FG[107]%~$reset_color"

function meta_prompt_info() {
    local prompt_metainfo_cmds
    prompt_metainfo_cmds=('git_prompt_info' 'virtualenv_prompt_info')

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
        echo "($metainfo)"
    fi
}

# Unicode: BULLET U+2022
# Unicode: MIDDLE DOT U+00B7
# Unicode: WAVY DASH U+3030
# Unicode: WAVY LINE U+2307
# Unicode: WAVE DASH U+301C
# Unicode: BLACK STAR U+2605

function bjs__prompt_line() {
    env COLUMNS="${COLUMNS:-$(tput cols)}" perl -Mutf8 -CS -e 'my $width= $ENV{COLUMNS}; printf "%.${width}s", "\N{U+00B7}" x $ENV{COLUMNS};'
}


PROMPT='%{$(bjs__prompt_line)
$reset_color${basic_info} $(meta_prompt_info)%{$reset_color%}
%}${return_status}%{$reset_color%} '

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="virtualenv:%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}'%{$fg[default]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[default]%}"

# vim:set ft=zsh:
