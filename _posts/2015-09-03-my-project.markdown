---
layout: post
title:  "我的个人配置项目"
date:   2015-09-03 20:55:00
categories: project
tages: project github
---

ubuntu 下如何备份自己的配置似乎还没有太好的办法。各种rc文件和配置目录，有的系统级别的还在etc下面。


我的做法基本还是只备份几个配置比较重的。比如emacs，以及额外安装的command line tools.下面是我目前个人配置的几个项目：

+ [emacs.d](https://github.com/qinshulei/emacs.d), 这是一个purcell的fork.然后我的主要改动都在 `lisp/local.el` 里面。
由于我的emacs基本是daemon的方式运行，因此emacs的启动速度我不是太关心，我基本是只要感兴趣的插件都会安装。

+ [ubuntu-install](https://github.com/qinshulei/ubuntu-install) ,这个基本只是记录了自己所有安装过的软件或者命令行工具。
当然写成了简单的脚本，方便自己检索，以及在其他机器上安装。现在已经积累了挺多工具，打算后面写一些个人推荐。
另外对这些安装的程序，给出一个个人的好用程度评级，rank1 - rank5

+ [ubuntu-cheat](https://github.com/qinshulei/ubuntu-cheat) , 这个基本可以认为是我的一个命令行的单独的个人笔记。
记录自己遇到过的一些命令的用法，并通过cheat 可以快速的检索。
顺便推荐一个社区版本 [tldr](https://github.com/tldr-pages/tldr),感觉很不错。:smile:

盗用一张tldr的介绍图片，cheat基本也是这样的东西，只不过一个是网络版本，一个是个人本地版本.
![tldr](https://camo.githubusercontent.com/ad716b6c684092d697f23c4d3073e02ec0a42f3d/687474703a2f2f7261772e6769746875622e636f6d2f7270726965746f2f746c64722f6d61737465722f73637265656e73686f742e706e67)






