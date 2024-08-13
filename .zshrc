# brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# see above
# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
#autoload -Uz compinit
#compinit

# https://www.thorsten-hans.com/autocompletion-for-kubectl-and-aliases-using-oh-my-zsh/
# source <(kubectl completion zsh)
alias k="kubectl"
plugins=(kubectl)

alias kctx="kubectx"
alias kns="kubens"

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

#eval "$(starship init zsh)"

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

# Switch from current version of Go to 1.17 for Helm dev
# 	brew install go@1.17
#	brew unlink go
#	brew link go@1.17
# Ignore this message when installing go@1.17:
# 	PATH="/usr/local/opt/go@1.17/bin:$PATH"

source $HOME/.cargo/env

eval "$(zoxide init zsh)"

export PATH="${PATH}:${HOME}/.krew/bin"

# https://askubuntu.com/questions/1298778/watch-command-doesnt-work-on-alias
alias watch='watch '

# Needed for Pulumi CLI
# Source https://stackoverflow.com/a/74148162
export DOCKER_HOST=unix:///Users/$USER/Library/Containers/com.docker.docker/Data/docker.raw.sock

# gke-gcloud-auth-plugin
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# python 3, when we don't also need python2
alias pip="pip3"
alias python="python3"

# Go
export PATH=$PATH:$(go env GOPATH)/bin
