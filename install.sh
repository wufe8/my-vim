#!/bin/bash

clear 

#格式: install $1 $2
#-------------------
#$1 形参细节
#all 添加vim与neovim配置文件
#vim 仅添加vim
#neovim 仅添加neovim
#-------------------
#$2 形参细节
#plugin 插件
#vanilla 原版无插件

echo [GET] install $1 $2

vimrcPath=~
neovimrcPath=~/.config/nvim

#变换参数 bat没有提供逻辑or以及and
willChangeVim=n
willChangeNeoVim=n
vaildParamater=y
if [ "$1" == "all"  ]
then
	willChangeVim=y
	willChangeNeoVim=y
elif [ "$1" == "vim"  ]
then
	willChangeVim=y
elif [ "$1" == "neovim"  ]
then
	willChangeNeoVim=y
else
	vaildParamater=n
fi

if [ "$vaildParamater" == "y"  ]
then
	if [ "$2" == "vanilla"  ]
	then
		vaildParamater=y
	elif [ "$2" == "plugin"  ]
	then
		vaildParamater=y
	else
		vaildParamater=n
	fi	
fi

echo [INFO] vaildParamater $vaildParamater

if [ "$vaildParamater" == "y"  ]
then
	needRecoverVim=y
	needRecoverNeoVim=y

	#有vim配置文件时询问是否覆盖(会进行备份)
	if [ "$willChangeVim" == "y"  ]
	then
		if [ -e  $vimrcPath/.vimrc  ]
		then
			echo "Vim: find'.vimrc' already exist, want to replace?(origin ,vim will be backup)(y/n)"
			read needRecoverVim
			#已经有备份 将进行警告
			if [ -e  $vimrcPath/.vimrc.BACKUP  ]
			then
				echo "find $vimrcPath/.vimrc.BACKUP, are you sure to continue?(y/n)"
				read willChangeVim
			fi	
		fi	
	fi	
	#有neovim配置文件时询问是否覆盖(会进行备份)
	if [ "$willChangeNeoVim" == "y"  ]
	then
		#如果没有nvim文件夹则创建一个
		if [ ! -e  $neovimrcPath  ]
		then
			mkdir $neovimrcPath
		fi
		if [ -e  $neovimrcPath/init.vim  ]
		then
			echo "NeoVim: find'init.vim' already exist, want to replace?(origin ,vim will be backup)(y/n)"
			read needRecoverNeoVim
			#已经有备份 将进行警告
			if [ -e  $neovimrcPath/init.vim.BACKUP  ]
			then
				echo "find $neovimrcPath/init.vim.BACKUP, are you sure to continue?(y/n)"
				read willChangeNeoVim
			fi	
		fi	
	fi	
	echo
	echo [INFO] willChangeVim $willChangeVim
	echo [INFO] willChangeNeoVim $willChangeNeoVim
	echo [INFO] needRecoverVim $needRecoverVim
	echo [INFO] needRecoverNeoVim $needRecoverNeoVim
	echo

	#有插件配置模式 
	if [ "$2" == "plugin"  ]
	then
		#判断是否需要变动vim文件 $1应为all或vim
		if [ "$willChangeVim" == "y"  ]
		then
			#Vim安装Plugins
			if [ ! -e  $vimrcPath/.vim  ]
			then
				mkdir $vimrcPath/.vim
			fi	
			if [ ! -e  $vimrcPath/.vim/autoload  ]
			then
				mkdir $vimrcPath/.vim/autoload
			fi	
			if [ ! -e  $vimrcPath/.vim/autoload/plug.vim  ]
			then
				cp ./.vim/autoload/plug.vim $vimrcPath/.vim/autoload/plug.vim 
			fi 
			#备份vim配置文件 
			if [ "$needRecoverVim" == "y"  ]
			then
				cp $vimrcPath/.vimrc $vimrcPath/.vimrc.BACKUP
				echo "backup at $vimrcPath/.vimrc.BACKUP"
				rm $vimrcPath/.vimrc
				#复制vim配置文件
				cp ./.vimrc $vimrcPath/.vimrc
			else
				echo [INFO] skipped vim profile
			fi	
		else
			echo [INFO] skipped vim profile
		fi	
		#判断是否需要变动neovim文件 $1应为all或neovim
		if [ "$willChangeNeoVim" == "y"  ]
		then
			#NeoVim安装Plugins
			if [ ! -e  $neovimrcPath/autoload  ]
			then
				mkdir $neovimrcPath/autoload
			fi	
			if [ ! -e  $neovimrcPath/autoload/plug.vim  ]
			then
				cp ./.vim/autoload/plug.vim $neovimrcPath/autoload/plug.vim
			fi	
			#备份neovim配置文件
			if [ "$needRecoverNeoVim" == "y"  ]
			then
				cp $neovimrcPath/init.vim $neovimrcPath/init.vim.BACKUP
				echo "backup at $neovimrcPath/init.vim.BACKUP"
				rm $neovimrcPath/init.vim
				#复制neovim配置文件
				cp ./.vimrc $neovimrcPath/init.vim
				else
				echo [INFO] skipped neovim profile
			fi	
		else
			echo [INFO] skipped neovim profile
		fi	
	#无插件配置文件 
	elif [ "$2" == "vanilla"  ]
	then
		if [ "$needRecoverVim" == "y"  ]
		then
			cp ./vanilla.vimrc $vimrcPath/.vimrc
		fi	
		if [ "$needRecoverNeoVim" == "y"  ]
		then
			cp ./vanilla.vimrc $neovimrcPath/init.vim
		fi	
	fi	
	echo "press enter to continue"
	read
	
	exit
else
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
echo "press enter to continue"
read

exit
fi
