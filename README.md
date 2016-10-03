# [Karl](https://justkding.me)'s dotfiles
[Karl](https://justkding.me) attempts to do dotfiles. These are my dotfiles I am using for my laptop's current setup.

## Setup
Clone the repository somewhere. It doesn't really matter where, since we will be symlinking the dotfiles anyways. ``.local`` versions of the files will be sourced after.

```bash
git clone https://github.com/karlding/dotfiles.git
```

You may also want to install bash-completion (which is a dependency that is used for the ``PS1`` prompt.

```bash
sudo apt-get install bash-completion
```

For OSX, simply install applications using ``brew``.

```bash
brew install git
brew install bash-completion
```

``brew install git`` will install ``git`` and ``git-completion``, giving us the ``__git_ps1`` prompt.

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

On Linux, the Sublime Text 3 configuration is located under ``~/.config/sublime-text-3/Packages/User``.

#### Atom
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

#### git
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
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt
```

and then add these utils to your ``PATH`` (probably in ``.bash_exports.local``)

```bash
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
```

You can likewise install the GNU version ``nano``
