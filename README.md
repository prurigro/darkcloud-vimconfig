# Darkcloud Vim Distribution: Theme, Config and Plugins #

## Requirements ##

1. **Vim** v7.4+: Everything has been written and tested using Vim 7.4.135, and I assume there could be issues with 7.3 and below.
2. **Git** (__optional__): Required to clone and update the repository, and pull the plugins as submodules.
3. **CTags** (__optional__): Available @ <http://ctags.sourceforge.net>, place in __$PATH__ or the vim folder to use the tagbar or extended C omni/auto-completion.
4. **Grep and Find** (__optional__): Have grep, fgrep, egrep and agrep ([windows binaries](http://gnuwin32.sourceforge.net/packages/grep.htm)), and find and xargs ([windows binaries](http://gnuwin32.sourceforge.net/packages/findutils.htm)) in $PATH or the vim folder to use the Grep plugin commands.
6. **Powerline Fonts** (__optional__): Required for a better looking lightline statusbar and should be disabled if they're not available ([powerline-patched fonts](https://github.com/Lokaltog/powerline-fonts)).
5. **Bash** (__optional__): Required to use the update and ctags generation scripts, both of which can be run with the commands listed within.

## Features ##

* A custom theme that includes an original colour scheme and an ever growing collection of explicit syntax colour overrides.
* A complete default configuration that attempts to provide a useful, easy to use and modern vim experience without becoming bloated.
* Key bindings and aliases to make useful features more accessible and provide a smoother work flow while attempting to vim's default behaviour while adding behaviour.
* A selection of plugins chosen either because they improve vim's support for common filetypes, or because they provide value-added features that aren't bloated and manage to make vim more useful as a text editor.

## Installation ##

1. Clone the darkcloud-vimconfig repo and use the __update__ script to install the plugins:
  * `git clone https://github.com/prurigro/darkcloud-vimconfig.git`
  * `sh darkcloud-vimconfig/update`
  * Note: The __update__ script requires bash, but if it's not available you can enter the __darkcloud-vimconfig/__ folder and run: `git submodule update --init` to install the plugins manually, then create __vim/vimrc.user__ and remember to run: `:Helptags` once everything else is running.
2. If you don't know where vim expects to find your vimrc, start vim and run: `:version` to find the values "user vimrc file" (for a single-user install) and "system vimrc file" (for a system-wide install). T
3. Copy or symlink the vimrc file from `darkcloud-vimconfig/vimrc` to one of the locations vim expects to find it, based on whether you want a local or system-wide install, then choose one of the following:
  * Edit the __g:darkcloudpath__ variable in the vimrc file iteself, pointing it to the location you're keeping the __darkcloud-vimconfig__ repo folder.
  * Create a file @ __~/.vim/darkcloud-path.vim__ and in it put the following: `let g:darkcloudpath="/etc/darkcloud-vimconfig"`, but replacing __"/etc/darkcloud-vimconfig"__ with the path to the __darkcloud-vimconfig__ repo folder.
  * Place __darkcloud-vimconfig__ in the default location @ __/etc/darkcloud-vimconfig__.
  * Create your own vimrc and have that set the __g:darkcloudpath__ variable before sourcing the included vimrc.
  * Come up with some other solution that fits your setup better than these. :)
4. Open the vimrc you just installed and either edit the variables in the "__USER CONFIG SETTINGS__" section, or (preferably) copy them to __vim/vimrc.user__ and edit them there:
  * **g:darkcloudpath**: Set to the location of the darkcloud-vimconfig folder. (__default__: __/etc/darkcloud-vimconfig__)
  * **g:autostartfiler**: 1 = Start the filer file manager when vim is run and the buffer is empty | 0 = Do nothing when vim is run and the buffer is empty (__default__: 1)
  * **g:autostartchecker**: 1 = Check syntax once an appropriate file is loaded | 0 = Check syntax only after syntax checking is toggled on (__default__: 1)
  * **g:autostarttagbar**: 1 = Have the tagbar load automatically when a compatible format is run | 0 = The tagbar will stay hidden until triggered on demand with its toggle (__default__: 0)
  * **g:powerlinefonts**: 1 = Render the statusline using characters available with powerline-patched fonts | 0 = Render the statusbar with less attractive but more compatible characters available in all fonts (__default__: 0)
  * **guifont**: Set to the name of the font you would like to use with gVim followed by the size, making sure to escape spaces and that a powerline-compatible font is selected if the above option is set to 1. (__default__: Droid\ Sans\ Mono\ 12)
5. Install ctags (http://ctags.sourceforge.net) to your system using a package and ensure it can be accessed in __$PATH__, or install support for vim exclusively by copying the ctags binary to the __darkcloud-vimconfig/vim__ folder.

## Configuration ##

* **Custom Configuration**: Settings with priority over those set by darkcloud-vimconfig can be added to a file named __vimrc.user__, located in __darkcloud-vimconfig/vim/__ or any of the folders in the runtimepath.
* **Custom Plugins**: Pathogen compatible plugins can be cloned or extracted to "darkcloud-vimconfig/vim/bundle.user/", or a folder named "bundle" or "bundle.user" in any of the folders in the runtimepath.
* **Custom Snippets**: To add or override Emmet snippets, create __~/.vim/snippets.json__ and add your own definitions using json like shown in the [Emmet Documentation](http://docs.emmet.io/customization/snippets/).
* **File Associations**: To use the file manager in vim to run files with external programs, create "~/.vim/filetypes.vim" and on each line, write an association between a file extension and the program to launch files of that type that looks like: `call vimfiler#set_execute_file('mp4','xdg-open')`.
* **Update Script**: (requires: bash+git) Use this to update the project and submodules, as well as handle any required maintenance, generate docs from the pathogen plugins and create missing config scripts with preset values.
* **Generate System Tags**: (requires: bash+ctags) Generate a list of ctags for your system libraries in __/usr/include__ and __/usr/local/include__ as well as any folders passed as arguments by running the __gentags__ script.

## Notes ##

* **Runtimepath**: To find the runtimepath locations currently set, run the following in vim: `:verbose set runtimepath`.
* **Key Bindings**: You can find a list of the bindings added by darkcloud-vimconfig, as well as a few of the ones added by plugins in __vim/config/keyboard.vim__.
* **Vim Quick Reference**: Type __??__, __?>__ and __?<__ to toggle sidebars with three styles of quick reference material on different reference topics.

## Credits ##

* Written by prurigro: [GitHub Projects](https://github.com/prurigro) | [Arch Linux AUR Packages](https://aur.archlinux.org/packages/?SeB=m&K=prurigro)
* Many other authors have their work contained in this repo, most of which are self contained in the vim/bundle directory. I also used the Vim jellybean theme as a basis for the Darkcloud theme, which is maintained by NanoTech <http://nanotech.nanotechcorp.net/>

## License ##
All projects cloned in the vim/bundle folder are separate and have their own licenses. Everything else is released under the MIT license.
