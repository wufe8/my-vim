"This .vimrc is for dairy use
"by wufe8

"BugFix
set nocompatible
"set term=screen-256color
filetype on
let &t_ut=''
set backspace=indent,eol,start
"now \<BR> can be using at start
"View
syntax on
"color mode
set number
"display rows
set relativenumber
"display relative rows
set cursorline
"show a line in the cursor row
set tabstop=4
"tab will show this blank length
set wrap
"auto line break 
set showcmd
"show all possible command when you type <tab>
set wildmenu
"show command line completion when type `<tab>` and `<direction>`
set hlsearch
noh
"highlight the searched string
set incsearch
"highlight the cursor selecting string
set ruler
"Show ruler at the right-bottom, default display cursor position
set novisualbell
"Bell when error occurs instead of flash screen

"Edit
set ignorecase
"searching will ignore case 搜索时忽略大小写
set smartcase
"searching will ignore case when every letter is lower case
set clipboard+=unnamed
"if \"+=unnamed" vim clipboard will share with system clipboard

"Move
set scrolloff=8
set whichwrap=b,s,h,l,<,>,[,]
set mouse=nv

"Language
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set fileencoding=utf-8
"set encoding=utf-8
"set termencoding=utf-8
"set fencs=utf8,gbk,gb2312,gb18030
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8

"Keymap
"let mapleader="<space>"
"map <space><space> <leader><leader>
noremap s :w<CR>
map R :source $MYVIMRC<CR>

noremap <C-h> 5h
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-l> 5l

map S <nop>

map SA :set nosplitright<CR>:vsplit<CR>
map SS :set splitbelow<CR>:split<CR>
map SW :set nosplitbelow<CR>:split<CR>
map SD :set splitright<CR>:vsplit<CR>

noremap <C-up> :res +5<CR>
noremap <C-down> :res -5<CR>
noremap <C-left> :vertical resize -5<CR>
noremap <C-right> :vertical resize +5<CR>

noremap <C-_> :noh<CR>

"function
"==========================guifont++===============
"让vim像IDE一样一键放大缩小字号
"let guifontpp_size_increment=1 "每次更改的字号
"let guifontpp_smaller_font_map="<M-Down>" 
"let guifontpp_larger_font_map="<M-Up>" 
"let guifontpp_original_font_map="<M-Home>"

"Plugin
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
"Plug 'xleng/YCM_WIN_X86'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'

"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'

call plug#end()


"theme
"colorscheme desert
"colorscheme snazzy
colorscheme gruvbox
"set guifont=SimHei:h10
"22line mode

let g:solarized_termtrans=1

set guifont=SimHei:h17
"1080p mode

let g:SnazzyTransparent=1

"NERDTree
autocmd vimenter * NERDTree
map <F10> :NERDTreeToggle<CR>
map <F11> :NERDTree
let NERDTreeShowHidden=1

"if exists('g:NERDTreeWinPos')
"    autocmd vimenter * NERDTree D:\repo
"endif

