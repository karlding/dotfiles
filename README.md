# [Karl](https://justkding.me)'s dotfiles
[Karl](https://justkding.me) attempts to do dotfiles. These are my dotfiles I am using for my laptop's current setup.

## Setup
Clone the repository somewhere. It doesn't really matter where, since we will be symlinking the dotfiles anyways. ``.local`` versions of the files will be sourced after.

```bash
git clone https://github.com/karlding/dotfiles.git
```

### Symlinking
Then, symlink all the things (or copy them manually)! On Windows, you can run ``setup/symlinks.bat`` which will symlink everything for you (using hardlinks). One of the downsides of this is that when making changes, ``git`` will not track them if you edit the hardlinked file&mdash;you must make your changes in the ``dotfiles/`` directory, which will update the hardlinked file (ie. don't do ``vim ~/.bash_profile``, and do ``vim ~/dotfiles/shell/.bash_profile`` instead).

#### ConEmu
Symlink the ``conemu.xml`` file to ``%APPDATA%\ConEmu.xml``.

```bash
mklink /H "%APPDATA%\ConEmu.xml" "%DOTFILES_DIR%\os\windows\ConEmu\ConEmu.xml"
```

#### Cygwin Environments
I ran into a weird issue with Cygwin where it couldn't read my ``gitconfig`` symlink for some reason, but happily reads the other (Linux-style) symlinks. So I just ended up creating a hard link instead, which worked fine. It probably is a good idea to use hard links instead of ``ln -s`` on Windows.

```bash
mklink /H .gitconfig "%DOTFILES_DIR%\git\gitconfig"
```

#### Sublime Text 3
Symlink the entire ``User`` folder to the Sublime Text app directory. On Windows, this is located at ``%appdata%\Sublime Text 3\Packages\User``.

```bash
mklink /J "%appdata%\Sublime Text 3\Packages\User" "C:\dotfiles\location\subl\User"
```

Notice that we're using the ``/J`` flag to hard link a directory, instead of the ``/H`` flag to hard link a file

#### Atom
Symlink the ``atom`` directory to ``~/.atom`` (or create a hard junction ``%userprofile%\.atom`` on Windows).

```bash
mklink /J "%appdata%\.atom" "C:\dotfiles\location\atom"
```

#### Vim
vim plugins are managed using Vundle.

To setup on Windows (using Cygwin64), make sure you clone Vundle with Unix line endings. For some reason, Cygwin insists on checking out repositories with CRLF endings, which is a huge pain. We can get around this with the following:

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
