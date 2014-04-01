# Darkcloud Vim Theme, Config and Plugin Selection

## Requirements

1. Git: Required to clone and update the repository.
3. CTags: Available @ http://ctags.sourceforge.net, this can be in $PATH or in the vim folder and is required for the tagbar plugin.
4. Vim v7.4+: Everything has been written and tested using Vim 7.4.135, and I assume there could be issues with 7.3 and below.
2. Bash (optional): Required to use the update script, which simply runs the git repo and submodule update commands.
5. Powerline Fonts (optional): Required for the powerline lightline theme, which can be toggled in /etc/vimrc along with the gvim font

## Installation

1. Clone this repository then initialize and update the git submodules (in our case, the vim plugins)
  * ]$ git clone https://github.com/prurigro/darkcloud-vimconfig.git
  * ]$ cd darkcloud-vimconfig
  * ]$ git submodule update --init
2. Edit the 'vimrc' file and select whether to expect powerline fonts, choose a font for gvim, and add or change any of the loaded config files to match your personal setup.
3. There are two main ways this package can be deployed: system-wide or single-user.
  * For a distro-agnostic system-wide installation in the /etc directory, copy or link: 'vimrc' to '/etc/vimrc' and the 'vim' folder to '/etc/vim'.
  * For a single-user installation in a user's home directory, copy or link: 'vimrc' to '~/.vimrc' -and- the 'vim' folder to '~/.vim'.
4. Make sure the 'vimrc' file and 'vim' folder are at least readable to any users that will be using the config.
5. Clone additional vim plugin repos in the 'bundle' folder to have them loaded at startup.
6. You can add or replace config files in your 'vimrc' file to customize behaviour.
7. Run the pathogen_update_plugins script to update your plugins by pulling the latest changes from each plugin repo.
8. The 'vim/config/keyboard.vim' file has a list of the commands it configures, as well as some basic examples of some provided directly by plugins (though check the plugin folder's README for a full explanation).

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
