About
-----

That is just a configuration set, plugins and customized colorschemes for VIM
that I like. By now it uses:

* [NERDTree](https://github.com/scrooloose/nerdtree) for browsing files
* [SuperTab](https://github.com/ervandew/supertab) to tab-complete the code
* [Syntastic](https://github.com/scrooloose/syntastic) for syntax check
* [TagBar](https://github.com/majutsushi/tagbar) for browsing code

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

![Vim Screenshot](https://github.com/viniciusmassuchetto/vim/raw/master/screenshot.png)
