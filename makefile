

SHELL := /bin/bash
PWD ?= $(shell pwd)

install: install-bin install-git install-vim install-bash

install-bin:
	@mkdir -p ~/bin/
	@ln -fs $(PWD)/bin/* ~/bin/

install-git:
	@ln -fs $(PWD)/git/gitconfig ~/.gitconfig
	@curl -o ~/.git-completion.bash https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL

install-vim:
	@ln -fs $(PWD)/vimrc ~/.vimrc
	@mkdir -p ~/.vim
	@rm -rf ~/.vim/autoload
	@rm -rf ~/.vim/colors
	@rm -rf ~/.vim/syntax
	@ln -fs $(PWD)/vim/autoload ~/.vim/autoload
	@ln -fs $(PWD)/vim/colors ~/.vim/colors
	@ln -fs $(PWD)/vim/syntax ~/.vim/syntax
	@vim +PlugInstall +qall

install-bash:
	@ln -fs $(PWD)/bash/bashrc ~/.bash_profile
	@ln -fs ~/.bash_profile ~/.bashrc
	@if [ $$(uname) == "Darwin" ]; then ln -fs $(PWD)/bash/osx_profile ~/.osx_profile; fi
