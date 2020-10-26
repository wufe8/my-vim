# wufe8/my-vim
wufe8的个人vim配置 笔记等资料

## 目录

- [说明](#说明)
- [使用](#使用)
- [文件结构](#文件结构)
- [贡献者](#贡献者)
- [许可协议 LICENSE](#许可协议-LICENSE)

## 说明

主要内容见vim.md

## 使用
0. 粗略[vim.md](vim.md) 了解vim的基础用法  
安装python(及pip) nodejs(及npm) ctags cmake git gcc g++(windows没有gcc g++ 转为安装visual studio) 并确保加入PATH环境变量  

然后有两种方法:  
- 1. 使用`install.bat`或`install.sh`在终端下执行 会提示输入的参数

- 1. 将`.vimrc` 以及`.vim/autoload/plug.vim`放入对应文件夹 一般为用户home目录 neovim位置略有不同 具体请google
  2. 启动vim/neovim 输入`:PlugInstall` 等待下载并安装 完成后输入`:qa!`退出
  3. 如果vim/neovim中字体有问题且处于gui模式(终端下的vim字体跟随终端设置) 编辑刚刚放入的`.vimrc`/`init.vim` 找到数个`set guifont` 其后面的`SimHei`为字体 `:h17`为字体大小 请自行更改
  4. [neovim限定] 终端输入`pip install pynvim`以及`npm install neovim` 安装neovim支持 然后在neovim中输入`:checkhealth` 查看安装是否成功
  5. `cd ~/.vim/plugged/YouCompleteMe` 然后`python ./install.py` 编译YCM
  6. [neovim限定] `cd ~/.vim/plugged/markdown-preview.nvim` 然后`npm install` 编译markdown-preview.nvim
  7. 打开vim/neovim查看结果

## 文件结构
```
my-vim
|   .gitignore //git忽略文件 如果有需要 建议保留
|   .vimrc //vim配置
|   cmdToShell.vim //简易bat转shell 不支持goto function for while等多种特性
|   install.bat //windows下一键配置vim&neovim 需要输入参数
|   install.sh //linux下一键配置vim&neovim 需要输入参数
|   LICENSE //许可协议
|   README.md //本文件 仓库说明文档
|   vanilla.vimrc //vim无插件配置
|   vim.md //笔记
|
+---.vim
|   |   .netrwhist
|   |
|   \---autoload
|           plug.vim //vim plug vim插件管理器
|
+---testPageUnix //仿linux的文件结构 供测试用
|   \---.config
|       \---nvim
\---testPageWin //仿windows的文件结构 供测试用
    |   .vimrc
    |   .vimrc.BACKUP
    |
    +---.vim
    |   \---autoload
    |           plug.vim
    |
    \---AppData
        \---Local
            \---nvim
                |   init.vim
                |   init.vim.BACKUP
                |
                \---autoload
                        plug.vim
```

## 贡献者
Wufe8

## 许可协议 LICENSE

MIT协议 请保留协议及署名

见[LICENSE](LICENSE)
