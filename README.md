Existing home directory
=======================
~~~~
$ cd
$ git init
$ git remote add origin https://nakaomote@github.com/nakaomote/dotfiles
$ git fetch origin
$ git checkout -b server origin/server
~~~~

Git Setup
=========
~~~~
$ git config -f .gitconfig.local --add user.email "omg@omg.com"
$ git config -f .gitconfig.local --add user.name "John Smith"
~~~~

Bundle
=========
~~~~
$ export http_proxy="YOURPROXY"
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
~~~~

Open vim and run:
:PluginInstall
