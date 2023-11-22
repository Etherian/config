let mapleader = " "
noremap <space> <Nop>

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set backspace=indent,eol,start

set nowrap

set encoding=utf-8
set fileformats=unix,dos

syntax enable
filetype plugin indent on


"""""""""""
" Plugins "
"""""""""""
silent!call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-obsession'

Plug 'junegunn/fzf'

Plug 'junegunn/fzf.vim'

Plug 'junegunn/gv.vim'

Plug 'idanarye/vim-merginal'

Plug 'jeetsukumaran/vim-buffergator'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'gluon': { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt': '*/', 'nested': '', 'nestedAlt': '' } }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = 'jellybeans'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_symbols.maxlinenr = ''

Plug 'rbong/vim-crystalline'
let g:crystalline_enable_sep = 1

function! TabLabel(buf, max_width) abort
    let [l:left, l:name, l:short_name, l:right] = crystalline#default_tablabel_parts(a:buf, a:max_width)
    return l:left . l:short_name . ' ' . WebDevIconsGetFileTypeSymbol(l:name) . l:right
endfunction

function! TabLine() abort
    return crystalline#bufferline(0, 0, 0, 1, 'TabLabel', crystalline#default_tabwidth() + 3)
endfunction

set tabline=%!TabLine()

Plug 'airblade/vim-gitgutter'
let g:gitgutter_grep = 'rg --no-config --color=never'
let g:gitgutter_map_keys = 0

Plug 'gluon-lang/vim-gluon'

Plug 'vito-c/jq.vim'

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1

Plug 'pprovost/vim-ps1'

Plug 'ryanoasis/vim-devicons'

call plug#end()


"""""""""""
" Utility "
"""""""""""
function Reduce(xs, fn)
    let acc = a:list[0]
    for value in a:list[1:]
        let acc = a:fn(acc, value)
    endfor
    return acc
endfunction


""""""""""""
" Key maps "
""""""""""""
nnoremap ; :
vnoremap ; :

noremap gh ^
noremap gl g_

noremap <A-h> <C-\><C-N><C-w>h
noremap <A-j> <C-\><C-N><C-w>j
noremap <A-k> <C-\><C-N><C-w>k
noremap <A-l> <C-\><C-N><C-w>l
noremap <A-Left> <C-\><C-N><C-w>h
noremap <A-Down> <C-\><C-N><C-w>j
noremap <A-Up> <C-\><C-N><C-w>k
noremap <A-Right> <C-\><C-N><C-w>l

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
tnoremap <Esc><Esc> <C-\><C-N>

" CoC "
"""""""
nnoremap <silent> <F15><F15> :call CocAction('doHover')<CR>
vnoremap <silent> <F15><F15> :call CocAction('doHover')<CR>

" Select inner function
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)

" Select around function
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Git Gutter "
""""""""""""""
nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap ]h <Plug>(GitGutterNextHunk)

onoremap ih <Plug>(GitGutterTextObjectInnerPending)
onoremap ah <Plug>(GitGutterTextObjectOuterPending)
xnoremap ih <Plug>(GitGutterTextObjectInnerVisual)
xnoremap ah <Plug>(GitGutterTextObjectOuterVisual)

" Autocomplete "
""""""""""""""""
noremap! <expr> <F15> pumvisible() ? "\<C-n>" : "\<F15>"
noremap! <expr> <S-F15> pumvisible() ? "\<C-p>" : "\<S-F15>"

noremap! <expr> <Down> pumvisible() ? "\<C-e>\<Down>" : "<Down>"
noremap! <expr> <Up> pumvisible() ? "\<C-e>\<Up>" : "<Up>"


""""""""""""""
" Appearance "
""""""""""""""
colorscheme evening

if !exists("PrettyWhitespace")
    autocmd BufRead * set list listchars=space:·,extends:…,precedes:…,tab:⇨▻
    let PrettyWhitespace = 1
endif
highlight Whitespace ctermfg=Grey guifg=Grey30

" Quieter paren matching
highlight MatchParen gui=bold,underline guibg=None

" Prettier Preview window
highlight Pmenu guibg=tomato4
highlight PmenuSel guibg=tomato3
highlight PmenuSbar guibg=Grey

" Calmer tabline
highlight TabLine guifg=Grey10
highlight TabLineFill cterm=NONE gui=NONE
highlight link TabLineFill TabLine

set number

set scrolloff=2
set sidescrolloff=5

set showtabline=2


""""""""""""""
" Completion "
""""""""""""""
set updatetime=1000


""""""""""""
" Terminal "
""""""""""""
set shell=powershell shellpipe=\| shellredir=> shellquote= shellxquote=
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command

if has('nvim') || has('termguicolors')
    set termguicolors
endif


"""""""""""""""""""""
" Language-Specific "
"""""""""""""""""""""
if !exists("MarkdownSpecifics")
    autocmd FileType markdown setl wrap|setl linebreak|setl shiftwidth=2|setl softtabstop=2
    let MarkdownSpecifics = 1
endif

if !exists("YAMLSpecifics")
    autocmd FileType yaml setl shiftwidth=2|setl softtabstop=2
    let YAMLSpecifics = 1
endif

if !exists("LuaSpecifics")
    autocmd FileType lua setl shiftwidth=2|setl softtabstop=2
    let YAMLSpecifics = 1
endif

if !exists("JQSpecifics")
    autocmd FileType jq setl shiftwidth=2|setl softtabstop=2
    let JQSpecifics = 1
endif



""""""""""""""""""""""
" Session Management "
""""""""""""""""""""""

let session = glob(argv(0) . "/Session.vim")
if !exists("SessionStarted") && argv(0) != "" && !empty(session)
    execute ":source " . session
    let SessionStarted = 1
endif
