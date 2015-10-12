

SHELL := /bin/bash
PWD ?= $(shell pwd)

install: install-bin install-git install-vim

install-bin:
	@mkdir -p ~/bin/
	@ln -fs $(PWD)/bin/* ~/bin/

install-git:
	@ln -fs $(PWD)/git/gitconfig ~/.gitconfig
	@curl -o ~/.git-completion.bash https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL

install-vim:
	@ln -fs $(PWD)/vimrc ~/.vimrc
	@ln -fs $(PWD)/vim ~/.vim
	@vim +PlugInstall +qall

install-bash:
	@ln -fs $(PWD)/bash/bashrc ~/.bash_profile
	@ln -fs ~/.bash_profile ~/.bashrc
	@if [ $$(uname) == "Darwin" ]; then ln -fs $(PWD)/bash/osx_profile ~/.osx_profile; fi
