# [Karl](https://justkding.me)'s dotfiles
[Karl](https://justkding.me) attempts to do dotfiles. These are my dotfiles I am using for my laptop's current setup.

## Setup
Clone the repository somewhere. It doesn't really matter where, since we will be symlinking the dotfiles anyways. ``.local`` versions of the files will be sourced after.

```bash
git clone https://github.com/karlding/dotfiles.git
```

### Symlinking
Then, symlink all the things (or copy them manually)! On Windows, you can run ``setup/symlinks.bat`` which will symlink everything for you.

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
