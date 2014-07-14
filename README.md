# darkcloud-vimconfig #

A theme, config and collection of plugins for Vim.

## Requirements ##

* **Vim**: The latest [vim](http://www.vim.org) should be installed to use this distribution (versions 7.3 and below aren't tested or guaranteed to work).
* **Bash**: Required by the _update_ and _gentags_ scripts.
* **Git**: Required by the _update_ script and git-related plugins.

## Optional Requirements ##

* **Artistic Style**: Required by the _autoformat_ plugin to format C, C++, C++/CLI, C#, and Java source ([astyle website](http://astyle.sourceforge.net)).
* **autopep8**: Required by the _autoformat_ plugin to format Python using the PEP 8 style guide ([autopep8 repo](https://github.com/hhatto/autopep8)).
* **Compilers and Runtimes**: The syntastic plugin can use the compiler or runtime for most languages to provide real-time syntax checking.
* **CTags**: Required by the _tagbar_ and _neocomplcache_ plugins as well as the _gentags_ script ([ctags website](http://ctags.sourceforge.net)).
* **JS Beautifier**: Required by the _autoformat_ plugin to format Javascript source and HTML ([js-beautify repo](https://github.com/Chiel92/vim-autoformat)).
* **Powerline Fonts**: Required to enable the fancier looking status line ([powerline-fonts repo](https://github.com/Lokaltog/powerline-fonts)).
* **Tidy**: Required by the _autoformat_ plugin to format XHTML and XML ([tidy website](http://tidy.sourceforge.net)).

## Distribution Features ##

* **Default Configuration**: A complete set of defaults, focusing on the most modern settings that still provide a compatible experience.
* **Custom theme**: An original colour scheme with explicit values set to optimize the look of individual filetypes.
* **Key Bindings/Aliases**: A set of bindings and aliases defined to group similar features and provide numerous (and sometimes more familiar) ways to access options.
* **Plugins**: A set of plugins have been included and configured to provide support for most normally-unsupported filetypes, and a set of features useful when using Vim as an editor.
* **Custom Configuration**: A second vimrc and bundle folder are included that aren't maintained as part of the repo, making custom plugins and configuration easy to add.

![Darkcloud Vim Distribution Theme](http://i.imgur.com/jP0EqeN.png)

## Installation ##

1. Clone the darkcloud-vimconfig repo and use the _update_ script to install the plugins:
  * `git clone https://github.com/prurigro/darkcloud-vimconfig.git`
  * `./darkcloud-vimconfig/update` (if you don't want colour output, run: `./darkcloud-vimconfig/update --no-colour` instead)
  * **Note**: The _update_ script requires bash, but if it's not available you can enter the _darkcloud-vimconfig/_ folder and run: `git submodule update --init` to install the plugins manually, then create _vim/vimrc.user_ and remember to run: `:Helptags` once everything else is running.
2. If you don't know where vim expects to find your vimrc, start vim and run: `:version` to find the values "user vimrc file" (for a single-user install) and "system vimrc file" (for a system-wide install). T
3. Copy or symlink the vimrc file from `darkcloud-vimconfig/vimrc` to one of the locations vim expects to find it, based on whether you want a local or system-wide install, then choose one of the following:
  * Edit the _g:darkcloudpath_ variable in the vimrc file iteself, pointing it to the location you're keeping the _darkcloud-vimconfig_ repo folder.
  * Create a file @ _~/.vim/darkcloud-path.vim_ and in it put the following: `let g:darkcloudpath="/etc/darkcloud-vimconfig"`, but replacing _"/etc/darkcloud-vimconfig"_ with the path to the _darkcloud-vimconfig_ repo folder.
  * Place _darkcloud-vimconfig_ in the default location @ _/etc/darkcloud-vimconfig_.
  * Create your own vimrc and have that set the _g:darkcloudpath_ variable before sourcing the included vimrc.

## Configuration ##

* **Configure Variables**: The following variables can be added to _vim/vimrc.user_ and have their values set to the values you require:
  * `g:disablelinebreaks`: **1** = Override filetype plugins so linebreaks never occur | 0 = Linebreaks are disabled by default, but filetype plugins can override this setting (_default_: 1)
  * `g:autostartfiler`: **1** = Start the filer file manager when vim is run and the buffer is empty | 0 = Do nothing when vim is run and the buffer is empty (_default_: 1)
  * `g:autostartchecker`: **1** = Check syntax once an appropriate file is loaded | 0 = Check syntax only after syntax checking is toggled on (_default_: 0)
  * `g:autostarttagbar`: **1** = Have the tagbar load automatically when a compatible format is run | 0 = The tagbar will stay hidden until triggered on demand with its toggle (_default_: 0)
  * `g:powerlinefonts`: **1** = Render the statusline using characters available with powerline-patched fonts | 0 = Render the statusbar with less attractive but more compatible characters available in all fonts (_default_: 0)
* **Custom Settings**: Settings with priority over those set by darkcloud-vimconfig can be added to a file named _vimrc.user_, located in _darkcloud-vimconfig/vim/_ or any of the folders in the runtimepath.
* **Custom Plugins**: Pathogen compatible plugins can be cloned or extracted to "darkcloud-vimconfig/vim/bundle.user/", or a folder named "bundle" or "bundle.user" in any of the folders in the runtimepath.
* **Custom Snippets**: To add or override Emmet snippets, create _~/.vim/snippets.json_ and add your own definitions using json like shown in the [Emmet Documentation](http://docs.emmet.io/customization/snippets/).
* **File Associations**: To use the file manager in vim to run files with external programs, create "~/.vim/filetypes.vim" and on each line, write an association between a file extension and the program to launch files of that type that looks like: `call vimfiler#set_execute_file('mp4','xdg-open')`.
* **Update Script**: (requires: bash+git) Use this to update the project and submodules, as well as handle any required maintenance, generate docs from the pathogen plugins and create missing config scripts with preset values.
* **Generate System Tags**: (requires: bash+ctags) Generate a list of ctags for your system libraries in _/usr/include_ and _/usr/local/include_ as well as any folders passed as arguments by running the _gentags_ script.

## Mappings ##

### Mouse ###

| Binding                | Mode |                                           Action |
|:-----------------------|:----:|-------------------------------------------------:|
| Ctrl-ScrollUp          | ALL  |          Scroll right a few characters at a time |
| Ctrl-ScrollDown        | ALL  |           Scroll left a few characters at a time |
| Alt-ScrollUp           | ALL  |             Scroll right one character at a time |
| Alt-ScrollDown         | ALL  |              Scroll left one character at a time |
|                        |      |                                                  |
| MiddleClick            | ALL  |          Select between the cursor and the mouse |
| Ctrl-LeftClick         | ALL  |          Select between the cursor and the mouse |
| Alt-LeftClick          | ALL  |                     Select the line at the mouse |
| Ctrl-Alt-LeftClick     | ALL  |                Select the paragraph at the mouse |
|                        |      |                                                  |
| Ctrl-RightClick        | ALL  |     Copy selection or character under the cursor |
| Ctrl-MiddleClick       | ALL  |     Copy selection or character under the cursor |
| Alt-RightClick         | ALL  |      Cut selection or character under the cursor |
| Alt-MiddleClick        | ALL  |      Cut selection or character under the cursor |
| Ctrl-Alt-RightClick    | ALL  |                              Paste at the cursor |
| Ctrl-Alt-MiddleClick   | ALL  |                              Paste at the cursor |
| Shift-MiddleClick      | ALL  |            Paste the contents of the xorg buffer |

### Keyboard ###

#### Sidebars ####

| Binding                | Mode |                                           Action |
|:-----------------------|:----:|-------------------------------------------------:|
| \<F1\>                 | ALL  |         Toggle **vimfiler** file manager sidebar |
| \<F2\>                 | ALL  |        Toggle the **gundo** undo history sidebar |
| \<F3\>                 | ALL  |    Toggle the **tagbar** source code tag sidebar |
| \<F4\>                 | ALL  |      Toggle the **extradite** git history window |

#### Toggles ####

| Binding                | Mode |                                           Action |
|:-----------------------|:----:|-------------------------------------------------:|
| \<(Ctrl-or-Alt)-F1\>   | ALL  |                             Toggle line wrapping |
| \<(Ctrl-or-Alt)-F2\>   | ALL  |         Toggle highlighting of spelling mistakes |
| \<(Ctrl-or-Alt)-F3\>   | ALL  |               Toggle source code syntax checking |
| \<(Ctrl-or-Alt)-F4\>   | ALL  |                       Toggle external-paste mode |
|                        |      |                                                  |
| \`                     | NORM |  Toggle gutter (left bar with line numbers etc.) |
| \<Backslash\>\<F1\>    | NORM |              Toggle the **vim** reference manual |
| \<Backslash\>\<Space\> | NORM |         Toggle the **goyo** distraction-free UI  |
| ?\<Space\>             | NORM | Toggle the **spellcheck** bottom bar of mistakes |

#### Spell Check ####

| Binding                | Mode |                                           Action |
|:-----------------------|:----:|-------------------------------------------------:|
| ?<Space>               | NORM |                     Toggle spellcheck error list |
| ?+                     | NORM |    Add the selected word to the local dictionary |
| ??                     | NORM |      Show spelling suggestions for selected word |
| ?N                     | NORM |                  Go to the next spelling mistake |
| ?P                     | NORM |              Go to the previous spelling mistake |

##### GVim #####

| Binding                | Mode |                                           Action |
|:-----------------------|:----:|-------------------------------------------------:|
| \<Backslash\>\<F1\>    | ALL  |                    Toggle the menubar **(gvim)** |
| \<Backslash\>\<F2\>    | ALL  |                    Toggle the toolbar **(gvim)** |

### Complete Reference ###

For a complete list of mappings specific to **darkcloud-vimconfig**, check the list in the comments at the top of [vim/config/keyboard.vim](https://github.com/prurigro/darkcloud-vimconfig/blob/master/vim/config/keyboard.vim).

## Plugins ##

* [auto-autoformat](https://github.com/Chiel92/vim-autoformat): Provides easy code formatting in Vim by integrating existing code formatters.
* [autoswap.vim](https://github.com/vim-scripts/autoswap.vim): Switch to open editor window instead of asking what to do with swapfile.
* [emmet-vim](https://github.com/mattn/emmet-vim): Support for expanding abbreviations.
  * [webapi-vim](https://github.com/mattn/webapi-vim) A web library used by emmet to provide support for custom snippets.
* [goyo.vim](https://github.com/junegunn/goyo.vim) Distraction-free writing in Vim.
* [gundo.vim](https://github.com/sjl/gundo.vim): Sidebar to visualize your undo tree and browse the differences of each change.
* [lightline.vim](https://github.com/itchyny/lightline.vim) A light and configurable statusline/tabline for Vim.
* [MatchTagAlways](https://github.com/Valloric/MatchTagAlways) A Vim plugin that always highlights the enclosing html/xml tags.
* [neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim) The '*ultimate*' auto-completion system for Vim.
* [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister) Replace text with the contents of a register (for paste+replace without writing over the buffer).
* [SpellCheck](https://github.com/vim-scripts/SpellCheck) Provides a list of spelling mistakes in the bottom bar that can be clicked to find them in the document.
* [SudoEdit.vim](https://github.com/vim-scripts/SudoEdit.vim) Read and write files without the necessary permissions through the use of sudo.
* [syntastic](https://github.com/scrooloose/syntastic) Uses system compilers and parsers to check syntax either on-the-fly or after saving a compatible document.
* [tagbar](https://github.com/majutsushi/tagbar) Uses ctags to generate a sidebar of the tags for the current file.
* [tcomment_vim](https://github.com/tomtom/tcomment_vim) File-type sensible comments that can be easily toggled on and off for blocks of text.
* [vim-easytags](https://github.com/xolox/vim-easytags) Automated tag file generation and syntax highlighting of tags in Vim.
  * [vim-misc](https://github.com/xolox/vim-misc) Miscellaneous auto-load Vim scripts.
* [vim-extradite](https://github.com/int3/vim-extradite) A git commit browser extending vim-fugitive that displays differences and optionally loads old revisions.
* [vimfiler.vim](https://github.com/Shougo/vimfiler.vim) A curses-style file manager for vim that runs on it's own or in a sidebar and can associate handlers for file types.
  * [unite.vim](https://github.com/Shougo/unite.vim) A library used by Vim Filer to help build its user interface.
* [vim-fixkey](https://github.com/drmikehenry/vim-fixkey) A set of keyboard mappings that override differences in different environments that might normally break consistency or compatibility.
* [vim-fugitive](https://github.com/tpope/vim-fugitive) A wrapper integrating git into vim in such a way as to provide features neither of them could offer on their own.
* [vim-move](https://github.com/matze/vim-move) Provides a few convenient ways to move selected text.
* [vim-neco-calc](https://github.com/hrsh7th/vim-neco-calc) A calculator plugin extending neocomplcache.vim for the on-the-fly auto-completion of simple math equations.
* [vim-pathogen](https://github.com/tpope/vim-pathogen) A plugin to load other plugins while keeping them isolated in their own directory structure rather than all dumped together.
* [vim-polyglot](https://github.com/prurigro/vim-polyglot) The darkcloud-vimconfig fork of a meta-package that attempts to provide the best syntax plugins for each file type.
* [vim-signify](https://github.com/mhinz/vim-signify) When a version controlled file is changed, this displays a column showing where and how, and allows for navigation to and between differences.
* [vim-surround](https://github.com/tpope/vim-surround) Provides functionality to exchange surrounding delimiters and xml-style tags with another, or simply remove them.
  * [vim-repeat](https://github.com/tpope/vim-repeat) A library used by vim-surround to allow its delimiter-switching functions to be repeated with the `.` command.
* [vim-togglelist](https://github.com/milkypostman/vim-togglelist) Supplies toggle functions for the *location* and *error* lists, which are used by a number of plugins and normally require separate open and close commands.
* [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace) Highlights and allows for the easy removal of trailing whitespace in documents.

## Credits ##

* By Kevin MacMartin: [GitHub Projects](https://github.com/prurigro?tab=repositories) | [Arch Linux AUR Packages](https://aur.archlinux.org/packages/?SeB=m&K=prurigro)
* The jellybean theme for Vim by [NanoTech](http://nanotech.nanotechcorp.net) was stripped down and used as a starting point to build the darkcloud theme included in this project.

## License ##

Licensed under the [MIT license](http://opensource.org/licenses/MIT).
