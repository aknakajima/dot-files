export CLICOLOR=1




# import zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)









# git completion
zstyle ':completion:*:*:git:*' script ~/.zdot_files/.git-completion.zsh
. /usr/local/etc/bash_completion.d/git-completion.bash



function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '>'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# black red green yellow blue magenta cyan white

export PROMPT="%F{magenta}%n%f@%F{yellow}%m%f: %3~ $(prompt_char) "
export RPS1="%D %T"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{green}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{green}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZLE_RPROMPT_INDENT=0
