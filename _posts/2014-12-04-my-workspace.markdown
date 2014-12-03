---
layout: post
title:  "我的的编程工具和辅助插件,linux环境"
date:   2014-12-04 01:52:50
categories: emacs linux
tages: emacs linux
---

### 命令行
shell : [zsh](http://www.zsh.org/) ,使用`zsh`替代`bash`

zsh配置 ： [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/)

zsh提供了更好的补全和高亮，有更好的交互体验，兼容bash。如下图，自动补齐以`st`打头的git命令。

![zsh][1]


### 编辑器
编辑器 : [emacs](http://gnu.april.org/software/emacs/)

基础配置 : [purcell](https://github.com/purcell/emacs.d) ,带有web相关的语言的很多配置以及很多常用插件。比如:

+ `ido` 让emacs命令自动补全
+ `ace-jump` 能够以很少的按键将光标定位到屏幕的任意字母上
+ `multiple-cursor` 多光标编辑。可以轻松实现多行编辑。

添加的插件(以下插件在emacs的包管理中都可以找到) :

+ `emmet` 上面也有人提到，编辑html的神插件
+ `yasnippt` 代码块插件，可以自定义代码块，然后在编辑中快捷插入。效果就和eclipse里面输入sysout然后补全一样
+ `neotree` 常见的文件目录树。
+ `projectile` 项目管理插件，可以实现项目内查找并打开文件，项目内搜索关键字等常用功能。
+ `gist` 在emacs内查看新建和编辑自己的github gist。
+ `ack-and-a-half` 在emacs中使用ack

当然上述功能可能很多IDE都有，但我觉得emacs的优点就是作为编辑器所有语言通吃，并且易扩展。不过不建议在windows下使用。

![emacs][2]


### 小工具
+ 终端 : [guake](https://github.com/Guake/guake/) ,这款终端用F12全局呼入和呼出，非常方便。

+ `grep`的替代品 : [ack](http://beyondgrep.com/) ,`grep`的一个替代品，内置多种代码文件类型，非常适合源码搜索.

+ 截屏软件 : [shutter](http://shutter-project.org/) ,很小巧的截屏软件，可以截一个区域，一个页面。

+ `top`的替代品 : [htop](http://hisham.hm/htop/) ,交互更好


以上就是我的工具和插件。

[1]: /images/zsh.png
[2]: /images/emacs.png

