About
-----

That is just a configuration set, plugins and customized colorschemes for VIM
that I like. By now it uses the following plugins:

* [NERDTree](https://github.com/scrooloose/nerdtree) for browsing files
* [SuperTab](https://github.com/ervandew/supertab) to tab-complete the code
* [Syntastic](https://github.com/scrooloose/syntastic) for syntax check
* [TagBar](https://github.com/majutsushi/tagbar) for browsing code

And some other configuration:

* formatted file names in tab labels
* `ir_black` colorscheme
* `omnifunc` autocomplete
* custom statusline
* support simultaneous NERDTree, Syntastic and TagBar windows
* automatically remove trailing whitespaces on save

Aliases
-------

    :nto # NERDTree Open
    :ntc # NERDTree Close
    :tbo # TagBar Open
    :tbc # TagBar Close
    :stm # SyntasticToggleMode

Shortcuts
---------

* `ctrl + shift + page up` -- move current tab to the left
* `ctrl + shift + page down` -- move current tab to the right

Installation
------------

Clone the repository and link the files to your Vim configuration:

    git clone http://github.com/vmassuchetto/vim/
    cd vim
    ln -s `pwd`/vim ~/.vim
    ln -s `pwd`/vimrc ~/.vimrc

Notes
-----

* In order for [TagBar](http://majutsushi.github.com/tagbar/) to work you'll
  need [Exuberant Ctags](http://ctags.sourceforge.net/) to generate the
  index files.  Debian-like distributions have a `exuberant-ctags` package.

Screenshot
----------

![Vim Screenshot](https://github.com/vmassuchetto/vim/raw/master/screenshot.png)
