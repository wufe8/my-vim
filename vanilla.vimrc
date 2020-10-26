"this is a .vimrc for vanilla  
"by wufe8  

"Autocmd
if has("nvim")
	autocmd vimenter * set splitbelow
	autocmd vimenter * split
endif
autocmd vimenter * term
autocmd vimenter * resize 7
"开启内置终端
"if(has('nvim') && has('win32'))
	"autocmd vimenter * tabedit $MYNEOVIMRC
"else
	"autocmd vimenter * tabedit $MYVIMRC
"endif
"autocmd vimenter * vsplit $VIMDOC
"新建窗口打开vimrc及vim文档
"autocmd vimenter * vertical resize 65
"autocmd vimenter * tabfirst
"自启动文件有出现无代码高亮的bug 有需要请手动关闭并重新打开文件

"Autocmd-require some plugin
"autocmd vimenter * TagbarToggle
"autocmd vimenter * vertical resize 110
"autocmd vimenter * NERDTree
"开启tagbar以及NERDTree

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
set splitbelow
"`split` will open on the below of origin window(default is `nosplitbelow`) 创建默认垂直分屏窗口将创建在相对原窗口的下方 而非上方  
set splitright
"`vsplit` will open in the right of origin window(default is `nosplitright`)) 创建默认垂直分屏窗口将创建在相对原窗口的右方 而非左方  
 
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
set fileencodings=utf-8,ucs-bom,shift-jis,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
"set termencoding=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,cp936,gb18030,big5,euc-jp,euc-kr,latin1
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
map + <C-a>
map - <C-x>
"添加数字自增减
noremap <C-,> ;
"[fFtT] can search faster: [,] go backword and [ctrl+,] go forword  
"更方便行内查找 并且避开因进入命令行模式按键修改的不兼容  
noremap r R
"[r] will entery Replace mdoe[R]  
"因为[R]用于文件处理了 更改[r]为原[R]进入替换模式 比单字符替换更适用   
map R <nop>
"[R*] File&Profile 文件与配置相关  
map RH <C-w>v:e $VIMDOC<CR><C-w>15+
"[RH] open help file need to define $VIMDOC 开启自定义说明文档 需要定义变量  
if(has('nvim') && has('win32'))
	map RC :source $MYNEOVIMRC<CR>
	map RE :tabedit $MYNEOVIMRC<CR>
else
	map RC :source $MYVIMRC<CR>
	map RE :tabedit $MYVIMRC<CR>
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
noremap <C-up> :res +3<CR>
noremap <C-down> :res -3<CR>
noremap <C-left> :vertical resize -3<CR>
noremap <C-right> :vertical resize +3<CR>
"[ctrl+arrow key] to zoom split size 调整分屏窗口尺寸  
"windows下 ctrl+上下可能无效
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

tnoremap <Esc><Esc> <C-\><C-n>
"quit exit terminal mode 快速退出终端模式

"Keymap-Insert mode 插入模式下的快速操作  
inoremap \h1 # 
inoremap \h2 ## 
inoremap \h3 ### 
inoremap \h4 #### 
inoremap \h5 ##### 
inoremap \h6 ###### 
inoremap \v ``<Left>
inoremap \b ``````<Left><Left><Left><CR><CR><Up>
inoremap \l <CR>----------------------<CR>
"markdown  

imap \i if (<++>)<CR>{<CR><++><CR>}
imap \s switch (<++>)<CR>{<CR><BS>case <++>:<CR><++><CR>break;<CR>case <++>:<CR><++><CR>break;<CR>case <++>:<CR><++><CR>break;<CR>default:<CR><++><CR>}<C-o>?switch<CR><C-o>/<++><CR><C-o>:noh<CR>a
imap \w while (<++>)<CR>{<CR><++><CR>}<C-o>?while<CR><C-o>/<++><CR><C-o>:noh<CR>a
imap \f for (<++>; <++>;<++>)<CR>{<CR><++><CR>}<C-o>?for<CR><C-o>/<++><CR><C-o>:noh<CR>a
imap \c class <++><CR>{<CR><BS>private:<CR><++>;<CR><BS>public:<CR><++>(<++>);<CR><++>(<++>);<CR>~<++>();<CR><BS>};<C-o>?class<CR><C-o>/<++><CR><C-o>:noh<CR>a
imap \mp #include <iostream><CR>#include <vector><CR>#include <string><CR><CR>using namespace std;<CR><CR>int main(int argc, char* argv[])<CR>{<CR><++><CR>return 0;<CR><BS>}<C-o>?<++><CR><C-o>:noh<CR><Tab>
imap \mh #ifndef <++><CR>#define <++><CR><CR><++><CR><CR>#endif
"c, c++

