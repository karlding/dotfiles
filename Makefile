DOTFILES := $(CURDIR)
DOTFILES_DIR := $(DOTFILES)/src
BACKUP_DIR := $(DOTFILES)/backup/

OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG += Windows
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG = Linux
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG = Mac
	endif
endif

.PHONY: install \
	install-bash \
	install-editorconfig \
	install-gdb \
	install-git \
	install-nano \
	install-psql \
	install-sqlite \
	install-sublime \
	install-top \
	install-tmux \
	install-vim \
	install-weechat

all: install

install: install-bash \
	install-editorconfig \
	install-gdb \
	install-git \
	install-nano \
	install-psql \
	install-sqlite \
	install-sublime \
	install-top \
	install-tmux \
	install-vim \
	install-weechat

install-bash:
ifneq ("$(wildcard ~/.bash_aliases)","")
	@echo "Backing up bash_aliases"
	cp ~/.bash_aliases $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bash_exports)","")
	@echo "Backing up bash_exports"
	cp ~/.bash_exports $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bash_functions)","")
	@echo "Backing up bash_functions"
	cp ~/.bash_functions $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bash_options)","")
	@echo "Backing up bash_options"
	cp ~/.bash_options $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bash_profile)","")
	@echo "Backing up bash_profile"
	cp ~/.bash_profile $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bash_prompt)","")
	@echo "Backing up bash_prompt"
	cp ~/.bash_prompt $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bashrc)","")
	@echo "Backing up bashrc"
	cp ~/.bashrc $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.dircolors)","")
	@echo "Backing up dircolors"
	cp ~/.dircolors $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.inputrc)","")
	@echo "Backing up inputrc"
	cp ~/.inputrc $(BACKUP_DIR)
endif
ifneq ("$(wildcard ~/.bash_autocomplete)","")
	@echo "Backing up bash_autocomplete"
	cp ~/.bash_autocomplete $(BACKUP_DIR)
endif
	@echo "Symlinking bash files"
	ln -sf $(DOTFILES_DIR)/shell/bash/bash_aliases ~/.bash_aliases
	ln -sf $(DOTFILES_DIR)/shell/bash/bash_exports ~/.bash_exports
	ln -sf $(DOTFILES_DIR)/shell/bash/bash_functions ~/.bash_functions
	ln -sf $(DOTFILES_DIR)/shell/bash/bash_options ~/.bash_options
	ln -sf $(DOTFILES_DIR)/shell/bash/bash_profile ~/.bash_profile
	ln -sf $(DOTFILES_DIR)/shell/bash/bash_prompt ~/.bash_prompt
	ln -sf $(DOTFILES_DIR)/shell/bash/bashrc ~/.bashrc
	ln -sf $(DOTFILES_DIR)/shell/dircolors ~/.dircolors
	ln -sf $(DOTFILES_DIR)/shell/inputrc ~/.inputrc
ifeq ($(OSFLAG),Linux)
	ln -sf $(DOTFILES_DIR)/shell/bash/autocomplete/ubuntu/bash_autocomplete ~/.bash_autocomplete
else
ifeq ($(OSFLAG),Mac)
	ln -sf $(DOTFILES_DIR)/shell/bash/autocomplete/macos/bash_autocomplete ~/.bash_autocomplete
endif
endif

install-curl:
ifneq ("$(wildcard ~/.curlrc)","")
	@echo "Backing up curlrc"
	cp ~/.curlrc $(BACKUP_DIR)
endif
	@echo "Symlinking curl files"
	ln -sf $(DOTFILES_DIR)/curl/curlrc ~/.curlrc

install-editorconfig:
ifneq ("$(wildcard ~/.editorconfig)","")
	@echo "Backing up EditorConfig file"
	cp ~/.editorconfig $(BACKUP_DIR)
endif
	@echo "Installing EditorConfig file"
	ln -sf $(DOTFILES_DIR)/editorconfig/editorconfig ~/.editorconfig

