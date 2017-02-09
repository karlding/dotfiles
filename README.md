# [Karl Ding](https://justkding.me)'s dotfiles

[![Build Status](https://travis-ci.org/karlding/dotfiles.svg?branch=master)](https://travis-ci.org/karlding/dotfiles)

[Karl](https://justkding.me) attempts to do dotfiles. These are my dotfiles I am using for my laptop's current setup.

## Setup
Clone the repository somewhere. The location doesn't really matter, since we will be symlinking the dotfiles anyways. ``.local`` versions of the files will be sourced after.

```bash
git clone https://github.com/karlding/dotfiles.git
```

Then run

```bash
cd dotfiles
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

### bash-completion
You may also want to install bash-completion (which is a dependency that is used for the ``PS1`` prompt.

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
Symlink the entire ``User`` folder to the Sublime Text app directory, at ``%appdata%\Sublime Text 3\Packages\User``.

```bash
mklink /J "%appdata%\Sublime Text 3\Packages\User" "C:\dotfiles\location\subl\User"
```

### Atom
Symlink the ``atom`` directory to ``~/.atom`` (or create a hard junction ``%userprofile%\.atom`` on Windows).

```bash
mklink /J "%appdata%\.atom" "C:\dotfiles\location\atom"
```

You can automatically install all the packages using ``apm``.

```bash
cd ~/.atom
apm install --packages-file package-list.txt
```

If you make any updates, update the ``package-list.txt`` file.

```bash
cd ~/.atom
apm list --installed --bare > package-list.txt
```

### Vim
To setup on Windows (using Cygwin64), make sure you clone Vundle with Unix line endings.

```bash
git config --global core.autocrlf false
git config --global core.safecrlf true
git config --global core.eol lf

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

If you get errors about the directory already existing, just ``cd`` into the correct directory and then clone there. Then hard link your ``.vim`` from ``dotfiles`` to your home directory (for me, ``/home`` is ``C:\cygwin64\home\myusername``) using a junction.

```bash
mklink /J C:\cygwin64\home\myusername\.vim C:\%DOTFILES_DIR%\vim\.vim
```

Voila! Now install all your plugins using ``:PluginInstall``.

**Note**: If you are using Cygwin, make sure you install the *Cygwin version of git* as well, or else plugin installation using Vundle will fail.

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

[push]
    # Prevent disasters when doing things like `git push -f`
    # Requires git version >= 2
    default = simple
```

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

And then add these utils to your ``PATH`` (probably in ``.bash_exports.local``)

```bash
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
```
