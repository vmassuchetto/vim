
" Scheme
set t_Co=256
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
" You might want to change this
set nospell
set spelllang=pt

" Enable spelling on Markdown and LaTeX files
autocmd BufNewFile,BufRead markdown,latex set spell

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

" <Ctrl>-<Backspace> delete the previous word
:imap <C-BS> <C-W>

" Custom colors
highlight CursorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight ModeMsg    guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight Pmenu      guifg=NONE ctermfg=white ctermbg=black
highlight PmenuSbar  guifg=NONE ctermfg=white ctermbg=black
highlight PmenuSel   guifg=NONE ctermfg=black ctermbg=white

" Hightlight trailing whitespaces
highlight ExtraWhitespace ctermbg=darkgray guibg=darkgray
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

" Markdown syntax highlight
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" PHP formatting
let php_sql_query=1
let php_htmlInStrings=1

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

" Shift tabs
function ShiftTab(direction)
    let tab_number = tabpagenr()
    if a:direction == 0
        if tab_number == 1
            exe 'tabm' . tabpagenr('$')
        else
            exe 'tabm' . (tab_number - 2)
        endif
    else
        if tab_number == tabpagenr('$')
            exe 'tabm ' . 0
        else
            exe 'tabm ' . tab_number
        endif
    endif
    return ''
endfunction

" ctrl + shift + page <up|down> will shift tabs
inoremap <silent> <C-S-PageUp>  <C-r>=ShiftTab(0)<CR>
inoremap <silent> <C-S-PageDown>  <C-r>=ShiftTab(1)<CR>
noremap <silent> <C-S-PageUp>  :call ShiftTab(0)<CR>
noremap <silent> <C-S-PageDown> :call ShiftTab(1)<CR>

" Aliases
cnoreabbrev tbo TagbarOpen
cnoreabbrev tbc TagbarClose
cnoreabbrev nto NERDTree
cnoreabbrev ntc NERDTreeClose
cnoreabbrev stm SyntasticToggleMode

" Installed plugins
call pathogen#infect()
