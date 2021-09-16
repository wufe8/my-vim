"This .vimrc(or init.vim) is for dairy use  
"by wufe8  

"----------------------
"autocmd 启动执行
"----------------------
"if has("nvim")
	"autocmd vimenter * set splitbelow
	"autocmd vimenter * split
"endif
"autocmd vimenter * term
"autocmd vimenter * resize 7
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

"----------------------
"BugFix 错误修复  
"----------------------
set nocompatible
"set term=screen-256color  
filetype on
filetype plugin on
filetype indent on
let &t_ut=''
set backspace=indent,eol,start
"now \<BR> can be using at start  

"----------------------
"View 显示  
"----------------------
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
 
"----------------------
"Edit 编辑  
"----------------------
set ignorecase
"searching will ignore case 搜索时忽略大小写  
set smartcase
"searching will ignore case when every letter is lower case  
set clipboard+=unnamed
"if \"+=unnamed" vim clipboard will share with system clipboard  
 
"----------------------
"Move 移动  
"----------------------
set scrolloff=8
set whichwrap=b,s,h,l,<,>,[,]
set mouse=nv
 
"----------------------
"Language 语言  
"----------------------
set fileencodings=utf-8,ucs-bom,shift-jis,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
"set termencoding=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN.UTF-8  
"language message zh_CN.UTF-8  
 
set ambiwidth=double
"fix some word only graph half  

"----------------------
"Keymap 映射  
"----------------------
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
noremap <C-.> ,
"[fFtT] can search faster: [ctrl+,] go backword and [alt+,] go forword  
"更方便行内查找 并且避开进入命令行模式以及锚点相关按键修改的不兼容  
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
map RI :tabedit $MYI3CFG<CR>
"打开i3wm配置文件

noremap <C-h> 5h
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-l> 5l
"[ctal+hjkl] to move faster 快速方向移动  
map <M-Down> <C-w>p5j<C-w>p
map <M-Up> <C-w>p5k<C-w>p
"[alt][Up/Down] 将进行另一分屏的移动 更适用快速浏览说明文档
map <M-j> gj
map <M-k> gk
"[alt][j/k] 将进行屏幕渲染行移动 更适用与实际编辑时的自动换行  
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
map SC :set splitbelow<CR>:split<CR>:terminal<CR>
"[ST] to new tab 新建标签页  
"[SC] create terminal split at the bottom 在底部创建内置终端  
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

