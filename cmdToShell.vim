normal ggO#!/bin/bash
"设置bash
%s/REM /#/g
%s/:: /#/g
"注释
%s/%\([1-9][0-9]*\)/$\1/g
%s/%\([A-Za-z][A-Za-z0-9_]*\)%/$\1/g
"变量
"%s/\\\([A-Za-z0-9()\{\}<>"'\*\?.]\+\)/\/\1/g
%s/\\/\//g
""路径
%s/set \/p\(.*\)=\(.*\)/echo \2\rread \1/g
"读取
%s/set //g
"变量赋值
%s/if NOT exist\(.*\) \?$/! -e \1/g
%s/if exist\(.*\) \?$/-e \1/g
"是否存在文件
g/if.*(/norm f(%xifi
"if结束
%s/if \(.*\)(/if [ \1 ]\rthen/g
"if开始
%s/fielse if/elif/g
%s/fi else if/elif/g
%s/fielse/else/g
%s/fi else/else/g
g/else \?(/norm f(%xifi
%s/else \?(/else
"else if & else
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
