---
layout: post
title:  "第一个页面!"
date:   2013-08-17 23:55:53
categories: test
tages: test
---

运行jekyll serve 的时候设置环境变量，解决编码问题:

`LANG=de_DE.UTF-8`

`LC_ALL=de_DE.UTF-8`


`test`键盘左上角的符号包围的文字就会变成小方块。

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}
用`highlight ruby`和`endhighlight`特俗标签包围的文本可以显示代码块。

[Jekyll docs][jekyll]
`[Jekyll docs][jekyll]`
`[jekyll]: https://github.com/mojombo/jekyll` 两个搭配可以实现链接的效果
[jekyll]: https://github.com/mojombo/jekyll

`categories`这个post标签可以指定url目录