inoremap \f \frac{<++>}{<++>}<C-o>2F{
inoremap \lim \displaystyle \lim_{x\to 0}
inoremap \u \overline{<++>}<C-o>F{
inoremap \q [<++>](<++>)<C-o>F[
inoremap \case $$<++>=\begin{cases}<CR><++>&\text{,if$<++>$}\\<CR><++>&\text{,if$<++>$}<CR>\end{cases}$$<C-o>3k<C-o>2F$
"markdown  

inoremap \ci if (<++>)<CR>{}<Left><CR><++><Down>
inoremap \cs switch (<++>)<CR>{}<Left><CR><BS>case <++>:<CR><++><CR>break;<CR>case <++>:<CR><++><CR>break;<CR>case <++>:<CR><++><CR>break;<CR>default:<CR><++><Down><C-o>?switch<CR><C-o>/<++><CR><C-o>:noh<CR>
inoremap \cw while (<++>)<CR>{}<Left><CR><++><Down><C-o>?while<CR><C-o>/<++><CR><C-o>:noh<CR>
inoremap \cf for (<++>; <++>; <++>)<CR>{}<Left><CR><++><Down><C-o>?for<CR><C-o>/<++><CR><C-o>:noh<CR>
inoremap \cc class <++><CR>{}<Left><CR><BS>private:<CR><++>;<CR><BS>public:<CR><++>(<++>);<CR><++>(<++>);<CR>~<++>();<Down>;<C-o>?class<CR><C-o>/<++><CR><C-o>:noh<CR>
inoremap \mp #include <iostream><CR>#include <vector><CR>#include <string><CR><CR>using namespace std;<CR><CR>int main(int argc, char* argv[])<CR>{}<Left><CR><++><CR>return 0;<Down><C-o>?<++><CR><C-o>:noh<CR><Tab>
inoremap \mh #ifndef <++><CR>#define <++><CR><CR><++><CR><CR>#endif
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
imap <M-Down> <C-o><C-w>p<C-o>5j<C-o><C-w>p
imap <M-Up> <C-o><C-w>p<C-o>5k<C-o><C-w>p
"[alt][Up/Down] 将进行另一分屏的移动 更适用快速浏览说明文档
"[ctal+direction] can be use in insert mode  
"插入模式下可通过[ctrl+方向键]实现更快速的移动  
"<M-hjkl> may not be run in linux+vim, but can be map in neovim

"----------------------
"括号的自动补全 效率与智能较低
"----------------------
"function! InsertPairs(charOpen, charClose)
    "let l:line = getline(".")
    "let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
    "if a:charClose != l:next_char
        "execute "normal! a" . a:charOpen . a:charClose . ""
    "end
"endfunction
"inoremap ( <ESC>:call InsertPairs('(', ')')<CR>i
"inoremap [ <ESC>:call InsertPairs('[', ']')<CR>i
"inoremap { <ESC>:call InsertPairs('{', '}')<CR>i
"" 括号补全 特别地 如果下一个字符是右括号 不会进行补全 避免出现重复字符
"function! RemoveNextDoubleChar(char)
    "let l:line = getline(".")
    "let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
    "if a:char == l:next_char
        "execute "normal! l"
	"else
		"execute "normal! a" . a:char . ""
    "end
"endfunction
"inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
"inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
"inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
"" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
"
""括号补全
"function! RemoveEmptyPairs()
    "let l:line = getline(".")
    "let l:previous_char = l:line[col(".")-1] " 取得当前光标前一个字符
    "let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
	""前后三种括号头尾时 删除整对
    "if previous_char == '(' && next_char == ')'
		"execute "normal! xxa"
	"elseif previous_char == '[' && next_char == ']'
		"execute "normal! xxa"
	"elseif previous_char == '{' && next_char == '}'
		"execute "normal! xxa"
	""普通退格
	""在开头时
	"elseif col(".") == 1
		"if len(l:line) == 0 
		""开头且为空行
		""TODO 解决删除行首字符时退行的问题
			"execute "normal! Xa"
		"end
	"else
		""在行尾时
		"if len(l:line) == col(".")
			"execute "normal! xa"
		"else
		""正常情况
			"execute "normal! xi"
		"end
    "end
"endfunction
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

function! BoolSwitch() "TODO 当光标在True/False前时仍然会执行操作 但删除位置错误
	let l:getWord = expand("<cword>")
	if l:getWord == "true"
		execute "normal! ciwfalse"
	elseif l:getWord == "false"
		execute "normal! ciwtrue"
	elseif l:getWord == "True"
		execute "normal! ciwFalse"
	elseif l:getWord == "False"
		execute "normal! ciwTrue"
	end
endfunction
noremap ,s :call BoolSwitch()<CR>
inoremap ,s <ESC>:call BoolSwitch()<CR>a
"Switch between True and False

imap \= <CR><ESC>ddkPI
imap \- <ESC>ddpXi
"向上回车(<S-BS><S-CR> can run correctly in non-gui vim)
map ,f /<++><CR>:noh<CR>
map ,F ?<++><CR>:noh<CR>
map ,c h/<++><CR>:noh<CR>xxxxi
map ,C ?<++><CR>:noh<CR>xxxxi
imap ,a <++>
imap ,f <C-o>/<++><CR><C-o>:noh<CR>
imap ,F <C-o>?<++><CR><C-o>:noh<CR>
imap ,c <C-o>b<C-o>/<++><CR><C-o>:noh<CR><C-o><Del><Del><Del><Del>
imap ,C <C-o>?<++><CR><C-o>:noh<CR><C-o><Del><Del><Del><Del>
"打锚点<++>; `,a`添加; `,n`向下搜索; `,N`向上搜索;
"`,c`向下搜索并删除锚点; `,C`向上搜索并删除锚点;

"----------------------
"Plugin 插件
"----------------------
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
"rular栏美化
"Plug 'ycm-core/YouCompleteMe'
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
"Plug 'dense-analysis/ale'
"代码错误检查
Plug 'jiangmiao/auto-pairs'
"自动括号补全 相较自行编写效率更高
Plug 'mbbill/undotree'
"编辑历史记录
Plug 'tpope/vim-surround'
"快速更改包裹符号
Plug 'Yggdroot/indentLine'
"可视化缩进

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
Plug 'vim-scripts/github-theme'
"github风

call plug#end()

"----------------------
"theme 主题
"----------------------
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
	"set guifont=SimHei:h17
	"1080p mode, will return WARNING but aable to use
	"some language in windows need 黑体 instand of SimHei
endif

"----------------------
"Plugin-setting 插件配置
"----------------------
"Tagbar
nmap <F7> :TagbarToggle<CR>

"undotree
nmap <F8> :UndotreeToggle<CR>

"NERDTree
"open NERDTree split when vim opeded
map <F9> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
"will show hidden file 显示隐藏文件
let NERDTreeQuitOnOpen=1
"NERDTree will auto quit after open file 开启文件后NERDTree自动关闭
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"显示行号
let NERDTreeWinSize=25
"设置宽度
"let g:nerdtree_tabs_open_on_console_startup=1
"启动vim及切换标签页时自动启动NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"忽略一下文件的显示
let NERDTreeShowBookmarks=1
"显示书签列表

"NERDTree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
				\ 'Modified'  :'✹ ',
				\ 'Staged'    :'✚ ',
				\ 'Untracked' :'✭ ',
				\ 'Renamed'   :'➜ ',
				\ 'Unmerged'  :'═ ',
				\ 'Deleted'   :'✖ ',
				\ 'Dirty'     :'✗ ',
				\ 'Ignored'   :'☒ ',
				\ 'Clean'     :'✔︎ ',
				\ 'Unknown'   :'? ',
				\ }
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeGitStatusConcealBrackets = 0 " default: 0
"Hide the boring brackets([ ])

"markdown-preview
map <F3> <Plug>MarkdownPreview  
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
let g:mkdp_browser = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

"vim-rainbow
let g:rainbow_active = 1

"ale
"参考: https://juejin.im/entry/6844903713421656071
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"indentLine
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
