
export ROO_HOME="${HOME}/Applications/spring-roo-1.3.2.RELEASE"
PATH="${PATH}:${ROO_HOME}/bin:/usr/local/mysql/bin:${HOME}/Applications/gradle-2.10/bin"

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=3000

setopt share_history
setopt promptsubst



export CLICOLOR=1
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home


export RBENV_ROOT=/usr/local/var/rbenv

# import zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)



# git completion
zstyle ':completion:*:*:git:*' script ~/.zdot_files/.git-completion.zsh
. /usr/local/etc/bash_completion.d/git-completion.bash



function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    # hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '>'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# black red green yellow blue magenta cyan white

PROMPT="%F{magenta}%n%f@%F{yellow}%m%f: %3~ \$(prompt_char) "
RPS1="%F{yellow}%D %T%f"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{green}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{green}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZLE_RPROMPT_INDENT=0


man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			man "$@"
}

