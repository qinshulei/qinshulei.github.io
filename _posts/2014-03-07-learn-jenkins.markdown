---
layout: post
title:  "jenkins tips"
date:   2014-03-07 16:15:37
categories: jenkins
tages: jenkins
---

+ jenkins 支持rest api，有多种方式。最便利的一种是xml的方式。比如要查询最后某个job一次build的号。可以向下面这样写
{% highlight bash %}
curl -s "http://android-ci-platform.cnbj.sonyericsson.net/job/cm_auto_rebase_superlabel_kk-lagan-docomo/api/xml?xpath=/*/lastBuild/number" > buildnum.tmp
len=$( cat buildnum.tmp | xargs expr length )
index=$(( ${len} - 9 ))
cut -c 9-${index}  buildnum.tmp
{% endhighlight%}
jenkins 会返回该job的所有相关信息，我们想要获取指定的信息，再用xpath去过滤。最简单的过滤方法就是跟着节点往下写。首先匹配最外层节点，然后匹配lastBuild节点，最后匹配number节点。不过似乎不支持`text()`的写法。所以只好自己cut出来。也许用正则去匹配是最好的解决方案。



  
