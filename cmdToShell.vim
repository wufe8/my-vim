%s/REM /#/g
"注释
%s/%/$/g
"变量
s/\(set \/p.*=\)\(.*\)/echo \2\r\t\1
"读取
%s/set //g
"变量赋值
g/if.*(/norm f(%xifi
"if结束
%s/\(if.*\)(/\1then/g
"if开始
%s/fielse if/elif/g
%s/fielse/else/g
g/else.*(/norm f(%xifi
"else if
%s/else then/else/g

