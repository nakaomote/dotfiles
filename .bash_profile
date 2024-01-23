# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# My 'bin'
PATH=$PATH:$HOME/bin
# Rancher
PATH="/Users/william.fletcher/.rd/bin:$PATH"

export PATH
