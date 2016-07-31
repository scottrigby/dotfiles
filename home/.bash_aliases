alias ll='ls -lah'

# Keep command handy until the issue is fixed upstream.
# See https://github.com/geerlingguy/ansible-role-homebrew/issues/18 
alias mdp_fix='sudo chown -R $(whoami):admin /usr/local'

alias mdp='ansible-playbook main.yml -i inventory --ask-sudo-pass'

