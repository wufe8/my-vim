echo off

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

set vimrcPath=%USERPROFILE%
set neovimrcPath=%USERPROFILE%\AppData\Local\nvim

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

echo [DEBUG] vaildParamater %vaildParamater%

if "%vaildParamater%" == "y" (
	set willBackupVim=n
	set willBackupNeoVim=n
	REM 有vim配置文件时询问是否覆盖(会进行备份)
	if "%willChangeVim%" == "y" (
		if exist %vimrcPath%\.vimrc (
			set /p willChangeVim="Vim: find'.vimrc' already exist, want to replace?(origin ,vim will be backup)(y/n)"
			REM 已经有备份 将进行警告
			if exist %vimrcPath%\.vimrc.BACKUP (
				echo "[WRONG] find %vimrcPath%/.vimrc.BACKUP, please move the backup to other path, or it may be replace."
                set willBackupVim=y
			)
		)
	)
	REM 有neovim配置文件时询问是否覆盖(会进行备份)
	if "%willChangeNeoVim%" == "y" (
		REM 如果没有nvim文件夹则创建一个
		if NOT exist %neovimrcPath% (
			mkdir %neovimrcPath%
		)
		if exist %neovimrcPath%\init.vim (
			set /p willChangeNeoVim="NeoVim: find'init.vim' already exist, want to replace?(origin ,vim will be backup)(y/n)"
			REM 已经有备份 将进行警告
			if exist %neovimrcPath%\init.vim.BACKUP (
				echo "[WRONG] find %neovimrcPath%/init.vim.BACKUP, please move the backup to other path, or it may be replace."
            	set willBackupNeoVim=y
			)
		)
	)
	echo=
	echo [DEBUG] willChangeVim %willChangeVim%
	echo [DEBUG] willChangeNeoVim %willChangeNeoVim%
	echo=
	echo press any key to continue
    pause>nul
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
			if "%willBackupVim%" == "y" (
				copy %vimrcPath%\.vimrc %vimrcPath%\.vimrc.BACKUP
				echo "backup at %vimrcPath%\.vimrc.BACKUP"
				del %vimrcPath%\.vimrc
				REM 复制vim配置文件
				copy .\.vimrc %vimrcPath%\.vimrc
			)else (
				copy .\.vimrc %vimrcPath%\.vimrc
			)
		set PlugInstall=y
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
				copy .\.vim\autoload\plug.vim %neovimrcPath%\autoload\plug.vim
			)
			REM 备份neovim配置文件
			if "%willBackupNeoVim%" == "y" (
				copy %neovimrcPath%\init.vim %neovimrcPath%\init.vim.BACKUP
				echo "backup at %neovimrcPath%\init.vim.BACKUP"
				del %neovimrcPath%\init.vim
				REM 复制neovim配置文件
				copy .\.vimrc %neovimrcPath%\init.vim
			)else (
				copy .\.vimrc %neovimrcPath%\init.vim
			)
			set PlugInstall=y
		)else (
			echo [INFO] skipped neovim profile
		)
		REM 安装 编译插件以及依赖整理
		if "%PlugInstall%" == "y" (
			if "%willChangeNeoVim%" == "y" (
				REM 为python以及nodejs安装neovim支持 部分插件需要
				set /p nvimSupport="would you like to install neovim support about python3 and nodejs? required python pip & nodejs npm.(y/n)"
				echo [DEBUG] nvimSupport %nvimSupport%
				if "%nvimSupport%" == "y" (
					pip install pynvim
					sudo npm install -g neovim
				) else (
					echo [INFO] some plugin will need them, make sure you will install them later if you need these plugin.
				)
			)
			REM 安装插件
			set /p openVim="would you like to clone and install plugin now?, you need to enter :qa! after install(y/n)"
			echo [DEBUG] openVim %openVim%
			if "%openVim%" == "y" (
				vim -c PlugInstall
			)else (
				echo [INFO] you can run vim and press :PlugInstall to install vim plugin later.
			)
			REM 编译需编译的插件 需要python
			set /p compilePlugin="would you like to compile YCM and markdown-preview now? It need python, nodejs, gcc(or visual studio), cmake(y/n)"
			echo [DEBUG] compilePlugin %compilePlugin%
			if "%compilePlugin%" == "y" (
				cd %vimrcPath%\.vim\plugged\YouCompleteme\
				python ./install.py --all
				echo=
				cd %vimrcPath%\.vim\plugged\markdown-preview.nvim\
				npm install
			)else (
				echo [INFO] you can compile them by yourself later
			)
			echo [INFO] besides, tagbar depend ctags, make sure you add ctags into PATH if you need tagbar plugin
		REM 无插件配置文件 
		)else if "%2" == "vanilla" (
			if "%willChangeVim%" == "y" (
				if "%willBackupVim%" == "y" (
					copy %vimrcPath%\.vimrc %vimrcPath%\.vimrc.BACKUP
					echo "backup at %vimrcPath%\.vimrc.BACKUP"
					del %vimrcPath%\.vimrc
					REM 复制vim配置文件
					copy .\vanilla.vimrc %vimrcPath%\.vimrc
				)else (
					copy .\vanilla.vimrc %vimrcPath%\.vimrc
				)
			)else (
				echo [INFO] skipped vim profile
			)
			if "%willChangeNeoVim%" == "y" (
				if "%willBackupNeoVim%" == "y" (
					copy %neovimrcPath%\init.vim %neovimrcPath%\init.vim.BACKUP
					echo "backup at %neovimrcPath%\init.vim.BACKUP"
					del %neovimrcPath%\init.vim
					REM 复制neovim配置文件
					copy .\vanilla.vimrc %neovimrcPath%\init.vim
				)else (
					copy .\vanilla.vimrc %neovimrcPath%\init.vim
				)
			)else (
				echo [INFO] skipped neovim profile
			)
		)
	)
	echo press any key to continue
	pause>nul
	cmd /k
	exit
) else (
echo -----------------------------
echo [ERROR] Missing or incorrect parameters 缺少参数或参数错误
echo 格式: install %%1 %%2
echo -------------------
echo %%1
echo all 添加vim与neovim配置文件
echo vim 仅添加vim
echo neovim 仅添加neovim
echo -------------------
echo %%2
echo plugin 插件
echo vanilla 原版无插件
echo -----------------------------
echo press any key to continue
pause>nul
cmd /k
exit
)
