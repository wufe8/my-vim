"this is a .vimrc for vanilla  
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
 
map s <nop>
map ss :w<CR>
"[ss] to save file 保存  
"锁定屏幕 <C-q>解除
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
if(has('nvim') && has('win32'))
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
"inoremap ( ()<Left>
"inoremap < <><Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"括号补全

