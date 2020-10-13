echo off
cls

REM 格式: install $1 $2
REM -------------------
REM $1 形参细节
REM all 添加vim与neovim配置文件
REM vim 仅添加vim
REM neovim 仅添加neovim
REM -------------------
REM $2 形参细节
REM plugin 插件
REM vanilla 原版无插件

echo [GET] install %1 %2

REM 变换参数 bat没有提供逻辑or
set willChangeVim=n
set willChangeNeoVim=n
if "%1" == "all" (
	set willChangeVim=y
	set willChangeNeoVim=y
)else if "%1" == "vim" (
	set willChangeVim=y
)else if "%1" == "neovim" (
	set willChangeNeoVim=y
)else (
	call:PrintHelp
)

if "%2" == "vanilla" Goto VaildParaMeterTwo
if "%2" == "plugin" Goto VaildParaMeterTwo
Goto PrintHelp
:VaildParaMeterTwo


set needRecoverVim=y
set needRecoverNeoVim=y

call:Init

echo=
echo [INFO] willChangeVim %willChangeVim%
echo [INFO] willChangeNeoVim %willChangeNeoVim%
echo [INFO] needRecoverVim %needRecoverVim%
echo [INFO] needRecoverNeoVim %needRecoverNeoVim%
echo=

REM 有插件配置模式 
if "%2" == "plugin" (
	REM 判断是否需要变动vim文件 $1应为all或vim
	if "%willChangeVim%" == "y" (
		REM Vim安装Plugins
		if NOT exist %USERPROFILE%\.vim (
			mkdir %USERPROFILE%\.vim
		)
		if NOT exist %USERPROFILE%\.vim\autoload (
			mkdir %USERPROFILE%\.vim\autoload
		)
		if NOT exist %USERPROFILE%\.vim\autoload\plug.vim (
			copy .vim\autoload\plug.vim %USERPROFILE%\.vim\autoload\plug.vim 
		) 
		REM 备份vim配置文件 
		if "%needRecoverVim%" == "y" (
			copy %USERPROFILE%\.vimrc %USERPROFILE%\.vimrc.BACKUP
			echo "backup at %USERPROFILE%\.vimrc.BACKUP"
			del %USERPROFILE%\.vimrc
			REM 复制vim配置文件
			copy .\.vimrc %USERPROFILE%\.vimrc
		)else (
			echo skipped vim profile
		)
	)else (
		echo skipped vim profile
	)
	REM 判断是否需要变动neovim文件 $1应为all或neovim
	if "%willChangeNeoVim%" == "y" (
		REM NeoVim安装Plugins
		if NOT exist %USERPROFILE%\AppData\Local\nvim\autoload (
			mkdir %USERPROFILE%\AppData\Local\nvim\autoload
		)
		if NOT exist %USERPROFILE%\AppData\Local\nvim\autoload\plug.vim (
			copy .config\nvim\autoload\plug.vim %USERPROFILE%\AppData\Local\nvim\autoload\plug.vim
		)
		REM 备份neovim配置文件
		if "%needRecoverNeoVim%" == "y" (
			copy %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\AppData\Local\nvim\init.vim.BACKUP
			echo "backup at %USERPROFILE%\AppData\Local\nvim\init.vim.BACKUP"
			del %USERPROFILE%\AppData\Local\nvim\init.vim
			REM 复制neovim配置文件
			copy .\.config\nvim\init.vim %USERPROFILE%\AppData\Local\nvim\init.vim
		)else (
			echo skipped neovim profile
		)
	)else (
		echo skipped neovim profile
	)
REM 无插件配置文件 
)else if "%2" == "vanilla" (
	if "%needRecoverVim%" == "y" (
		copy .\vanilla.vimrc %USERPROFILE%\.vimrc
	)
	if "%needRecoverNeoVim%" == "y" (
		copy .\vanilla.vimrc %USERPROFILE%\AppData\Local\nvim\init.vim
	)
)
echo press any key to continue
pause>nul
cmd /k
exit

:PrintHelp
echo -----------------------------
echo [ERROR] Missing or incorrect parameters 缺少参数或参数错误
echo 格式: install $1 $2
echo -------------------
echo $1
echo all 添加vim与neovim配置文件
echo vim 仅添加vim
echo neovim 仅添加neovim
echo -------------------
echo $2
echo plugin 插件
echo vanilla 原版无插件
echo -----------------------------
echo press any key to continue
pause>nul
cmd /k
exit

:Init
REM 有vim配置文件时询问是否覆盖(会进行备份)
if "%willChangeVim%" == "y" (
	if exist %USERPROFILE%\.vimrc (
		set /p needRecoverVim="Vim: find'.vimrc' already exist, want to replace?(origin ,vim will be backup)(y/n)"
		REM 已经有备份 将进行警告
		if exist %USERPROFILE%\.vimrc.BACKUP (
			set /p willChangeVim="find %USERPROFILE%\.vimrc.BACKUP, are you sure to continue?(y/n)"
		)
	)
)
REM 有neovim配置文件时询问是否覆盖(会进行备份)
if "%willChangeNeoVim%" == "y" (
	REM 如果没有nvim文件夹则创建一个
	if exist %USERPROFILE%\AppData\Local\nvim\init.vim (
		set /p needRecoverNeoVim="NeoVim: find'init.vim' already exist, want to replace?(origin ,vim will be backup)(y/n)"
		REM 已经有备份 将进行警告
		if exist %USERPROFILE%\AppData\Local\nvim\init.vim.BACKUP (
			set /p willChangeNeoVim="find %USERPROFILE%\AppData\Local\nvim\init.vim.BACKUP, are you sure to continue?(y/n)"
		)
	)
)
Goto:eof
