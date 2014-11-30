---
layout: post
title:  "Pro Python 读书笔记"
date:   2014-03-18 14:06:10
categories: python
tages: python
---


#### python 设计原则
{% highlight python%}
>>> import this
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!


The Samurai Principle
The Pareto Pinciple
The Robustness Principle
Backward Compatibility

{% endhighlight %}

#### python 中的异常处理，`try: except as: else: finally:` 用try包裹需要捕获异常的地方，as可以获取异常对象，用于打印异常内容，else只在没有发生异常运行,finally无论什么情况都运行，用于资源处理.

#### `while`语句使用`while True`，并且使用`break` 等作为跳出循环的结构更好。

#### `with  as` 专用与文件的打开和资源的释放。

#### `python -c ""` 可以直接调用python处理脚本，可以嵌套在shell之中，很好用.以下是一个处理json数据的例子，直接使用shell处理json很吃力，但使用python的解析库便可以轻易解决
{% highlight bash%}
ssh -p 29418 jiajia1.tang@review.sonyericsson.net gerrit query --format=JSON --commit-message 784742  --current-patch-set | sed '2d' | python -c 'import json;import sys;print json.loads(sys.stdin.readline(),"UTF-8")["currentPatchSet"]["number"]'
{% endhighlight %}

#### python 字符串的特殊if 用法,这让人还是有点难接受的，是否非字符串也可以这么写
{% highlight python%}
#!/usr/bin/python

def test_value(value):
    return 'the value is ' + ('just right.' if value < 100 else 'too big!')

print test_value(99) + '\n'
print test_value(100) + '\n'
{% endhighlight %}
与之类似的一种使用and 和or的写法
{% highlight python%}
#!/usr/bin/python

def test_value(value):
    return 'the value is ' + (value < 100 and ['just right.']  or ['too big!'])[0]
#之所以加上放括号是为了避免字符串为空
print test_value(99) + '\n'
print test_value(100) + '\n'

{% endhighlight %}



#### pyhton if语句全套写法
{% highlight python%}
a, b, c = 1, 2, 3
#1.常规
if a>b:
    c = a
else:
    c = b
#2.表达式
c = a if a>b else b
#3.二维列表
c = [b,a][a>b]
#4.传说是源自某个黑客
c = (a>b and [a] or [b])[0]
{% endhighlight %}

#### xrange是迭代的而不一次性将list生成，在3.0以前range是不迭代的，直接返回list

#### unpack 语法,用来方便的将数组赋值给变量，
{% highlight python%}
one, two ,three = "www.baidu.com".split(".")
print one + "\n"
print two + "\n"
print three + "\n"
{% endhighlight %}

#### python非常有特色的，list comprehensions，列表推导生成，可以很方便的过滤生成新数组，基本就是filter加map的集合体
{% highlight python%}
output = [str(value) for value in range(10) if value > 5]
print str(output) + "\n"
{% endhighlight %}

#### 以上列表生成中是有内部的generate对象生成，这是一个迭代器，并且不存储所有的列表内容，不能重复迭代，故不可赋值,除非你用list存起来,一些内部方法支持迭代器，以提高性能，显然取部分比取全部list要节约内存
{% highlight python%}
#generate只能用一次，不要试图去用变量记录，只可用list保存 
print str(min(value for value in range(10) if value > 5)) +"\n"
{% endhighlight %}

#### 同理有集合推导生产set. 字典推倒产生字典
{% highlight python%}
output = set(str(value) for value in range(10) if value > 5)
print str(output) + "\n"

######################################################

dict((value, str(value)) for value in range(10) if value > 5)
{% endhighlight %}

#### 串联迭代器，迭代工具集合
{% highlight python%}
import itertools
print str(list(itertools.chain(range(3),range(5),range(10))))
{% endhighlight %}

#### zip函数和可以将两个迭代器并联起来，返回一个元组的表，这在生成字典的时候很有用，可以使用一个列表作为字典的键，一个作为值
{% highlight python%}
print str(list(zip(range(3),reversed(range(5))))) +"\n"
{% endhighlight %}

#### python中的set可以使用in判断是否存在,使用add添加无须的新值，使用update 添加多个值,删除一个值使用remove，但是当该值不存在时会报错，使用discard可以避免这个问题
{% highlight python%}
example = {1,2,3,4,5}
print str(6 in example)
{% endhighlight %}

#### `{}`不能表示空set因为无法和字典区分，故使用`set()`表示空set

#### union命令可以使用`|`替代，
{% highlight python%}
print str({1,2,3} | {4,5,6})
#set([1, 2, 3, 4, 5, 6])

{% endhighlight %}

#### intersection可以使用`&`替代
{% highlight python%}
print str({1,2,3,4} & {1,4,5,6})
#set([1, 4])
{% endhighlight %}

#### difference 使用`-`替代，symmetric_difference使用`^`替代
{% highlight bash%}
$ python -c "print str({1,2,3,4}-{2,3})"
set([1, 4])
$ python -c "print str({1,2,3,4}^{2,3,8})"
set([8, 1, 4])
{% endhighlight %}

#### issubset,issuperset用来测试两个集合，其中一个是否是另一个的子集合

#### named tuples,带名字的元组
{% highlight python%}
from collections import namedtuple
Point = namedtuple('Point','x y')
point = Point(13,15)
print str(point)
{% endhighlight %}

#### OrderedDict,排序的字典,在collections模块里面

#### 在字典中可以使用，默认值，即get函数的第二个参数,或者使用defaultdict去构造，同样来自collections 模块

#### import函数和其他语句一样是可以被try包裹起来的，然后捕获import异常，，果然凶残

#### python有个future库，包含一些未来版本的功能

#### 模块中可以定义 __all__变量，来控制其他文件对其的导入

#### 模块的导入支持相对路径
{% highlight python%}
from .. import billing
form . import gallery

form .gallery import Image
{% endhighlight %}

#### 模块导入方法,`form importlib import import_module`,这个方法是相对便捷的导入方法，相比与`__import__`

