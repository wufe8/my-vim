# vim常用操作笔记 
该笔记由wufe8制作编辑 尽可能只使用vim编辑 用于学习vim并进行记录  

----------------------

## 索引
- [文档规则说明](#文档规则说明)
- [最基础操作](#最基础操作)
    - [启动](#启动)
    - [模式](#模式)
    - [模式切换](#模式切换)
- [普通模式](#普通模式)
    - [操作符 Operation](#操作符-Operation)
        - [编辑相关](#编辑相关)
        - [移动相关](#移动相关)
        - [检索相关](#检索相关)
    - [附加操作 Motion](#附加操作-Motion)
    - [折叠 Fold](#折叠-Fold)
    - [宏 Macro](#宏-Macro)
- [可视模式](#可视模式)
    - [直接进行操作](#直接进行操作)
    - [行指令操作](#行指令操作)
    - [快速行操作](#快速行操作\(块可视模式限定\))
- [命令行模式](#命令行模式)
    - [常用](#常用)
    - [文件管理](#文件管理)
    - [书签 Marks](#书签-Marks)
    - [分屏 Split](#分屏-Split)
	    - [终端 Terminal](#终端-Terminal)
    - [标签页 Tabs](#标签页-Tabs)
- [自定义Vim配置](#自定义Vim配置)
    - [快捷键 Keymap](#快捷键-Keymap)
    - [兼容性&修复 Fix](#兼容性&修复-Fix)
    - [显示 View](#显示-View)
    - [编辑 Edit](#编辑-Edit)
    - [定位 Move](#定位-Move)
    - [语言 Language](#语言-Language)
	- [函数 Function](#函数-Function)
- [插件](#插件-Plugin)
    - [使用方法](#使用方法)
    - [Vim-Plug常用指令](#Vim-Plug常用指令])
    - [插件推荐](#插件推荐)
    - [个性化](#个性化)
	- [YouCompleteMe-代码补全](#YouCompleteMe)
	- [ale-代码检查](#ale)
    - [NERDTree-文件管理](#NERDTree)
    - [tagbar-代码结构管理](#Tagbar)
    - [tabular-快速对齐](#Tabular)
	- [NERDCommenter-快速注释](#NERDCommenter)
- [记录 Changelog](#记录-Changelog)
- [贡献者](#贡献者)
- [许可 LICENSE](#许可-LICENSE)

----------------------

## 文档规则说明
因为markdown面向html 因此所有非 `代码框`(\`原文\`)内的小于号都改为了 `<` 如果看到请自行忽略转义符 `\`(反斜杠)  

\<astring1/string2> 使用string1或string2代替 更多"/"时同理(如"\<file>"指使用文件名代替)  

| 例        | 意义                 |
| :-------- | -------------------  |
| bool      | 布尔值(0或1)         |
| direction | 方向 即上下左右      |
| n         | 数字                 |
| char      | 字符                 |
| latter    | 字母(a-z,A-Z)        |
| symbol    | 符号                 |
| string    | 字符串               |
| file      | 文件名               |
| folder    | 文件夹名             |
| operation | 命令模式-指令        |
| command   | 命令行模式-指令      |
| motion    | 命令模式-附加字符    |
| option    | 命令行模式-附加参数  |
| function  | 函数名               |
| CR        | 回车                 |
| BS        | 退格                 |
| Leader    | vim特殊键 默认是`\`  |
| nop       | 空(vim中\<nop>即空)  |
| enum      | 枚举值 一般另有说明  |

\[c0/c1/c2\] 可选 一般指代按键枚举值

> 注意这与vim配置描述格式并不一样 更贴近人类可读性(如"on/off"指输入on或off代替)  

"当前单词" 指代以光标为原点 从句首或上一个空格或符号 到 句末或下一个空格或符号 的范围内的字符串  

"默认" 指代不进行输入时的结果  

----------------------

## 最基础操作
### 启动
`vim <enum> <file>` 使用vim打开 \<file>可选且可多选 用空格分割 默认为无名字空文件  
\<enum>为参数 可选 可多选 空格分割 属于unix风格指令 参数如下:  
`-r` 只读模式打开  
`-b` 二进制模式打开  
`-on` 上下分屏的形式打开多个文件  
`-On` 左右分屏的形式打开多个文件  

> 关于分屏 [见下](# 分屏-Split)  

> 开始时进入普通模式  

### 模式
vim有4种操作模式   
1. Insert 插入(编辑)模式 另有Replace 替换模式 按Ins键进入 同普通编辑器   
2. Normal 普通(命令)模式 可输入字符进行操作   
3. Command-line 命令行模式 输入字符串\<aCR\>进行操作   
4. Visual 可视模式 可选取范围的模式 一般用于批量编辑   

### 模式切换
`i` `I` `a` `A` `o` `O` 普通模式进入插入(编辑)模式 正常编辑    
再按\<Insert\>键进入替换模式 输入的字符将会替换光标后的现有字符    
> 不同处:   
> - `i` insert 在光标前插入  
>     - `I` 在光标所在行的行首插入  
> - `a` append 在光标后插入  
>     - `I` 在光标所在行的行尾插入  
> - `o` open below 在光标下开新行插入  
>     - `O` 在光标上开新行插入  

`v` `V` `ctrl+v` 普通模式进入可视模式  
> 不同处  
> - `v` 从切换模式时光标所在处选取到光标所在处 类似于普通编辑器中按住鼠标左键选取  
> - `V` 从切换模式时光标所在行选取到光标所在行 类似上述 但是只能直接选取整行  
> - `ctrl+v` 选取从切换模式时光标所在处到光标所在处间的范围块 类似于普通编辑器中按住alt+鼠标左键选取  

`esc` 进入普通模式  

`:` 普通模式下进入命令行模式  

`[ctrl+o]` 编辑模式下临时进入普通模式 输入一次完整操作后自动回到普通模式(插入等待普通模式 一种特殊的模式)  

```
shell --`vim <gfile>`->  普通模式   --`a`-`i`-`o`-->插入模式<--T
  F                    /  ^ \   F   <g----`esc`-------|  |     |
   \                 `:` /  `v`  \                     `ctrl+o`|
    \                / `esc`  \ `esc`                    | `自动返回`
     \              L  /       V   \                     V     |
      L--`:wq`--命令行模式     可视模式              插入等待普通模式
```

----------------------

## 普通模式
> 通用格式 `<n><operation><n><motion>`(没有空格)  
> `n`即重复执行次数/范围 可选; `<motion>`操作符需要指定范围的都必选  
> 在操作前后输入\<n>皆可 但含义其实不同 一般在前指该操作执行1次操作n行 而在后指执行n次每次操作1行  
> 输入过程中按`<Esc>`取消  

### 操作符 Operation

#### 编辑相关
> 注意vim的任何删除操作都会将删除的字符串移入剪切板 因此更准确来说 vim所有的删除操作都是剪切操作(插入模式下`<BR>` `<Delete>`等直接编辑操作除外)  

- 默认需要指定范围的指令( `c` `y` `d` )都需要附加操作符来选定作用范围 关于附加操作 见[下](#附加操作 Motion)

`c` cut 删除并进入插入模式 `C` 同 但为删除光标至行尾的字符(相当于 `c$`)  
`s` 删除光标后一个字符并进入插入模式 `S` 同 但为删除整行  
`x` 同`<Delete>` `X` 同`<Backspace>` 但都同其他操作符一样会移入剪切板  
`d` delete 删除 `D` 同 但为删除光标到行尾的字符(相当于 `d$`)  
`y` yank 复制  
`p` paste 从下行粘贴 `P` 从本行粘贴  

`u` undo 撤销 `U` 整行撤销 适用于想快速撤销对单行进行的多次连续操作  
`[ctrl+r]` replace 重做  

`r<char>` replace char 替换光标所在字符 相当于临时`<Insert>`  
`R` replace mode 在光标后进入替换模式 相当于`i<Insert>`  

`>` `<` 代码缩进  
`[ctrl+a]` `[ctrl+x]` 如果光标所指为\<number> 那么该\<number>将进行自加减 可为负数 非个位数  
`J` 将下一行与本行合并 相当于`jI<BR><Space><esc>`(移动到下一格 在行首插入 退格 空格 回到普通模式)  

#### 移动相关
```
    k
    ^
    |
h<--+-->l
    |
    V
    j
```
`h` `j` `k` `l` 分别同左下上右方向键  
`gj` `gk` 上下移动光标 但并非移动实际行 而是屏幕显示的渲染行 (建议考虑映射至 `j` `k` 关于按键映射 见[这里](#快捷键-keymap))
`H` `M` `L` 光标跳转至窗口最顶/中/最底行的开头 到顶/底行的行为会受到 `scrolloff` 值的限制 具体见[移动 Move](#移动 Move) 并建议进行实际测试  
`+` `-` 同上下  

`f` find char 光标跳转至 下一个\<char>  
`F` find char(back) 光标跳转至 上一个\<char>  
`t` till char 光标跳转至 下一个\<char>前  
`T` till char(back) 光标跳转至 上一个\<char>前  
`;` 同`f``t` \<char>为上一次的`f` `t`
`;` 同`f``t` \<char>为上一次的`f` `t`

`e` end of word 光标跳转至 当前单词的尾部  
`w` next word 光标跳转至 当前单词的尾部后的空格  
`b` back word 光标跳转至 当前单词的头部  
`E` `W` `B` 效果类似以上三项 但"单词"的判断硬性为以空格分隔 而不会将符号作为"单词"与"单词"的分隔了
`%` 支持大/中/小括号 当光标所在字符为有头尾配对的括号时 输入 `%` 将跳转到另一半的括号  
> 尝试将光标放这里的任一括号 并输入 `%` 体会效果: `int outPut{print(paperArray[20]);}`  

> `cw` 删除光标所在的 单词 并进入插入模式 可以很方便修改文字 具体这种使用方法将在[addon](#addon)部分进行说明  

`<CR>`(回车) 同[j/↓]+Home 光标跳转至下一行行首  
`<BR>`(退格) 同[h/←] 但会和普通编辑器一样 光标在行首时跳至上一行行末  
`[space]`(空格) 同[l/右]  
`0` `^` 回到行首 同`[Home]`  
`$` 跳转到行尾 同`[End]`  
`gg` 跳转到第一行  
`G` 跳转到最后一行  
`<n>G` 跳转到第\<n>行  

`(` `)` 上/下一句句首  
`{` `}` 上/下一段段首(以`\n`(空行)进行判断) 

> 如开头所说的通用格式 这些移动操作大多数也是可以使用 `<n><operation>` 的 例如 `2w` 指光标跳过2个单词到其后面的空格上  

#### 检索相关
`/<string>` 向下搜索[string]字符串 默认大小写敏感  
`?<string>` 向上搜索[string]字符串 默认大小写敏感  
搜索后n跳至下一个 N跳回上一个  
> 在其后面添加 `\c` 则忽略大小写 `\C` 则不忽略大小写  
> 关于如何默认忽略大小写以及智能忽略大小写 请见[配置-编辑](#编辑 Edit)  

`[ctrl+g]` 在命令行区显示当前文件与光标所在行的一些信息  
`g[ctrl+g]`(按`g`然后再按`[ctrl+g]`) 在命令行区显示当前文件的数据统计信息  

`<n><direction>`光标向指定方向移动(n格)  
`ZZ` 等同于`:wq`(保存并退出)  

> 关于查找并替换 请见[查找并替换](#查找并替换)  

### 附加操作 Motion
> 参考[链接](https://blog.ihuxu.com/the-tips-of-vimer-who-learned-for-10-monthes/)  
以下"案例"指:`printf("He[光标在此]llo world!");`  

- `<n><operation/direction>` 一般为\<n>行或往某方向操作  

\<n>可选 如`yy`指复制整行 `d3d` 指剪切光标起往下3行; `c5l`指删除光标起往右的5个字符并进入编辑模式  
如该章开头所说 也可在操作符前面输入\<n> 如 `3dd` 指剪切光标起往下3行  

- `w``e``b``f<char>``0``$`等操作 就如用这些操作符进行光标跳转一样选定操作范围  

案例示例:
输入 `yw` 复制`llo`  
输入 `yfr` 复制`llo wor`  
输入 `y$` 复制 `llo world!")`  

- `i<enum>` in 将操作范围作用在\<enum>内(不包含\<enum>)  
- `a<enum>` all 将操作范围作用在\<enum>内(包含\<enum>)  
- `t<enum>` till 将操作范围作用到\<enum>前(不包含\<enum>) 一般是的默认项 基本可用`f<char>`代替  

\<enum>可以为:  
`w` 单词; `s` 句子(以`.`进行识别); `p` 段落(以`\n`(空行)进行识别)  
也可以为括号 引号类的成对符号\<symbol>  

案例示例:  
输入 `diw` 剪切 `Hello`; 输入 `yi"` 复制 `Hello world!`; 输入 `ya"` 复制 `"Hello world!"`  

> `printf("Hello world!");`  

### 宏 Macro
`q<letter>` 开始宏记录 记录到`<letter>`宏寄存器中 `q` 停止宏记录  
> 宏并非临时保存 重启vim后仍然有效  
> 宏录制期间 任何操作都会被记录 包括命令行指令 关于命令行指令 见[这里](#命令行指令)  

`@<letter>` 执行对应宏 `@@` 执行上一次执行的宏  
执行宏同样可以前加\<n>表执行次数 如`100@a`则执行 `a` 宏寄存器记录的宏100次  
> 执行后 将会完全重复用户宏记录时的全部操作  

----------------------

## 可视模式
> 一般配合y,d,c等进行范围圈定  
`v`  Visible 进入可视模式 `V` V-Line 进入行可视模式 `ctrl+v` V-Block 进入块可视模式  
此时可移动光标选取范围 配合指令使用  

光标移动仍然可以使用各种跳转操作 如 `G` 跳转到最后一行 此时即选取到最后一行  
> tips: `ggVG` 全选--跳转到第一行 进入行可视 跳转到最后一行  

### 直接进行操作

圈定范围后如输入 `d` 则剪切范围内字符  

另有特别操作符:  
`U` 选取内英文全转大写  

### 行指令操作

1. 圈定范围
2. 输入 `:` 命令行区将出现 `:'\<,'> `(输入 `esc` 取消)
3. 此时输入命令行模式指令即可在圈定的每一行各执行一次  

如 `normal <operation>` 将在圈定的每一行各进行一次普通模式操作\<operation>  
> 例如在圈定行的每一行行末都加上".jpg"  
> 假想操作如下:  
> 1. `esc` 进入普通模式  
> 2. `V` 进入行可视模式  
> 3. 若干 `jk` 进行范围圈定  
> 4. `:` 开始行指令操作  
> 5. 输入 `normal A.jpg` 即可完成多行行末添加".jpg"字符串 (`:'\<,'>normal A.jpg`)  

> 关于命令行操作 参见[命令行模式](#命令行模式)  

### 快速行操作(块可视模式限定)

1. 块可视模式下圈定范围  
2. 输入 `A/I` 在行首/尾进入插入(特殊)模式  
   `c/C` 删除范围内字符/范围头到行尾并进入插入(特殊)模式  
3. 输入任意字符后esc进入普通模式 同时将对此前圈定范围的每行都进行同样的插入方式  

- 相较行指令操作更快捷灵活 但却仅限于添加字符(切换到替换模式后不会进行批处理) 而无法进行其他操作  

> 例子同上的行指令操作  
> 假想操作如下：  
> 1. `esc` 进入普通模式  
> 2. `ctrl+v` 进入块可视模式  
> 3. 若干 `hjkl` 进行范围圈定  
> 4. `A/I` 在行首、尾进入插入(特殊)模式 输入".jpg"  
> 5. `esc` 进入普通模式 即可完成多行行末添加.jpg字符串  

---------------------

## 命令行模式
> 通用格式 `:<command><\option>`   
> 输入 `:` 后即可使用上下方向键 快速输入历史命令命令   
> 输入 `q:`可分屏打开命令行窗口 查看历史命令记录 上下方向键选择 \<CR>执行  
> 支持[tab]自动补全命令 有多个命令时左右方向键进行切换  
> 支持模糊 如 `:resize +5` 也可写成 `:res +5` 因为由res开头的命令只有resize  

`:<command>a <\option>` 全部/全局操作  

### 常用
`:w <FileName>` 保存 现有文件保存时 `<FileName>` 可忽略 可视模式下可保存圈定范围内的字符到新文件   
`:q` 退出vim  
`:q!` 强制退出  
`:wq` 同`:w` + `:q`  
`:source <file>` 应用\<file>内vim配置  
`:edit <file>` 打开\<file> 也可 `:e <file>`  
`:noh` 关闭高亮搜索留存  
`:ls` 或 `:buffer` 查看剪切板 注意不是一般所认为的 `ls` 如果要查看目录文件 应使用 `:!ls` 或 `:!dir`  
`:!<externCommand>` 外部指令 依靠系统cmd/shell  
`:normal <operation>` 同普通模式的操作符 一般配合可视模式下的行指令操作使用  
`:set <option>` 临时设置vim配置 重启即失效 如希望重启仍生效 请见 [](#)  

`:CheckHealth` Neovim独有 检查插件语言支持情况 可根据指示进行安装配置  

#### 查找并替换

- 总览: `:<range>s/<oldString>/<newString>/<sign>`  
- [参考](https://harttle.land/2016/08/08/vim-search-in-file.html)  

`:s/<oldString>/<newString>` 基础格式 搜索范围为光标所在行 且谨替换最近一个  
\<oldString>为查找字符串 \<newString>为替换字符串  
> 除此之外皆为可选  

`<range>` 搜索范围  
1. `[%]` 全文  
2. `['\<,'>]` (可视模式下的行指令操作) 圈定范围  
3. `[<n0>,<n1>]` 从\<n0>到\<n1>行 特别地 `[.]`表示当前行 用`[+-<n>]`表示相对行  

`/<sign>` 替换标志  
1. `[g]` 全部替换  
2. `[i]` 大小不写敏感 `[I]`(大写`[i]`) 大小写敏感  
3. `[c]` 替换前询问  
    - 询问时:  
    - `[y]` 替换; `[n]` 不替换; `[a]` 替换所有; `[q]` 退出; `[l]` 替换当前并退出; `[^Y]` `[^E]` 光标上下移动  

`\=<function>` 可使用函数返回值 见[函数](#函数-Function)

### 文件管理
`:cd <direction>` change directiry 转移目录  
`:pwd` 当前目录  
`:r [<file>/!<externCommand>]` 将\<file>的内容粘贴到光标位置 或者将\<externCommand>的输出粘贴到光标位置  
更多的文件管理需要依靠外部指令 `:!<externCommand>`  
如: `:!ls <direction>` 查看目录文件 无输入参数则默认为当前目录  

`eariler <time>` 当前文档回溯至\<atime>前的状态 \<time> \<s> \</s>  

- 特殊快捷键
[ctrl+s] 锁定终端  
[ctrl+q] 解除终端锁定  
如果不小心按到 一般不会是vim卡死或者崩溃(笑)  

### 书签 Marks  
\<mark> 指代书签名  

`m<letter>` 记录书签 单个英文字母 小写局部书签 仅限当前文件使用 大写全局书签 其他文件可访问  
`'<mark>` 跳转到书签  
`:marks` 查看当前所有书签  
另外有数个特殊缺省标识书签(如果看到了`\` 请自行忽略 反斜杠仅用于文本转义):  
> [来源](http://shaoguangleo.github.io/2011/02/04/vim-bookmark/)  
| 特殊书签 | 目标                               |
| -------- | ---------------------------------- |
| 0        | 该文本上次退出时的位置             |
| 1-9      |                                    |
| "        | 该文本上次退出时最后编辑的位置     |
| \[       | 上一次改变或复制文本的第一个字符   |
| \]       | 上一次改变或复制文本的最后一个字符 |
| \.       | 上一次书签或直接跳转前光标的位置   |
| \<       | 上一次使用可视模式时选取的开头     |
| \>       | 上一次使用可视模式时选取的结尾     |
| ^        | 上一次结束插入模式时光标的位置     |

`delmarks <mark>` 删除书签  
`delmarks!` 删除所有书签 特殊书签除外  

### 分屏 Split
- 基础  

> 启用鼠标的情况下 可以通过点击窗口来直接切换当前聚焦  

`:split <file>` 上下分屏 默认为当前文件  
如果只是分屏当前文件 可`[ctrl+w][v]` ** 先输入^W 再输入v ** 以下不再赘述  

`:vsplit \<file>` 左右分屏 默认为当前文件  
如果只是分屏当前文件 可`[ctrl+w][s]`  

`[ctrl+w][w]` 顺时针切换聚焦窗口  
另外启用鼠标的情况下 也可用鼠标点选来切换聚焦窗口  
`[ctrl+w][hjkl]` 聚焦到当前窗口相对的左/下/上/右窗口  

`[ctrl+w][c]` 关闭窗口 也可使用:q  

- 窗口修改  

> 启用鼠标的情况下 可以使用鼠标在窗口交界处按住左键移动来调整窗口大小  

`[ctrl+w][\<>]` 或 `:vertical resize [-/+]\<n>` 使当前聚焦窗口宽度减少(\<)/扩大(>) \<n>格   
此处\<n>(数字)可选  
作为操作符 一样可以在操作符前后选择添加\<n> (`<n>[ctrl+w]<n>[<>]` \<n>插入位置二选一)    

`[ctrl+w][-+]` 或 `:resize [-/+]<n>` 使当前聚焦窗口高度减少(-)/扩大(+) \<n>格   
此处n(数字)可选   
作为操作符 一样可以在操作符前后选择添加\<n> (`<n>[ctrl+w]<n>[-+]` \<n>插入位置二选一)    

`[ctrl+w][=]` 将所有窗口的尺寸进行平分  

`[ctrl+w][r]` 当前窗口在全部分屏中顺时针移动  
`[ctrl+w][R]` 当前窗口在全部分屏中逆时针移动  
`[ctrl+w][x]` 当前窗口与上一个聚焦窗口进行位置互换(两窗口必须长宽有一边尺寸相同且相贴)  

`[ctrl+w][HJKL]` 将当前窗口向左/下/上/右贴边 以输入方向作为当前窗口的一边 并相对其他窗口进行平分 建议实际测试进行理解  

#### 终端 Terminal
- \[ctrl+z] 可将vim切换至后台 终端输入`fg` 可打开后台程序  

----------------------

- `:term` `:terminal` 打开终端窗口
> 目前vim与neovim的效果略有不同(2020/09/21 issue)
> vim为新建窗口并打开
> neovim为在聚焦窗口中打开

打开时进入普通模式 操作类似普通窗口  
进入终端输入模式的方法同插入模式 模式状态栏将显示"terminal"  
注意退出终端输入模式的操作为\<C-\><C-n>  

> 终端模式下按键映射为`tmap`/`tnoremap`  

建议映射: `tnoremap <Esc><Esc> <C-\><C-n>`  
按2下\<esc>即可退出 同时也防止了部分交互程序有\<esc>按键的使用需求  

### 标签页 Tabs
> Vim 7.0以上新功能  
> gVim下 可以通过对标签栏及其标签页框右键进行标签页更改  
> 默认限制最多同时存在10个标签页 可通过 `:set tabpagermax=<n>` 修改 长期保存请见[自定义vim配置](#自定义vim配置)  
> 参考[链接](https://zhuanlan.zhihu.com/p/25946307)  

`:tabnew <file>` `:tabedit <file>` 新建标签页 默认为空文件  
`:tabfind <string>` 新建标签页 搜索文件  
`:tabsplit` 新建标签页 文件为当前聚焦窗口  

`:tabs` 显示目前标签页列表 `>` 表示当前页面 `+` 表示含已更改但未保存文件的页面  
> `:set showtabline=[0/1/2]` 更改上方标签栏显示方式 0:不显示; 1:多于一个标签页时显示 2:任何时候都显示  

`:tabn 或 gt 或 [ctrl+PgDn]` `:tabp 或 gT 或 [ctrl+PgUp]` 跳转到下/上一个标签页  
`tabfirst 或 :tabr` 跳转到第一个标签页  
`tablast` 跳转到最后一个标签页  
`tabm <n>` 跳转到第\<n>个标签页 从0开始计数(跳转到第一个标签页是 `:tabm 0`)  

`:tabclose` 关闭当前标签页 另外当前标签页没有窗口时会自动关闭标签页  

`:tabdo <command>` 对所有标签页都进行\<command>操作  

--------------------- 

## 自定义vim配置

- vim的配置文件的书写格式为vimscript vim脚本文件 不过并不复杂
    - 基本上 command mode 的指令 都可以使用 只是省略了":" 反过来同理 相当于一个批处理帮你启动时自动输入  
    - 一般在"~/" 标准配置名为".vimrc" vim将会在启动时自动加载 没有可自行创建
    - 如果使用neovim 标准配置名为"init.vim" 那么将在"~/.local/share/nvim/"(linux下); "~/appdata/local/nvim/"(windows下)   

> 输入 `:source <file>` 可重载(临时 重启vim即失效 但配置文件即使不是要求的名字与路径也可以)  

> 部分设置需要重启vim才能失效  

`let <operation>="<key>"` 更改快捷键  
`map <key> <originKey>` 重载按键映射 组合键即不打空格 但需要"\<>"  
如 `<LEADER><CR>` 表 `"/" + "Enter"`  
`noremap <key> <originKey>` 同上 但不递归  
`syntax [on/off]` 高亮  
`set <\option>` 或 `set <option>=[enum]` 修改设置  
> 对于有数字的设置项而言 命令行模式下 `:set <option>` 不添加 `=` 将输出当前值  

`exec <command>`  启动vim时执行指令  

`if()...elseif()...else...endif` 判断 与其他编程语言大同小异 不详解  
`autocmd <action> <filetype> <command>` 当使用\<filetype>文件发生\<action>时  将自动执行\<command> 可见`:help autocmd` 查看\<action> 常用的有vimenter 将在vim加载配置完成后触发  

`func <string>(<parameter>...)...endfunc` 函数  

### 快捷键 Keymap
- 映射  

> [参考链接](http://yyq124.blogspot.com/2010/12/vim-map.html)  
> 以下用简称代表模式: `n`普通模式 `v`可视模式 `o`运算符模式(即输入操作符时的状态) `c`命令行模式 `i`插入模式 `t`终端模式(见[终端](#终端-Terminal))  

`map <key><originKey>` 重载按键映射 生效于 `nvo`  
`noremap <key><originKey>` 同上但不递归查找按键映射(无法被二次映射)  
在前加模式缩写表示仅在对应模式生效  
> 如果使用如`imap`对插入模式进行映射 注意是否会影响正常编辑文档 应尽可能避免使用单字映射  
> <key> 和 <originKey> 一样 映射目标都可为任意长度 类似密码和宏了  

例: 插入模式下一键输入for(c/c++)  
```
imap /f <CR>for (int i = 0; ;i++){}<Left><Left><CR><Right><CR><CR><Up><Tab><Up><Up><esc>0f;a<Right>
```

- \<leader>  

为避免按键冲突 添加了 `<leader>` 键 默认是 `\` 推荐改为 `<space>`  
> `let mapleader = "<aSpace>"`  
> `map <space><space> <leader><leader>` "空格键映射为\<leader>时需要双映射 否则可能出现重复输入的bug  

- 特殊键  
- [参考链接](https://blog.csdn.net/JasonDing1354/article/details/45372007)  

| vim配置中的使用    | 实际表示                    |
| ------------------ | --------------------------- |
| \<k0>-\<k9>        | 小键盘                      |
| \<S-key>           | Shift+键                    |
| \<C-key>           | Ctrl+键                     |
| \<A-Key>或\<M-key> | Alt/Meta+键                 |
| \<Esc>             | Esc                         |
| \<Space>           | 空格键                      |
| \<Tab>             | Tab                         |
| \<CR>              | Enter                       |
| \<C-\_>            | windows下为"-"; unix下为"/" |

使用 `<C-key>` 进行记录  
> `noremap <C-h> 5h` 重载[Ctrl+h]为`5h`(向上移动5行)  

- 推荐配置  

```
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
"[RC] hot reload vimrc; [RE] fast open to edit vimrc; will use different vimrc(init.vim) if neovim; need to define $MYVIMRC, $MYNEOVIMRC
"windows下并不会自动定义$MYVIMRC 而$MYNEOVIMRC完全是手动设定以方便分开更改的 因此并不能作为参考
"开启与重载vim配置文件 需要定义变量
noremap <C-h> 5h
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-l> 5l
"[ctal+hjkl] to move faster 快速方向移动
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
if(has('nvim'))
	noremap <C--> :noh<CR>
else
	noremap <C-_> :noh<CR>
endif
"[ctrl+'-'(minus)] to hidden search result highlight 关闭搜索高亮显示
noremap <F5> :call CompileRunProg()<CR>
func CompileRunRrog()
	exec "w"
	if &filetype == 'markdown'
		exec "MarkdownPreview"
	else
		exec "echo "Unknown language!""
	endif
endfunc
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
imap <C-z> <esc>ua
imap <C-u> <esc><C-r>a
imap <C-s> <esc>:w<CR>a
"some single mode notepad keymap 对常见单模式文本编辑器快捷键的补充
```

### 兼容性&修复 Fix
`set nocompatible`  
"will not compatible to vi 关闭vi兼容  
`set term=screen-256color`  
"set to 256 color mode 设置色彩模式到256色模式  

`filetype on`  
"auto scan file type 自动识别文件类型  
`filetype plugin on`  
"auto scan file type to load specific plugin 自动通过文件类型判断加载插件  
`filetype indent on`  
"auto scan file type to load different indent profile 自动通过文件类型使用不同的缩进配置  
> 以上3项可通过 `:filetype` 确认  

`let &t\_ut=''`  
"some theme may won't work well, it wll fix it 修复主题显示错误的问题  
`set backspace=indent,eol,start`  
"fix bug that \<aBR> can't works normaly in gvim  修复退格键在gvim下无法使用的问题  

### 显示 View
`syntax on`  
"color mode 显示行数  
`set number`  
"display rows 显示相对行数  
`set relativenumber`  
"display relative rows 在光标行进行下划线高亮  
`set cursorline`  
"show a line in the cursor row 在光标所在行显示一条线以作标识  
`set shiftwidth=<number>`  
"auto shift will use this length 自动换行使用长度  
`set tabstop=<number>`  
"\<tab> will show this blank length \<tab>的空白显示长度  
`set softtabstop=<number>`  
"auto change into tab&space when type \<tab>, depend on tabstop value 输入\<tab>时将插入空格和制表符 取决于tabstop值  
`set wrap`  
"auto line break 自动换行  
`set showcmd`  
"show all possible command when type `<tab>` 命令行模式下按 `<tab>`进行单词猜想  
`set wildmenu`  
"show command line completion when type `<tab>` and `<direction>` 命令行模式下按 `<tab>` 和方向键进行单词补全  
`set hlsearch`  
"highlight the searched string 搜索时高亮全部查找词  
`set incsearch`  
"highlight the cursor selecting string 高亮全屏中的光标当前单词  
`set ruler`  
"show ruler at the right-bottom, default display cursor position 在右下角显示光标坐标  
`set novisualbell`  
"bell when error occurs instead of flash screen 进行错误操作时将发出警告音 而不是闪烁屏幕  

### 编辑 Edit  
`set ignorecase`   
"searching will ignore case 搜索时忽略大小写  
`set smartcase`   
"searching will ignore case when every letter is lower case 智能大小写 只有在搜索内容都为小写时才忽略大小写  
`set clipboard+=unnamed`  
"if \"+=unnamed" vim clipboard will share with system clipboard  

### 定位 Move
`set scrolloff=<n>` 上下滚动时光标上下保留行数 建议实际调整以理解  
`set whichwrap=b,s,h,l,<,>,[,]` 移动到行首/末时将转移至别行  

| 字符 | 对应按键      |
| ---- | ------------- |
| b    | \<aBR>        |
| s    | \<aSPACE>     |
| h    | h             |
| l    | l             |
| \<   | ←             |
| >    | →             |
| ~    | ~(普通模式下) |
| [    | ←(插入模式下) |
| ]    | →(插入模式下) |

`set mouse=<enum>` 支持鼠标定位、选取 但同时也没有了shift+滚轮调整字体大小的功能  

> 作用范围:(可多选)  
> `n` 普通模式  
> `v` 可视模式  
> `i` 插入模式  
> `c` 命令行模式  
> `a` 全部模式  

### 语言 Language

- 如果是终端模式的vim 修改后仍然无法解决 可以检查终端编码方式  
- 终端模式会沿用终端自身的编码 背景 字体 如果vim主题没有生效 同样先检查终端  

解决乱码问题:  
```
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
"set termencoding=utf-8
"set fencs=utf8,gbk,gb2312,gb18030
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
```

解决中文符号以及unicode emoji显示不全的问题 可能在终端模式下有bug:  
```
set ambiwidth=double
"fix some word only graph half
```

### 函数 Function

可以通过函数名来执行一系列操作  
> 声明 `func <string>(<paramater>...)...endfunc`

#### 内置函数
`has('<string>')` 返回\<bool>  
判断是否声明常数\<string>  
常用常数:  
| name        | value        |
| ----------- | ------------ |
| gui-running | GVim运行     |
| nvim        | nvim运行     |
| python      | python2加载  |
| python3     | python3加载  |
| win32       | windows系统  |
| unix        | unix系的系统 |
| mac         | macos        |


`line('<enum>')` 返回\<number>  
根据输入返回行数 `.`当前行  

----------------------

## 插件 Plugin  

### 使用方法  
1. 手动管理  
> 1. 下载插件 放置于`<pluginInstallDirection>`的单独文件夹中  
> 2. 重启vim
2. 自动安装  
> 1. 安装Vim-plug, 方法:  
> 2. 终端输入 `$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`  
> `-fLo`参数后指定下载路径 只要将其放入vim路径即可 一般为上例路径  
> 3. 在.vimrc中添加如下:  
>
> ```
> call plug#begin(<pluginInstallDirection>)
> 
> Plug '<githubLink>'call
> 
> plug#end()
> ```
>
> <pluginInstallDirection>` 为插件安装路径 一般为"~/.vim/plugged"  
> `<githubLink>` 即插件的github网址仓库路径  
>
> 4. 重载`.vimrc`后输入`:PlugInstall`即可自动下载安装  

### Vim-Plug常用指令
`:PlugInstall` 根据`.vimrc`的plug描述进行安装  
`:PlugUpdate` 根据`.vimrc`的plug描述检测插件更新  
`:PlugDiff` 检查插件变更  
`:PlugClean` 删除插件  

### 插件推荐
[推荐链接](https://www.jiqizhixin.com/articles/2020-06-05-4)  

`.vimrc` Plugin部分参考:  
```  
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
```  

### 个性化
- 配色  

<theme>指主题名  
`:color <theme>` 更换主题   
vanilla下推荐 `desert` 和 `darkblue`  

`let g:solarized_termtrans = 1`  
使背景透明 避免与终端混色  

`let g:SnazzyTransparent = 1`  
Snazzy主题独有 透明窗口  

- 字体  

<afont>指字体名  
`set guifont=<afont>:h<n>` 前半指定字体名 然后":"分割 后半h+字号指定尺寸  
只兼容部分字体 因此找不到字体可能并不是没有成功安装字体  
例:  

```
set guifont=SimHei:h10
"22line mode 

set guifont=SimHei:h17
"1080p mode
```

### YouCompleteME

一个强大却又难以安装的代码补全+检测的插件  
c++编写 效率高 需要python环境 以及cmake编译  

#### 安装
YouCompleteME 以下简称YCM  
1. 同其他插件 clone到对应目录 或者使用插件管理进行安装  
2. 终端进入YCM目录 输入`python ./install.py` linux环境可使用`./install.sh`
3. 编译完成后 重启vim 可能启动时要求`set encoding=utf-8`  

### ale

一个强大的代码检测插件 异步 提供详细信息窗口显示  
需要检测工具 本身并不提供(但基本上进行过简单的编程环境构建的电脑肯定有一两个可用的检测工具  
安装简单 可开箱即用  

#### 配置
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

### NERDTree

一个用于文档管理的插件 支持书签  

#### 命令行添加
`:NERDTreeToggle` 开关NERDTree  
`:NERDTree <File>` 等同于cd \<File>  
`:NERDTreeFind` 与vim内置目录进行位置同步  

#### 使用

类似普通分屏 而`..`指父目录  

`?` 帮助  
主要内容见下:  
```
" NERDTree (6.9.9) quickhelp~
" ============================
" File node mappings~
" double-click,
" o: open in prev window
" go: preview
" t: open in new tab
" T: open in new tab silently
" middle-click,
" i: open split
" gi: preview split
" s: open vsplit
" gs: preview vsplit
" <CR>: custom open
"
" ----------------------------
"
```

- [参考链接](https://www.cnblogs.com/littlewrong/p/6535728.html)  

`K` `J` 到同目录的第一个/最后一个项目    
`p` `P` 光标跳转到上一级目录/当前根目录  
`r` `R` 刷新光标所在文件夹/当前根目录  
`u` `U` 设计上级目录为根目录 `U` 另并维持原有的文件夹展开状态  

`o` 或 `鼠标左键双击` 开关文件夹 或 在前一个分屏打开文件(如果只有一个分屏 那么就新建分屏)  
`x` `X` 分别收起当前打开的文件夹和所有文件夹  
`i` 上下分屏打开文件 `s` 左右屏打开新文件  
`g<openCommand>` 以上操作前加 `g` 将不会自动进行跳转  
`t` 在新页面打开文件 `T` 在新页面打开文件 但不跳转(`gt`? 虽然其实并没有指令 `gt`)  

`A` 切换全屏显示NERDTree  
`q` 关闭NERDTree  
`m` 打开文件系统管理菜单(可进行新建 移动 删除文件等操作)  
`I` 开关显示隐藏文件/文件夹(`.`开头的文件/文件夹)(临时)  

#### 配置
`let NERDTreeShowHidden=1` 显示隐藏文件  
`let NERDTreeQuitOnOpen=1` 开启文件后自动关闭NERDTree窗口  

推荐配置:  
```
"NERDTree
autocmd vimenter * NERDTree
"open NERDTree split when vim opeded
map <F9> :NERDTree
map <F10> :NERDTreeToggle<CR>
map <F11> :NERDTreeFind<CR>

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
```

### Tagbar
可查看代码块结构 支持跳转, 查找, 预览等功能  

#### 命令行添加

`:TagbarToggle` 开关Tagbar  

推荐配置:  
```
map <F8> :TagbarToggle<CR>  
```

#### 使用
`?`查看帮助  
主要内容见下:  
```
" --------- General ---------
" <CR>: Jump to tag definition
" p: As above, but stay in
"    Tagbar window
" P: Show tag in preview window
" <C-N>: Go to next top-level tag
" <C-P>: Go to previous top-level tag
" <Space>: Display tag prototype
" v: Hide non-public tags
```

`p` 开新窗口预览目标  
`<ctrl+N>` 光标跳转至下一个代码块  
`<ctrl+P>` 光标跳转至上一个代码块  
`v` 隐藏非公有类  

### Tabular
可快速对多行文本进行对齐  

以下案例指代:  
```
apple = 1
bottom = 2
cat = 3
dog=4
eitherThanOsu = 820
```

#### 使用
`:Tabularize /<char><ext>` 或 `:Tab /<char><ext>` 对齐  
`:Tab` 重复上一个 `:Tab` 命令  
如果不添加 `<ext>` 默认 `<ext>` 为 `/l0c0l0`; 具体含义见[下](#<ext>参数介绍)  
含 `/` 时须使用 `\/` 例如以 `//` 为中心时 输入 `/\/\/`  
要求光标在目标区域中的任一行 作用范围将自动选定为光标上下连续含搜索目标的行  
> 注意是 `:Tab`(大写T) 而不是 `:tab`  

案例中输入: `:Tab /=`  
```
apple         = 1
bottom        = 2
cat           = 3
dog           = 4
eitherThanOsu = 820
```

#### <ext>参数介绍
`<ext>` 可选 具体为 `/[r/c/l][number][r/c/l][number][r/c/l][number]` 分3对 分别对应中心 `<char>` 的左/自身/右 而每组 `[r/c/l]` 分别为向左/中/右对齐 [mumber]指其后添加的空格数 0即不添加  
> 因为 `char` 一般等长 所以调整 `<char>` 的对齐方向一般并无作用  
> 如以下可能产生完全一样的效果 `:Tab /#/l1l1r0` `:Tab /#/l1c1r0` `:Tab /#/l1r1r0`  

案例中输入 `:Tab /=/l5l2r0`  
```
apple             =    1
bottom            =    2
cat               =    3
dog               =    4
eitherThanOsu     =  820
```
解析: 以连续含等号的所有行作为范围 以等号作为中心 左边向左对齐 其后添加5个空格 然后等号也向左对齐 然后添加2个空格 最后等号右边的字符串向右对齐 后面不添加空格  

案例中输入: `:Tab /=/c1l1l0`  
```
    apple     = 1
    bottom    = 2
     cat      = 3
     dog      = 4
eitherThanOsu = 820
```
解析: 以连续含等号的所有行作为范围 以等号作为中心 左边置中对齐 其后添加1个空格 然后等号也向左对齐 然后添加1个空格 最后等号右边的字符串向左对齐 后面不添加空格  

### NERDCommenter
- [github仓库](https://github.com/preservim/nerdcommenter)  

虽然原版vim已经有许多方法可以快速代码块注释  
但这个插件提供了更为方便 自动识别语言 开箱即用的快速代码块注释方法  

#### 使用
类似操作符 支持前加 `[n]` 快速选定行数  
`<leader>cc` 进行行注释 默认使用行注译(如c中的`//...`)  
`<leader>cm` 同上 但只使用块注译(如c中的`/*...*/`)  
`<leader>cu` 取消注释  
`<leader>ci` 或 `<leader>c[space]` 开关注释(有注译下会拆成无注译 无注译下会添加注译) 无法对非行首起的注译进行操作  
> 取消注译和开关注译的拆解机制类似内存栈 多层注译会一层层拆开  

`<leader>c$` 从光标处注译到行尾  

`<leader>ca` 切换另一种注译符 如果当前文本语言有的话(`<leader>cm`仍然只使用块注译)  

----------------------

## 记录 Changelog
RC1.2 2020/09/23-01/26
添加了终端模式 补充了一些插件 还有些杂七杂八的

RC1.1 2020/09/12-00/15  
增加了一些细节  

RC1 2020/09/11-04/20  
针对一些格式进行了兼容 用宏对在每一行行末都添加了2个空格 github中应该换行正常了  
同时也对所有代码块外的小于号都进行了转义 不会被当作是html标签了  

添加了tabs(标签栏) marks(书签) Function(函数) 以及 Macro(宏) 的简单说明  
添加了一些插件介绍  

RC0 2020/09/09-03/01  
随着基本功能的学习完成 这本vim操作笔记也自认为完成了初版  
字数也从0开始到现在近5000了 应该有许多不严谨的地方 毕竟是边学边加的笔记  

----------------------

## 贡献者
Wufe8  

## 许可 LICENSE
保留原有贡献者 以及可用来源链接  
可随意修改  
对于因为错误而造成的资料损失 我不负任何责任  
