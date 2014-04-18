---
layout: post
title:  "learn perl"
date:   2014-04-11 14:51:42
categories: perl
tages: perl
---

+ perl 的hello world
{% highlight perl %}
#!/usr/bin/perl
use warnings;

print "hello, world\n";
{% endhighlight %}

+ perl 的标准输入 ,貌似perl的函数处理是指针方式的，不是全拷贝，意味着，要注意值的保存
{% highlight perl %}
#!/usr/bin/perl

$line = <STDIN> ;
chomp($line); #not copy ref;address ref
print "${line} \n" ;

{% endhighlight %}

+ perl 没有布尔值，只有`undef`和`0`，表示false。
{% highlight perl %}
#!/usr/bin/perl

$test = <STDIN> ;
if ( defined($test) ){
    print "input is ${test}\n";
    
    $test = undef ;
}else{
    print "no input \n"
}

{% endhighlight %}

+ 感觉perl的数组操作和shell的很接近，都是用`()`声明，当然perl提供了更好的构造方式`qw{}`，支持任意的界定符号。另外就是很有特色的`shift`和`unshift`操作,和`pop` ，`push`相互呼应.非常的pratical
{% highlight perl %}
#!/usr/bin/perl

$arrays[0] = 0;

print $#arrays . "\n";
print $arrays[ -1 ] . "\n";

# qw = ''
@dicts = qw{
/user/dict/words
/home/rootbeel/test
};

#pop push 
$temp = pop(@dicts);
print "$temp \n";
push(@dicts, "/home/qinshulei");
print( pop(@dicts) . "\n" );

#shift unshift
$temp = shift(@dicts);
print "$temp \n";
unshift(@dicts, "/home/qinshulei");
print( shift(@dicts) . "\n" );




$a = 1;
$b = 2;

( $a, $b ) = ( $b, $a );
print "$a  $b\n";

{% endhighlight %}


+ perl 的foreach 有点怪，列表需要括号，如果不指定控制变量会使用默认变量`$_`，这玩意貌似可以作为任意函数的缺省值
{% highlight perl %}
#!/usr/bin/perl

@arrays = qw{ one two three four five six seven };
@removed = splice( @arrays, 2 ,2 );
print "arrays: @arrays  , removed : @removed \n";

foreach $item ( qw( test1 test2 test3) ){
    print "$item\n";
}


foreach ( qw( test1 test2 test3) ){
    print "$_\n";
}
{% endhighlight %}

+ 使用`scalar`可以切换列表上下文.所谓上下文其实就是类型转换，主要分标量和数组，标量生成的是单个值，数组生成的列表，不同的函数在不同的上下文下表现很特别

+ 子程序调用 ,以`sub`声明子程序，用`＆`调用子程序，感觉就是函数啊。同样使用最后一行作为返回值，和shell的function行为一致.我去，参数居然又是用`$_`保存数组实现的。使用`my`可以支持有作用域的变量。`state`,子程序的内部全局变量



+ perl很不严谨，要严谨一些可以添加use.
{% highlight perl %}
use strict;
use warnings;
{% endhighlight %}

