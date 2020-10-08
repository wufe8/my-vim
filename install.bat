echo off
cls

if exist C:%HOMEPATH%\.vimrc (
	Goto :hasVimRC
) else (
	Goto :checkNeoVimRC
)

:hasVimRC
set /p needRecover=Vim: find'.vimrc' want to replace?(origin ,vim will be backup)(y/n)
if "%needRecover%"=="n" (
	echo "exiting"
	pause>nul
	exit
)
copy C:%HOMEPATH%\.vimrc C:%HOMEPATH%\.vimrc.BACKUP
echo "backup at C:%HOMEPATH%\.vimrc.BACKUP"
del C:%HOMEPATH%\.vimrc
Goto :checkNeoVimRC

:checkNeoVimRC
if exist C:%HOMEPATH%\AppData\Local\nvim\init.vim (
	Goto :hasNeoVimRC
) else (
	Goto :start
)

:hasNeoVimRC
set /p needRecover=NeoVim: find'init.vim' want to replace?(origin ,vim will be backup)(y/n)
if "%needRecover%"=="n" (
	echo "exiting"
	pause>nul
	exit
)
copy C:%HOMEPATH%\AppData\Local\nvim\init.vim C:%HOMEPATH%\AppData\Local\nvim\init.vim.BACKUP
echo "backup at C:%HOMEPATH%\AppData\Local\nvim\init.vim.BACKUP"
del C:%HOMEPATH%\AppData\Local\nvim\init.vim
Goto :start

:start
set /p installPlugin=will install plugin?(y/n)
if "%installPlugin%" == "y" (
	mkdir C:%HOMEPATH%\.vim 
	mkdir C:%HOMEPATH%\.vim\autoload
	copy .vim\autoload\plug.vim C:%HOMEPATH%\.vim\autoload\plug.vim 
	mkdir C:%HOMEPATH%\AppData\Local\nvim
	mkdir C:%HOMEPATH%\AppData\Local\nvim\autoload
	copy .config\nvim\autoload\plug.vim C:%HOMEPATH%\AppData\Local\nvim\autoload\plug.vim
	copy .\.vimrc C:%HOMEPATH%\.vimrc
	copy .\.config\nvim\init.vim C:%HOMEPATH%\AppData\Local\nvim\init.vim
) else (
	copy .\vanilla.vimrc C:%HOMEPATH%\.vimrc
	copy .\vanilla.vimrc C:%HOMEPATH%\AppData\Local\nvim\init.vim
)
echo press any key to close
pause>nul
exit
