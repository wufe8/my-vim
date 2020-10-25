normal ggO#!/bin/bash
"设置bash
%s/REM /#/g
%s/:: /#/g
"注释
%s/%\([1-9][0-9]*\)/$\1/g
%s/%\([A-Za-z][A-Za-z0-9_]*\)%/$\1/g
"变量
%s/\\\([A-Za-z0-9()\{\}<>"'\*\?.]\+\)/\/\1/g
"路径
%s/\(set \/p.*=\)\(.*\)/echo \2\r\1
"读取
%s/set //g
"变量赋值
g/if.*(/norm f(%xifi
"if结束
%s/\(if.*\)(/\1\rthen/g
"if开始
%s/fielse if/elif/g
%s/fielse/else/g
g/else \?(/norm f(%xifi
%s/else \?(/else
"else if & else
%s/NOT exist\(.*\) \?$/[ ! -f \1 ]/g
%s/exist\(.*\) \?$/[ -f \1 ]/g
"是否存在文件
%s/pause.*/echo "press enter to continue"\rread
"更改pause
%s/echo=/echo/g
"更改空行
%s/copy /cp 
%s/^cls$/clear 
%s/del /rm 
%s/cmd \/k/
%s/echo off/
"常见指令
