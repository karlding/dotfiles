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

#### Vim
vim plugins are managed using Vundle.
