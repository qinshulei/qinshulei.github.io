---
layout: post
title:  "shell tips"
date:   2014-03-04 10:54:26
categories: linux shell
tages: shell
---

+ shell中可以对部分内容，改变显示。比如对一部分内容以红色标出，醒目。通过`echo -e`输出。但是有一个问题是echo不接收文件参数，可以使用`xargs`来转化，同时如果内容很长很多换行，直接将这些乱七八糟的信息传给echo也会造成意想不到的输出内容。
  一个方法是使用while一行一行的输出，如下所示，patchset.info中存放我我想输出的内容，多行。

{% highlight bash %}

sed  's#currentPatchSet#\\\\e[1;31m curerentPatchSet \\\\e[0m#'  patchset.info > patchset.tmp
while read line
do
    echo -e ${line}
done < patchset.tmp


{% endhighlight %}

    值得注意的是sed使用的是单引号。即关闭所有的变量转化等，反斜杠也是具有转义效果的，`xargs`似乎也有转移效果最终，就多了这么多反邪杠

+ shell颜色效果
{% highlight bash %}
#!/bin/bash
echo -e "\e[1;30m this is 30m text \e[0m"
echo -e "\e[1;31m this is 31m text \e[0m"
echo -e "\e[1;32m this is 32m text \e[0m"
echo -e "\e[1;33m this is 33m text \e[0m"
echo -e "\e[1;34m this is 34m text \e[0m"
echo -e "\e[1;35m this is 35m text \e[0m"
echo -e "\e[1;36m this is 36m text \e[0m"
echo -e "\e[1;37m this is 37m text \e[0m"


echo -e "\e[1;40m this is 40m text \e[0m"
echo -e "\e[1;41m this is 41m text \e[0m"
echo -e "\e[1;42m this is 42m text \e[0m"
echo -e "\e[1;43m this is 43m text \e[0m"
echo -e "\e[1;44m this is 44m text \e[0m"
echo -e "\e[1;45m this is 45m text \e[0m"
echo -e "\e[1;46m this is 46m text \e[0m"
echo -e "\e[1;47m this is 47m text \e[0m"

{% endhighlight %}
