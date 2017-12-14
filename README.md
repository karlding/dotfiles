# [Karl Ding](https://justkding.me)'s dotfiles

[![Build Status](https://travis-ci.org/karlding/dotfiles.svg?branch=master)](https://travis-ci.org/karlding/dotfiles)

[Karl](https://justkding.me) attempts to do dotfiles. These are my dotfiles I've been using for my personal laptop (and recently, work laptops/computers). The goal is to have a unified collection of dotfiles and configuration files to minimize time spent configuring new machines.

## Setup

```bash
git clone https://github.com/karlding/dotfiles.git && cd dotfiles
./install
```

If you wish to install OS specifics, you can do

```bash
./install linux
```

or for macOS

```bash
./install macos
```

If you're on a Mac, you may want to do

```bash
brew bundle
```

### base16-shell

You may want to install a [base16-shell theme](https://github.com/chriskempson/base16-shell). I use the ``base16_ocean`` theme.

### bash-completion
You may also want to install bash-completion (which is a dependency that is used for the ``PS1`` prompt.

### universal-ctags

Either build [universal-ctags](https://github.com/universal-ctags/ctags) from source or pick one of the packages.

#### Ubuntu
```bash
sudo apt-get install bash-completion
```

##### macOS
```bash
brew install git
brew install bash-completion
```

## Windows
Unfortunately, I haven't had a chance to automate ``mklink`` yet.

### ConEmu
Hard link the ``conemu.xml`` file to ``%APPDATA%\ConEmu.xml``.

```bash
mklink /H "%APPDATA%\ConEmu.xml" "%DOTFILES_DIR%\os\windows\ConEmu\ConEmu.xml"
```

### Sublime Text 3
Symlink the entire ``User`` folder to the Sublime Text directory.

```bash
mklink /J "%appdata%\Sublime Text 3\Packages\User" "C:\dotfiles\location\subl\User"
```

### Atom
Symlink the ``atom`` directory to ``~/.atom`` (or create a hard junction ``%userprofile%\.atom`` on Windows).

```bash
mklink /J "%appdata%\.atom" "C:\dotfiles\location\atom"
```

### Vim

Hard link your ``.vim`` from ``dotfiles`` to your home directory.

```bash
mklink /J C:\cygwin64\home\myusername\.vim C:\%DOTFILES_DIR%\vim\.vim
```

## Post Install

### tmux

Clone the tmux plugin manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

And then in ``tmux``, <kbd>Prefix</kbd>, <kbd>Ctrl</kbd> + <kbd>I</kbd>.

### Atom
You can automatically install all packages using ``apm``.

```bash
cd ~/.atom
apm install --packages-file package-list.txt
```

If you make any updates, update the ``package-list.txt`` file.

```bash
cd ~/.atom
apm list --installed --bare > package-list.txt
```

### vscode

```bash
cat extensions.txt | xargs -n1 code --install-extension
```

To backup

```bash
code --list-extensions > extensions.txt
```

### vim

Voila! Now install all your plugins using ``:PlugInstall``.

### git
```bash
mklink /H .gitconfig "%DOTFILES_DIR%\git\gitconfig"
```

You may want to set up a ``~/.gitconfig.local`` to prevent git from complaining whenever you try to commit. Add the following to your ``~/.gitconfig.local``, where ``Karl`` and ``karlding@users.noreply.github.com`` are your name and email.

```
[user]
    useConfigOnly = true
    name = Karl
    email = karlding@users.noreply.github.com
```

### fzf

Install [fzf](https://github.com/junegunn/fzf.vim).

## OSX Specifics
We probably want the GNU coreutils instead of the defaults that OSX ships.

```bash
brew tap homebrew/dupes
brew install gawk gnutls gnu-indent gnu-getopt wget
brew install findutils --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls --with-default-names
brew install grep --with-default-names
brew install coreutils
brew install binutils
brew install diffutils
brew install gzip
brew install watch
brew install tmux 
brew install wget
brew install nmap
brew install gpg
brew install htop
brew install nano
brew install tree
```

Alternatively, you can do

```bash
brew bundle
```

And then add these utils to your ``PATH`` (probably in ``.bash_exports.local``)

```bash
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
```

### python and pyenv

* [pyenv](https://github.com/pyenv/pyenv)
* [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

Now start development!

```bash
pyenv virtualenv 2.7.8 vectorize278
source ~/.pyenv/versions/vectorize278/bin/activate
```