install-gdb:
ifneq ("$(wildcard ~/.gdbinit)","")
	@echo "Backing up .gdbinit"
	cp ~/.gitconfig $(BACKUP_DIR)
endif
	@echo "Symlinking gdb files"
	ln -sf $(DOTFILES_DIR)/gdb/gdbinit ~/.gdbinit

install-git:
ifneq ("$(wildcard ~/.gitconfig)","")
	@echo "Backing up .gitconfig"
	cp ~/.gitconfig $(BACKUP_DIR)
endif

ifneq ("$(wildcard ~/.gitignore)","")
	@echo "Backing up .gitingore"
	cp ~/.gitingore $(BACKUP_DIR)
endif
	@echo "Symlinking git files"
	ln -sf $(DOTFILES_DIR)/git/gitconfig ~/.gitconfig
	ln -sf $(DOTFILES_DIR)/git/gitignore ~/.gitignore

install-nano:
ifneq ("$(wildcard ~/.nano)","")
	@echo "Backing up .nano"
	cp -r ~/.nano $(BACKUP_DIR)
endif

ifneq ("$(wildcard ~/.nanorc)","")
	@echo "Backing up nanorc"
	cp ~/.nanorc $(BACKUP_DIR)
endif
	@echo "Symlinking nano files"
	ln -sf $(DOTFILES_DIR)/nano/.nano ~/.nano
	ln -sf $(DOTFILES_DIR)/nano/nanorc ~/.nanorc

install-psql:
ifneq ("$(wildcard ~/.psqlrc)","")
	@echo "Backing up psql files"
	cp ~/.psqlrc $(BACKUP_DIR)
endif
	@echo "Symlinking psql files"
	ln -sf $(DOTFILES_DIR)/psql/psqlrc ~/.psqlrc

install-sqlite:
ifneq ("$(wildcard ~/.sqliterc)","")
	@echo "Backing up sqlite files"
	cp ~/.sqliterc $(BACKUP_DIR)
endif
	@echo "Symlinking sqlite files"
	ln -sf $(DOTFILES_DIR)/sqlite/sqliterc ~/.sqliterc

install-sublime:
ifeq ($(OSFLAG),Linux)
	@echo "Symlinking Sublime files for Linux"
	ln -sf $(DOTFILES_DIR)/subl/User ~/.config/sublime-text-3/Packages/User
else
ifeq ($(OSFLAG),Mac)
	@echo "Symlinking Sublime files for macOS"
	ln -sf $(DOTFILES_DIR)/subl/User "~/Library/Application Support/Sublime Text 3/User"
endif
endif

install-top:
ifneq ("$(wildcard ~/.toprc)","")
	@echo "Backing up top files"
	cp ~/.toprc $(BACKUP_DIR)
endif

	@echo "Symlinking top files"
	ln -sf $(DOTFILES_DIR)/top/toprc ~/.toprc

install-tmux:
ifneq ("$(wildcard ~/.tmux.conf)","")
	@echo "Backing up tmux files"
	cp ~/.tmux.conf $(BACKUP_DIR)
endif
	@echo "Symlinking tmux files"
	ln -sf $(DOTFILES_DIR)/tmux/tmux.conf ~/.tmux.conf

install-vim:
ifneq ("$(wildcard ~/.vim)","")
	@echo "Backing up .vim"
	cp -r ~/.vim $(BACKUP_DIR)
endif

ifneq ("$(wildcard ~/.vimrc)","")
	@echo "Backing up .vimrc"
	cp ~/.vimrc $(BACKUP_DIR)
endif
	@echo "Symlinking vim files"
	ln -sf $(DOTFILES_DIR)/vim/.vim ~/
	ln -sf $(DOTFILES_DIR)/vim/vimrc ~/.vimrc

install-weechat:
	@echo "Symlinking weechat files"
	ln -sf $(DOTFILES_DIR)/weechat/.weechat ~/.weechat