inoremap <C-z> <C-o>u
inoremap <C-u> <C-o><C-r>
inoremap <C-s> <C-o>:w<CR>
inoremap <C-x> <C-o>dd
inoremap <C-c> <C-o>yy
inoremap <C-v> <C-o>p
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
"<M-hjkl> may not be run in linux+vim, but can be map in neovim

"括号的自动补全 效率与智能较低
function! InsertPairs(charOpen, charClose)
	let l:line = getline(".")
	let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
	if a:charClose != l:next_char
		execute "normal! a" . a:charOpen . a:charClose . ""
	end
endfunction
inoremap ( <ESC>:call InsertPairs('(', ')')<CR>i
inoremap [ <ESC>:call InsertPairs('[', ']')<CR>i
inoremap { <ESC>:call InsertPairs('{', '}')<CR>i
" 括号补全 特别地 如果下一个字符是右括号 不会进行补全 避免出现重复字符
function! RemoveNextDoubleChar(char)
	let l:line = getline(".")
	let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
	if a:char == l:next_char
		execute "normal! l"
	else
		execute "normal! a" . a:char . ""
	end
endfunction
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符

"括号补全
function! RemoveEmptyPairs()
	let l:line = getline(".")
	let l:previous_char = l:line[col(".")-1] " 取得当前光标前一个字符
	let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
	"前后三种括号头尾时 删除整对
	if previous_char == '(' && next_char == ')'
		execute "normal! xxa"
	elseif previous_char == '[' && next_char == ']'
		execute "normal! xxa"
	elseif previous_char == '{' && next_char == '}'
		execute "normal! xxa"
	"普通退格
	"在开头时
	elseif col(".") == 1
		if len(l:line) == 0 
		"开头且为空行
		"TODO 解决删除行首字符时退行的问题
			execute "normal! Xa"
		end
	else
		"在行尾时
		if len(l:line) == col(".")
			execute "normal! xa"
		else
		"正常情况
			execute "normal! xi"
		end
	end
endfunction
" 按退格键时判断当前光标前一个字符，如果是左括号，则删除对应的右括号以及括号中间的内容
function! RemovePairs()
	let l:line = getline(".")
	let l:previous_char = l:line[col(".")-1] " 取得当前光标前一个字符
	if index(["(", "[", "{"], l:previous_char) != -1
		let l:original_pos = getpos(".")
		execute "normal %"
		let l:new_pos = getpos(".")
		" 如果没有匹配的右括号
		if l:original_pos == l:new_pos
			execute "normal! xa"
			return
		end
		let l:line2 = getline(".")
		if len(l:line2) == col(".")
			" 如果右括号是当前行最后一个字符
			execute "normal! v%xa"
		else
			" 如果右括号不是当前行最后一个字符
			execute "normal! v%xi"
		end
	else
		"在开头时
		if col(".") == 1
			"开头且为空行
			"TODO 解决删除行首字符时退行的问题
			if len(l:line) == 0 
				execute "normal! Xa"
			end
		else
			"在行尾时
			if len(l:line) == col(".")
				execute "normal! xa"
			else
			"正常情况
				execute "normal! xi"
			end
		end
	end
endfunction
" 用退格键删除一个左括号时同时删除对应的右括号
inoremap ,d <ESC>:call RemovePairs()<CR>a
"inoremap <BS> <ESC>:call RemoveEmptyPairs()<CR>a
"括号删除 https://juejin.im/entry/6844903473050304526
inoremap \= <CR><ESC>ddkPI
inoremap \- <ESC>ddpXi
"向上回车(<S-BS><S-CR> can run correctly in non-gui vim)
inoremap ,a <++>
inoremap ,f <C-o>/<++><CR><C-o>:noh<CR>
inoremap ,F <C-o>?<++><CR><C-o>:noh<CR>
inoremap ,c <C-o>/<++><CR><C-o>:noh<CR><C-o>da<
inoremap ,C <C-o>?<++><CR><C-o>:noh<CR><C-o>da<
"打锚点<++>; `,a`添加; `,f`向下搜索; `,F`向上搜索;
"`,c`向下搜索并删除锚点; `,C`向上搜索并删除锚点;

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

if(has('gui_running'))
	set guifont=SimHei:h17
	"1080p mode
	"set guifont=SimHei:h10
	"22line mode
elseif(has('nvim'))
	"set guifont=黑体:h17
	set guifont=SimHei:h17
	"1080p mode, will return WARNING but aable to use
	"some language in windows need 黑体 instand of SimHei
endif
