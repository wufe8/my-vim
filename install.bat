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

set vimrcPath=~
set neovimrcPath=~\AppData\Local\nvim

REM 变换参数 bat没有提供逻辑or以及and
set willChangeVim=n
set willChangeNeoVim=n
set vaildParamater=y
if "%1" == "all" (
	set willChangeVim=y
	set willChangeNeoVim=y
)else if "%1" == "vim" (
	set willChangeVim=y
)else if "%1" == "neovim" (
	set willChangeNeoVim=y
)else (
	set vaildParamater=n
)

if "%vaildParamater%" == "y" (
	if "%2" == "vanilla" (
		set vaildParamater=y
	) else if "%2" == "plugin" (
		set vaildParamater=y
	) else (
		set vaildParamater=n
	)
)

echo [INFO] vaildParamater %vaildParamater%

if "%vaildParamater%" == "y" (
	set needRecoverVim=y
	set needRecoverNeoVim=y

	REM 有vim配置文件时询问是否覆盖(会进行备份)
	if "%willChangeVim%" == "y" (
		if exist %vimrcPath%\.vimrc (
			set /p needRecoverVim="Vim: find'.vimrc' already exist, want to replace?(origin ,vim will be backup)(y/n)"
			REM 已经有备份 将进行警告
			if exist %vimrcPath%\.vimrc.BACKUP (
				set /p willChangeVim="find %vimrcPath%\.vimrc.BACKUP, are you sure to continue?(y/n)"
			)
		)
	)
	REM 有neovim配置文件时询问是否覆盖(会进行备份)
	if "%willChangeNeoVim%" == "y" (
		REM 如果没有nvim文件夹则创建一个
		if NOT exist %neovimrcPath%\init.vim (
			mkdir %neovimrcPath%
		)
		if exist %neovimrcPath%\init.vim (
			set /p needRecoverNeoVim="NeoVim: find'init.vim' already exist, want to replace?(origin ,vim will be backup)(y/n)"
			REM 已经有备份 将进行警告
			if exist %neovimrcPath%\init.vim.BACKUP (
				set /p willChangeNeoVim="find %neovimrcPath%\init.vim.BACKUP, are you sure to continue?(y/n)"
			)
		)
	)

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
			if NOT exist %vimrcPath%\.vim (
				mkdir %vimrcPath%\.vim
			)
			if NOT exist %vimrcPath%\.vim\autoload (
				mkdir %vimrcPath%\.vim\autoload
			)
			if NOT exist %vimrcPath%\.vim\autoload\plug.vim (
				copy .\.vim\autoload\plug.vim %vimrcPath%\.vim\autoload\plug.vim 
			) 
			REM 备份vim配置文件 
			if "%needRecoverVim%" == "y" (
				copy %vimrcPath%\.vimrc %vimrcPath%\.vimrc.BACKUP
				echo "backup at %vimrcPath%\.vimrc.BACKUP"
				del %vimrcPath%\.vimrc
				REM 复制vim配置文件
				copy .\.vimrc %vimrcPath%\.vimrc
			)else (
				echo skipped vim profile
			)
		)else (
			echo skipped vim profile
		)
		REM 判断是否需要变动neovim文件 $1应为all或neovim
		if "%willChangeNeoVim%" == "y" (
			REM NeoVim安装Plugins
			if NOT exist %neovimrcPath%\autoload (
				mkdir %neovimrcPath%\autoload
			)
			if NOT exist %neovimrcPath%\autoload\plug.vim (
				copy .\.vimrc %neovimrcPath%\autoload\plug.vim
			)
			REM 备份neovim配置文件
			if "%needRecoverNeoVim%" == "y" (
				copy %neovimrcPath%\init.vim %neovimrcPath%\init.vim.BACKUP
				echo "backup at %neovimrcPath%\init.vim.BACKUP"
				del %neovimrcPath%\init.vim
				REM 复制neovim配置文件
				copy .\.vimrc %neovimrcPath%\init.vim
			)else (
				echo skipped neovim profile
			)
		)else (
			echo skipped neovim profile
		)
	REM 无插件配置文件 
	)else if "%2" == "vanilla" (
		if "%needRecoverVim%" == "y" (
			copy .\vanilla.vimrc %vimrcPath%\.vimrc
		)
		if "%needRecoverNeoVim%" == "y" (
			copy .\vanilla.vimrc %neovimrcPath%\init.vim
		)
	)
	echo press any key to continue
	pause>nul
	cmd /k
	exit
) else (
echo -----------------------------
echo [ERROR] Missing or incorrect parameters 缺少参数或参数错误
echo 格式: install %1 %2
echo -------------------
echo %1
echo all 添加vim与neovim配置文件
echo vim 仅添加vim
echo neovim 仅添加neovim
echo -------------------
echo %2
echo plugin 插件
echo vanilla 原版无插件
echo -----------------------------
echo press any key to continue
pause>nul
cmd /k
exit
)
