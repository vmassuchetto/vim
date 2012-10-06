
" Scheme
colorscheme ir_black
syntax on
filetype on
filetype plugin on

" General
set nocp
set encoding=utf-8
set laststatus=2

" Interface
set cursorline
set number

" Remember this ammount of command lines
set history=700

" Mouse usage
set mouse=a
set mousem=popup

" 4 whitespaces Tab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Text won't be automatically wrapped.
" Only use VISUAL-gq to wrap text
set wrap
set textwidth=0
set wrapmargin=0
set formatoptions-=t

" Portuguese spell chek
set nospell
set spelllang=pt

" Indentation
set autoindent
set nosmartindent
set backspace=indent,eol,start

" Don't include character under cursor in selection
set selection=exclusive

" Always show cursor position
set ruler

" Always show matching braces
set showmatch

set gfn=Monospace\ 10
set shell=/bin/bash

" <Home> goes to the first column in row without whitespaces
map <Home> ^
imap <Home> <Esc>^i

" Custom colors
highlight CursorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight ModeMsg    guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight Pmenu      guifg=NONE ctermfg=white ctermbg=black
highlight PmenuSbar  guifg=NONE ctermfg=white ctermbg=black
highlight PmenuSel   guifg=NONE ctermfg=black ctermbg=white

" Tags
set tags+=$HOME/.vim/tags/python.ctags

" Omnifunc completions
autocmd FileType * set omnifunc=syntaxcomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" Don't expand tabs to spaces in Makefiles
autocmd BufEnter [Mm]akefile* set noexpandtab
autocmd BufLeave [Mm]akefile* set expandtab

" PHP formatting
let php_sql_query=1
let php_htmlInStrings=1

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Always go to file's directory
set autochdir

" Remove toolbar and menu bar in gVIM
set guioptions-=T
set guioptions-=m

" Always show tablines
set showtabline=2

" Configure tab labels
function! TabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '+'
            break
        endif
    endfor
    let label .= v:lnum.' '
    let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
    if name == ''
        let name = '[Undefined]'
    else
        let name = fnamemodify(name,":t")
    endif
    let label .= name
    return label
endfunction
set guitablabel=%{TabLabel()}

" Status line
set statusline=
set statusline +=%1*\ %n\ %*
set statusline +=%5*%{&ff}%*
set statusline +=%1*\ [%{(&fenc==\"\"?&enc:&fenc)}]
set statusline +=%4*\ %<%F%*
set statusline +=%2*%m%*
set statusline +=%1*%=%5l%*
set statusline +=%2*/%L%*
set statusline +=%1*\ %v\ %*
set statusline +=%2*0x%04B\ %*

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" NERDTree and Tagbar
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nmap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>

" Aliases
cnoreabbrev tbo TagbarOpen
cnoreabbrev tbc TagbarClose
cnoreabbrev nto NERDTree
cnoreabbrev ntc NERDTreeClose
cnoreabbrev stm SyntasticToggleMode

" Installed plugins
call pathogen#infect()
