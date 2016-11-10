DOTFILES := $(shell pwd)

.PHONY: install \
	install-bash \
	install-gdb \
	install-git \
	install-nano \
	install-psql \
	install-sqlite \
	install-sublime \
	install-tmux \
	install-vim \
	install-weechat

all: install

install:
	install-bash \
	install-gdb \
	install-git \
	install-nano \
	install-psql \
	install-sqlite \
	install-sublime \
	install-tmux \
	install-vim \
	install-weechat

install-bash:
	@echo "Symlinking bash files"
	ln -s $(DOTFILES)/shell/bash_aliases ~/.bash_aliases
	ln -s $(DOTFILES)/shell/bash_exports ~/.bash_exports
	ln -s $(DOTFILES)/shell/bash_functions ~/.bash_functions
	ln -s $(DOTFILES)/shell/bash_options ~/.bash_options
	ln -s $(DOTFILES)/shell/bash_profile ~/.bash_profile
	ln -s $(DOTFILES)/shell/bash_prompt ~/.bash_prompt
	ln -s $(DOTFILES)/shell/bashrc ~/.bashrc
	ln -s $(DOTFILES)/shell/dircolors ~/.dircolors
	ln -s $(DOTFILES)/shell/inputrc ~/.inputrc

install-gdb:
	@echo "Symlinking gdb files"
	ln -s $(DOTFILES)/gdb/gdbinit ~/.gdbinit

install-git:
	@echo "Symlinking git files"
	ln -s $(DOTFILES)/git/gitconfig ~/.gitconfig
	ln -s $(DOTFILES)/git/gitignore ~/.gitignore

install-nano:
	@echo "Symlinking nano files"
	ln -s $(DOTFILES)/nano/.nano ~/.nano
	ln -s $(DOTFILES)/nano/nanorc ~/.nanorc

install-psql:
	@echo "Symlinking psql files"
	ln -s $(DOTFILES)/psql/psqlrc ~/.psqlrc

install-sqlite:
	@echo "Symlinking sqlite files"
	ln -s $(DOTFILES)/sqlite/sqliterc ~/.sqliterc

install-sublime:
	@echo "Symlinking Sublime files"
	ln -s $(DOTFILES)/subl/User ~/.config/sublime-text-3/Packages/User

install-tmux:
	@echo "Symlinking tmux files"
	ln -s $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf

install-vim:
	@echo "Symlinking vim files"
	ln -s $(DOTFILES)/vim/.vim ~/.vim
	ln -s $(DOTFILES)/vim/vimrc ~/.vimrc

install-weechat:
	@echo "Symlinking weechat files"
	ln -s $(DOTFILES)/weechat/.weechat ~/.weechat
