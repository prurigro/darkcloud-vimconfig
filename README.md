# Darkcloud Vim Theme, Config and Plugin Selection

## Requirements

1. Git: Required to clone and update the repository.
3. CTags: Available @ http://ctags.sourceforge.net, place in $PATH or the vim folder to use the tagbar or extended C omni/auto-completion.
4. Vim v7.4+: Everything has been written and tested using Vim 7.4.135, and I assume there could be issues with 7.3 and below.
2. Bash (optional): Required to use the update and ctags generation scripts, both of which can be run with the commands listed within.
5. Powerline Fonts (optional): Required for an extended look/feel using lightline, otherwise it should be toggled off in the vimrc.

## Installation

1. Clone this repository then initialize and update the git submodules (in our case, the vim plugins)
  * ]$ git clone https://github.com/prurigro/darkcloud-vimconfig.git
  * ]$ cd darkcloud-vimconfig
  * ]$ git submodule update --init
2. Edit the 'vimrc' file and select whether to use powerline fonts, choose a font for gvim and add additional config after it loads the included files.
3. There are two main ways this package can be deployed: system-wide or single-user (vim must be configured to load from the respective location):
  * For a distro-agnostic system-wide installation in the /etc directory, copy or link: 'vimrc' to '/etc/vimrc' and the 'vim' folder to '/etc/vim'.
  * For a single-user installation in a user's home directory, copy or link: 'vimrc' to '~/.vimrc' -and- the 'vim' folder to '~/.vim'.
4. Make sure the 'vimrc' file and 'vim' folder are readable by any users expecting to use them.
5. Clone additional vim plugin repositories in the 'bundle' folder to have them loaded at startup.
6. You can add additional config files or replace the included ones listed in the vimrc file to customize behaviour.
7. Run the 'gen-ctags-file' script to generate a tags file for the user that runs it to facilitate omnicompletion and tagbar.
7. Run the 'update' script in the base directory of the repo as an easy way to pull changes and update the plugins all at once.
8. You can find a list of key bindings that were added by this config as well as a few of the ones added by plugins in 'vim/config/keyboard.vim'

## Features

* An original theme designed to be readable and aesthetically pleasing.
* A complete default configuration to start with and work from that aims to improve compatibility and provide sane, modern standards.
* Keyboard/mouse bindings that attempt to maintain vim's default behaviour while adding behaviour common to other text editors, improving accessibility to useful features, and making the mouse more capable (check the comments at the top of vim/config/keyboard.vim for a list of bindings and what they do).
* A core set of plugins that add some handy features and better support for some formats (you may want to remove plugins in vim/bundle/ supporting formats you won't be using).

## Credits

* Written by prurigro: [GitHub Projects](https://github.com/prurigro) | [Arch Linux AUR Packages](https://aur.archlinux.org/packages/?SeB=m&K=prurigro)
* Many other authors have their work contained in this repo, most of which are self contained in the vim/bundle directory. I also used the Vim jellybean theme as a basis for the Darkcloud theme, which is maintained by NanoTech <http://nanotech.nanotechcorp.net/>

## License
All projects cloned in the vim/bundle folder are separate and have their own licenses. Everything else is released under the MIT license.
