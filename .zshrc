

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=3000

setopt share_history
setopt prompt_subst

export SCREENDIR=~/dot-files/.screendir

export CLICOLOR=1

export DYLD_LIBRARY_PATH=`echo /usr/local/Cellar/*/*/lib|perl -ne 's/\s+/:/g;print'`


# import zsh completions
fpath=(/usr/share/zsh/5.3/fuctions/ $fpath)
autoload -Uz compinit vcs_info
compinit -u


function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# black red green yellow blue magenta cyan white

# vcs
zstyle ':vcs_info:*' formats '[%s|%b]'
zstyle ':vcs_info:*' actionformats '[%s|%b(%F{red}%a%f)]'
precmd() { vcs_info }

PROMPT="%F{magenta}%n%f@%F{yellow}%m%f: %3~%f > "
RPS1='${vcs_info_msg_0_} %F{yellow}%D %T%f'

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

