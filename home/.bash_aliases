alias ll='ls -lah'

# Keep command handy until the issue is fixed upstream.
# See https://github.com/geerlingguy/ansible-role-homebrew/issues/18 
alias mdp_fix='sudo chown -R $(whoami):admin /usr/local'

alias mdp='ansible-playbook main.yml -i inventory --ask-sudo-pass'

# Control visibility of Mac OS hidden files.
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
