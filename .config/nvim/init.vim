"This .vimrc(or inti.vim) is for dairy use  
"by wufe8  

"BugFix  
set nocompatible
"set term=screen-256color  
filetype on
filetype plugin on
filetype indent on
let &t_ut=''
set backspace=indent,eol,start
"now \<BR> can be using at start  

"View 显示  
syntax on
"color mode 显示行数  
set number
"display rows 显示相对行数  
set relativenumber
"display relative rows 在光标行进行下划线高亮  
set cursorline
"show a line in the cursor row 在光标所在行显示一条线以作标识  
set shiftwidth=4
"auto shift will use this length 自动换行使用长度  
set tabstop=4
"\<tab> will show this blank length \<tab>的空白显示长度  
set softtabstop=0
"auto change into tab&space when type \<tab>, depend on tabstop value 输入\<tab>时将插入空格和制表符 取决于tabstop值  
set wrap
"auto line break 自动换行  
set showcmd
"show all possible command when type `<tab>` 命令行模式下按 `<tab>`进行单词猜想  
set wildmenu
"show command line completion when type `<tab>` and `<direction>` 命令行模式下按 `<tab>` 和方向键进行单词补全  
set hlsearch
"highlight the searched string 搜索时高亮全部查找词  
set incsearch
"highlight the cursor selecting string 高亮全屏中的光标当前单词  
set ruler
"show ruler at the right-bottom, default display cursor position 在右下角显示光标坐标  
set novisualbell
"bell when error occurs instead of flash screen 进行错误操作时将发出警告音 而不是闪烁屏幕  
 
"Edit 编辑  
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
set encoding=utf-8
"set termencoding=utf-8  
set fencs=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN.UTF-8  
"language message zh_CN.UTF-8  
 
set ambiwidth=double
"fix some word only graph half  

"Keymap  
"let mapleader="<space>"  
"map <space><space> <leader><leader>  
 
noremap s :w<CR>
"[s] to save file 保存  
noremap ; :
"make enter command easiler([;]) 更方便进入命令行模式  
noremap <C-,> ;
"[fFtT] can search faster: [,] go backword and [ctrl+,] go forword  
"更方便行内查找 并且避开因进入命令行模式按键修改的不兼容  
noremap r R
"[r] will entery Replace mdoe[R]  
"因为[R]用于文件处理了 更改[r]为原[R]进入替换模式 比单字符替换更适用   
map R <nop>
"[R*] File&Profile 文件与配置相关  
map RH <C-w>s:e $VIMDOC<CR><C-w>15+
"[RH] open help file need to define $VIMDOC 开启自定义说明文档 需要定义变量  
if(has('nvim'))
	map RC :source $MYNEOVIMRC<CR>
	map RE <C-w>v:e $MYNEOVIMRC<CR>
else
	map RC :source $MYVIMRC<CR>
	map RE <C-w>v:e $MYVIMRC<CR>
endif
"[RC] hot reload vimrc; [RE] fast open to edit vimrc  
"will use different vimrc(init.vim) if neovim  
"need to define $MYVIMRC, $MYNEOVIMRC  
"开启与重载vim配置文件 需要定义变量  
noremap <C-h> 5h
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-l> 5l
"[ctal+hjkl] to move faster 快速方向移动  
noremap <M-j> gj
noremap <M-k> gk
"[j/k] 将进行屏幕渲染行移动 更适用与实际编辑时的自动换行  
"同时上项的noremap <C->将不受影响 仍然为实际行跳转  
map S <nop>
"[S*] Split&Tabs 分屏与标签页相关  
map SA :set nosplitright<CR>:vsplit<CR>
map SS :set splitbelow<CR>:split<CR>
map SW :set nosplitbelow<CR>:split<CR>
map SD :set splitright<CR>:vsplit<CR>
"[S][WASD] to open new split in hjkl side 四向分屏  
"相比自带的[ctrl+w][sv]或`:split :vsplit`更快捷  
noremap <C-up> :res +5<CR>
noremap <C-down> :res -5<CR>
noremap <C-left> :vertical resize -5<CR>
noremap <C-right> :vertical resize +5<CR>
"[ctrl+arrow key] to zoom split size 调整分屏窗口尺寸  
map ST :tabedit 
"[ST] to new tab 新建标签页  
noremap <C--> :noh<CR>
if(has('nvim'))
	noremap <C--> :noh<CR>
else
	noremap <C-_> :noh<CR>
endif
"[ctrl+'-'(minus)] to hidden search result highlight 关闭搜索高亮显示  
"[ctrl+'/'] in linux
"noremap <F5> :call CompileRunProg()<CR>  
"func CompileRunRrog()
"	exec "w"
"	if &filetype == 'markdown'
"		exec "MarkdownPreview"
"	else
"		exec "echo "Unknown language!""
"	endif
"endfunc
"[F5] to auto complie 一键保存并编译  
"nmap <F4> <Plug>MarkdownPreview  
"nmap <F5> <Plug>MarkdownPreviewStop  
"nmap <F6> <Plug>MarkdownPreviewToggle  
 
