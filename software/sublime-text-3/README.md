# 快乐的sublime编辑器
---

##lesson01 为什么选择sublime？

 1. 容易上手，不需要像vim记忆太多快捷键
 2. 多点编辑
 3. 基于package control的包管理
 4. 速度快，轻量级
 5. 深度可定制，所有配置文件可以放到一个地方并共享
 6. 快速文件切换：ctr+tab
 7. 模糊命令搜索：ctr+shift+p
 8. 自带vim模式：Preferences->setting->user将ignored_packages项[]里的内容清空
 9. sublime标准渐渐成为主流
 10. 社区活跃，有问题可以快速解决
 
##lesson02 安装与恢复配置
###安装
windows略
MacOS：下载后将图标拖入Application。
若经常要使用命令行，可以:
~cd bin
~bin ln -s /Applications/sublime\ Test.app/contents/Share Support/bin/subl subl
~bin subl .
(注：文件名中有空格，\代替)

###配置恢复
~cd Library/Application\ Support/sublime\ Text\3
~cd package(有个User文件夹)
~rm -rf User
~git clone repo-setting-backup
~mv config-file User(重命名)

##lesson03 正确的使用sublime的方式
|命令|快捷键|
|--------|-----:|
|命令面板|shift+command+p|
|side bar|Ctr+K/Ctr+b
|字体|Ctr+/Ctr-|
|keybingdings|快捷键列表|

##lesson04 快捷键
|命令|快捷键|
|--------|-----:|
|新建|ctr+n|
|切换文件|ctr+tab|
|合并两行|ctr+j|
|光标移动|ctr+[/]|
|拷贝当前行|ctr+l|
|当前行上方插入行|ctr+shift+enter|
|删除行|ctr+x|
|首尾|ctr+alt+->/<-|

###自定义：
命令面板 keybinding->User
自己的设置都在preference->User，user优先级高于default。

##lesson05 Package Control
1.到Package control网址复制地址
2.ctr+`或者view->ctrl
3.粘贴+回车

##lesson06 快速查找、打开
Goto(ctr+p): 目录/文件:行 @函数名 #字符串
ctr+减号跳回去
ctr+f 查找F4

##lesson07 emmet-Web开发者必备插件

##lesson08 snippets自定义片段
tools->new snippets，粘贴重复部分
${1:xx}
用不到的snippets可以在ignored_packages内删除

##lesson09 批处理任务build
*.sublime-build
tools->build system ->*
涉及脚本编程，不细说
具体：linux guide for developer
