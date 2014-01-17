function virtualenv_prompt_info() {
    if [[ -n "${VIRTUAL_ENV}" ]]; then
        VIRTUALENV_NAME=${${VIRTUAL_ENV}:t}
        echo "${ZSH_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUALENV_NAME}${ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX}"
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
