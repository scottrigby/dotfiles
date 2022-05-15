autoload -Uz compinit
compinit
source <(kubectl completion zsh)

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

eval "$(starship init zsh)"

# https://gist.github.com/scottrigby/0c043c0bfbbdb5949e2d824fc3adeaa4
git() {
	setopt local_options extended_glob unset
	local -i i=$argv[(i)^-*]
	case $argv[i] in
		commit) argv[i+1,i]=(--signoff);;
	esac
	command git "$@"
}

# Better search history. Alternatively use https://github.com/zsh-users/zsh-history-substring-search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