"Keymap-Insert mode 插入模式下的快速操作  
inoremap /h1 # 
inoremap /h2 ## 
inoremap /h3 ### 
inoremap /h4 #### 
inoremap /h5 ##### 
inoremap /h6 ###### 
inoremap /c ``<Left>
inoremap /b ``````<Left><Left><Left><CR><CR><Up>
inoremap /l <CR>----------------------<CR>
"markdown  
imap /i <CR>if (){}<Left><Left><CR><Right><CR><CR><Up><Tab><Up><Up><esc>0f(a
imap /w <CR>while (){}<Left><Left><CR><Right><CR><CR><Up><Tab><Up><Up><esc>0f(a
imap /f <CR>for (int i = 0; ;i++){}<Left><Left><CR><Right><CR><CR><Up><Tab><Up><Up><esc>0f;a<Right>
"c, c++, java  
inoremap <C-z> <C-o>u
inoremap <C-u> <C-o><C-r>
inoremap <C-s> <C-o>:w<CR>
inoremap <C-x> <C-o>dd
inoremap <C-c> <C-o>yy
inoremap <C-v> <C-o>P
inoremap <C-b> <C-v>
"some single mode notepad keymap 对常见单模式文本编辑器快捷键的补充  
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <C-h> <Left><Left><Left><Left><Left>
inoremap <C-j> <Down><Down><Down><Down><Down>
inoremap <C-k> <Up><Up><Up><Up><Up>
inoremap <C-l> <Right><Right><Right><Right><Right>
"[ctal+direction] can be use in insert mode  
"插入模式下可通过[ctrl+方向键]实现更快速的移动  
"<M-hjkl> may not be run in linux

"Plugin
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
"rular栏美化
Plug 'ycm-core/YouCompleteMe'
"代码补全 需要python 在终端中进入插件目录输入 `python install.py --all` 即可编译所有可用语言的代码补全
Plug 'preservim/nerdtree'
"可视化文件管理菜单 支持书签
Plug 'Xuyuanp/nerdtree-git-plugin'
"使NERDTree通过图标提示文件的变动
Plug 'jistr/vim-nerdtree-tabs'
"使不同标签页下的NERDTree同步
Plug 'majutsushi/tagbar'
"可视化文件代码结构 支持快速跳转 需要python
Plug 'godlygeek/tabular'
"提供快速对齐代码块的方法
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"提供开启浏览器实时预览markdown的方法
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"go语言支持
Plug 'frazrepo/vim-rainbow'
"用不同颜色进行括号分级 使代码更易读
Plug 'preservim/nerdcommenter'
"快速注释代码
Plug 'airblade/vim-gitgutter'
"在行数左边显示git仓库的变动
Plug 'dense-analysis/ale'
"代码错误检查


"主题 亮暗模式可通过 `set background=[light/dart]` 实现
Plug 'connorholyday/vim-snazzy'
"冷色调 偏蓝 紫
Plug 'morhetz/gruvbox'
"主灰棕 高亮绿红橙
Plug 'Marfisc/vorange'
"类似gruvbox 但高亮色略有不同
Plug 'altercation/vim-colors-solarized'
"亮暗双模式 暗色模式蓝背景 主蓝色 不支持真彩色
Plug 'lifepillar/vim-solarized8'
"上主题的fork 支持真彩色
Plug 'soft-aesthetic/soft-era-vim'
"低对比 白 紫
Plug 'rakr/vim-one'
"亮暗双模式 偏原始风

call plug#end()

"theme
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark " for the dark version 
"set background=light " for the light version
if (has("gui_running") || has("nvim"))
	set termguicolors
endif

"colorscheme desert

colorscheme snazzy
let g:SnazzyTransparent=1

"colorscheme gruvbox
"let g:airline_theme="gruvbox"

"colorscheme solarized
"colorscheme solarized8
"let g:solarized_termtrans=1

"colorscheme vorange
"let g:airline_theme="vorange"

"colorscheme soft-era

"colorscheme one
"let g:airline_theme="one"

if(has('gui_running'))
	set guifont=SimHei:h17
	"1080p mode
	"set guifont=SimHei:h10
	"22line mode
elseif(has('nvim'))
	set guifont=黑体:h17
	"1080p mode, will return WARNING but aable to use
endif

"Tagbar
nmap <F8> :TagbarToggle<CR>

"NERDTree
autocmd vimenter * NERDTree
"open NERDTree split when vim opeded
map <F8> :NERDTree
map <F9> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
"will show hidden file 显示隐藏文件
let NERDTreeQuitOnOpen=1
"NERDTree will auto quit after open file 开启文件后NERDTree自动关闭
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"显示行号
let NERDTreeWinSize=30
"设置宽度
let g:nerdtree_tabs_open_on_console_startup=1
"在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"忽略一下文件的显示
let NERDTreeShowBookmarks=1
"显示书签列表

"NERDTree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 

"markdown-preview

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'chrome'

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

"vim-rainbow
let g:rainbow_active = 1
