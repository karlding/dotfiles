# ----------------------------------------------------------------------
# System related

# automake
brew 'automake'

# openssl
brew 'openssl'

# libyaml
# must be after openssl
brew 'libyaml'


# ----------------------------------------------------------------------
# Terminals

# tmux
brew 'tmux'


# ----------------------------------------------------------------------
# Languages

# Python 2.7
#
# Note: The order that this is installed in seems to matter, since vim
# has a dependency on Python. Thus, we ensure that we have an upgraded
# version of Python before proceeding to install vim.
brew 'python'


# ----------------------------------------------------------------------
# Shells

# bash
brew 'bash'

# bash-completion
brew 'bash-completion'

# zsh
brew 'zsh'


# ----------------------------------------------------------------------
# Editors

# vim editor
brew 'vim', args: ['with-lua']

# nano editor
brew 'nano'


# ----------------------------------------------------------------------
# Version control

# git
brew 'git'

# mercurial
brew 'mercurial'

# subversion
brew 'subversion'


# ----------------------------------------------------------------------
# GNU command line tools

# coreutils
brew 'coreutils', args: ['with-default-names']

# binutils
brew 'binutils'

# diffutils
brew 'diffutils'

# ed
brew 'ed', args: ['with-default-names']

# findutils
brew 'findutils'

# gawk
brew 'gawk'

# gnu-indent
brew 'gnu-indent', args: ['with-default-names']

# gnu-sed
brew 'gnu-sed', args: ['with-default-names']

# gnu-tar
brew 'gnu-tar', args: ['with-default-names']

# gnu-which
brew 'gnu-which', args: ['with-default-names']

# gnutls
brew 'gnutls'

# grep
brew 'grep', args: ['with-default-names']

# gzip
brew 'gzip'

# screen
brew 'screen'

# watch
brew 'watch'

# wdiff
brew 'wdiff', args: ['with-gettext']

###
## Some GNU command line tools already exist by default on macOS
## We choose to replace these with newer versions.
###

# gdb
brew 'gdb'  # gdb requires further actions to make it work. See `brew info gdb`.

# gpatch
brew 'gpatch'

# less
brew 'less'

# m4
brew 'm4'

# make
brew 'make'


# ----------------------------------------------------------------------
# Downloaders

# curl
# Must be after openssl
brew 'curl'

# wget
brew 'wget'


# ----------------------------------------------------------------------
# Programming languages and package managers

# yarn
brew 'yarn'


# ----------------------------------------------------------------------
# File compression/uncompression

# zstandard
brew 'zstd'

# winrar
brew 'unrar'


# ----------------------------------------------------------------------
# Misc

# clang-format
brew 'clang-format'

# tree
brew 'tree'
