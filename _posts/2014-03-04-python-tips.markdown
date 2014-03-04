---
layout: post
title:  "python 学习"
date:   2014-03-04 09:56:01
categories: linux python
tages: python
---


+ 在linux中，所有的文件都可以设定为可执行`chmod a+x file` .但是默认用什么程序去执行则是系统设置问题，故一般会在文件开始去指定用什么程序执行。
  - 比如bash的程序就会在行首指定bash: `#!/bin/bash`
  - python 同样有这个问题，若不指定，系统不会因为后缀是py就知道用python。很多找不到python的错误就是这么来的。python指定执行程序:`#!/usr/bin/python`


+ 默认的情况，python文件中是不能包含中文的，编译器会报错。要支持中文须指定编码格式: `# -*- coding: utf-8 -*-`

+ python 读取文件
{% highlight python %}

data_file = open('data','r')
try:
    data = data_file.read()
except:
    print "file error"
    exit()
finally:
    data_file.close()

{% endhighlight %}


