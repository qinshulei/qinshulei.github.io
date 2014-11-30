---
layout: post
title:  "下载Alfresco的源码"
date:   2014-02-27 09:51:11
description:  "下载alfresco的源码"
categories: alfresco
---

- 最近部署alfresco，默认实现是将阅读和下载的权限放在一起。但这并不符合需求。于是便打算下载一下源码。看能不能通过小的修改实现。
[alfresco download wiki][wiki]



- 但是用svn直接下载，居然是直接报错。大概是网络不行。于是经过搜索，配置svn的http代理，以解决网络问题。步骤如下：
   + 搜索国外http代理。[一个国内的http代理列表网站][proxy]
   + 挑选其中一个作为自己的http代理
   + `sudo vi ~/.subversion/server` 修改svn的代理配置文件，在最下面的global下添加
     {% highlight bash %}
     http-proxy-host = 199.48.166.27
     http-proxy-port = 3128
     {% endhighlight %}



- 继续下载，可以下载了。但是经常断。于是使用脚本循环。只要没有成功就`svn update`
{% highlight bash %}
#!/bin/bash
cd al
svn update
while [ $? -ne 0 ] 
do
    svn update
done
{% endhighlight %}


- 下了一晚上，终于下载完成了。



[wiki]:http://wiki.alfresco.com/wiki/Alfresco_SVN_Development_Environment
[proxy]:http://www.xici.net.co/wt
