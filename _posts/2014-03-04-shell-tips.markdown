---
layout: post
title:  "Shell Tips"
date:   2014-03-04 10:54:26
categories: linux shell
tages: shell
---

#### shell中可以对部分内容，改变显示。比如对一部分内容以红色标出，醒目。通过`echo -e`输出。但是有一个问题是echo不接收文件参数，可以使用`xargs`来转化，同时如果内容很长很多换行，直接将这些乱七八糟的信息传给echo也会造成意想不到的输出内容。
  一个方法是使用while一行一行的输出，如下所示，patchset.info中存放我我想输出的内容，多行。

{% highlight bash %}

sed  's#currentPatchSet#\\\\e[1;31m curerentPatchSet \\\\e[0m#'  patchset.info > patchset.tmp
while read line
do
    echo -e ${line}
done < patchset.tmp


{% endhighlight %}

    值得注意的是sed使用的是单引号。即关闭所有的变量转化等，反斜杠也是具有转义效果的，`xargs`似乎也有转移效果最终，就多了这么多反邪杠

#### shell颜色效果
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


#### `pwd` 可以显示当前路径，`$PWD`变量同样显示当前路径
{% highlight bash %}
$ echo $PWD
/home/qinshulei/qinshulei.github.io/_posts
{% endhighlight%}


#### `type`命令可以查看命令的类型，由谁提供
{% highlight bash %}
$type -a test
test is a shell builtin
test is /usr/bin/test
test is /usr/bin/test
{% endhighlight%}

#### `mv` : move,`ls` : list, `ps` : process status, `sed` : stream editor, CR : a carriage return, LF a linefeed

#### `source` 执行shell程序，也可以用(dot)即`.`，和shell文件正常的执行的区别是，正常的执行系统会自动fork一个新的shell去执行程序文件中的shell。这样改变环境变量之类的操作就不会作用与当前的终端上。而source则用当前终端去执行等同于直接在终端敲命令，这样对环境变量的更改就会作用与当前终端。经典的例子是android，在编译之前会把build目录下的env脚本source一下，就是这个目的。

#### shell中有无数特殊变量，以下为含义
{% highlight bash %}
#!/bin/bash
#: Title                  : special parameters
#: Date                   : 2014-03-06
#: Author                 : shulei
#: version                : 1.0
#: Description            : print special parameters
#: Options                : None

printf "the * is all args: %s \n" $*
printf "the @ is all args: %s \n" $@
printf "the # is the num of args: %s \n" $#
printf "the 0 is the command: %s \n" $0
printf "the $ is the PID: %s \n" $$
printf "the ? is last command restult: %s \n" $?
printf "the _ is last args: %s \n" $_
printf "the ! is last PID: %s \n" $!
printf "the - is flage information : %s\n" $-
{% endhighlight%}

{% highlight bash %}
$ special_parameters  arg1
the * is all args: arg1 
the @ is all args: arg1 
the # is the num of args: 1 
the 0 is the command: ./special_parameters 
the $ is the PID: 14070 
the ? is last command restult: 0 
the _ is last args: 0 
the ! is last PID:  
the - is flage information : hB
{% endhighlight%}


#### 应该多用printf取代echo，echo存在一定的兼容性风险。
{% highlight bash %}
$ printf "color : #%02x%02x%02x \n" 255 255 255
color : #ffffff 
{% endhighlight%}

#### shell文件头，一些常用注释，签名
{% highlight bash %}
#!/bin/bash
#: Title                  : print formate head
#: Date                   : 2014-03-06
#: Author                 : shulei
#: Version                : 1.0
#: Description            : print formate head
#: Options                : None

divider='####################'
divider=$divider$divider$divider
header='#!/bin/bash\n'
formater="#:%-20s :%-35s#\n"
column_width=50

printf "$header"

printf "%${column_width}s\n" $divider
printf "$formater" \
    'Title' "title" \
    'Date' 'date' \
    'Author' 'author' \
    'Version' 'version' \
    'Description' 'description' \
    'Options' 'options' \

printf "%${column_width}s\n" $divider

{% endhighlight%}

{% highlight bash %}
$ print_head 
#!/bin/bash
############################################################
#:Title                :title                              #
#:Date                 :date                               #
#:Author               :author                             #
#:Version              :version                            #
#:Description          :description                        #
#:Options              :options                            #
############################################################
{% endhighlight%}


#### shell中重定向，可以使用`&> FILE`和`＆>> FILE`将标准输出和错误输出都导向到一个文件中

#### 输出随机数`${RANDOM}`
{% highlight bash %}
$ printf "%s\n" ${RANDOM}
24640
{% endhighlight%}

#### 保持子shell的输出
{% highlight bash %}
$ DATE=`date`
$ DATE=$( date )
{% endhighlight%}

#### 使用printf保存变量
{% highlight bash %}
$ printf -v DATA "%s" $( date ) 
$ echo $DATA
2014年03月06日星期四17:29:16CST
{% endhighlight%}


#### 在shell的参数中以空格换行作为分割符，单引号和双引号都可以将空格包含在一个参数内，其中双引号支持换行,单引号内不能包含单引号，单引号内都被当作直接的字符，但是`$''`则可以包含转义的单引号和字符。
{% highlight bash %}
$ echo 'abcde\'
abcde\
$ echo $'abcde\''
abcde'
$ echo $'\'line1\'\n\'line2\''
'line1'
'line2'
{% endhighlight%}

#### 花括号参数，不是标准的参数形式，但支持一些特殊的功能
{% highlight bash %}
$ sa {one,two,three}
:one:
:two:
:three:
$ sa {1..10}
:1:
:2:
:3:
:4:
:5:
:6:
:7:
:8:
:9:
:10:
$ sa line{1,2,3,4,5}
:line1:
:line2:
:line3:
:line4:
:line5:
$ sa {1,2}{a,b}
:1a:
:1b:
:2a:
:2b:
$ sa {01..20..5}
:01:
:06:
:11:
:16:
$ sa {1..20..5}
:1:
:6:
:11:
:16:
{% endhighlight%}

#### shell参数支持`~` 主要是用户目录。
{% highlight bash %}
$ sa ~
:/home/qinshulei:
$ sa ~qinshulei
:/home/qinshulei:
$ sa ~root
:/root:
{% endhighlight%}

#### shell参数支持数学计算，使用`$(( expression ))`
{% highlight bash %}
$ sa $(( 1+2 )) $((1+2)) $((10/5)) $((10%5)) "$((6-9))kkk"
:3:
:3:
:2:
:0:
:-3kkk:
{% endhighlight%}

#### 使用`$( )`实现内部执行命令
{% highlight bash %}
$ printf "abc %s adc\n" $( date +%Y-%m-%d ).log
abc 2014-03-07.log adc
{% endhighlight%}


#### 变量同样应该再两边加引号，不然有空格回车就会被分割
{% highlight bash %}
$ var="this is  a multiword value"
$ sa $var "$var"
:this:
:is:
:a:
:multiword:
:value:
:this is  a multiword value:
{% endhighlight%}

#### `IFS`:internal field separator variable.默认情况下`IFS= \t\n`.只对变量有效,其作用就是用来对变量在做参数时根据分割符自动分割。
{% highlight bash %}
$ IFS=' :'
$ sa qsdk:hi:gg:::
:qsdk:hi:gg::::
$ var="qsdk:hi:gg:::"
$ sa $var
:qsdk:
:hi:
:gg:
::
::
{% endhighlight%}


#### shell的参数若不加引号，并且使用通配符，则会自动匹配目录下的文件
{% highlight bash %}
$ sa t*
:test:
{% endhighlight%}

#### 将命令的输出作为输入`<()`
{% highlight bash %}
$  ls -l | while read tmp
> do
> printf "%s\n" "${tmp}"
> done
total 20
-rwxrwxr-x 1 qinshulei qinshulei 268  3月  6 15:08 hw
-rwxrwxr-x 1 qinshulei qinshulei 879  3月  6 18:39 print_head
-rwxrwxr-x 1 qinshulei qinshulei 285  3月  7 09:44 sa
-rwxrwxr-x 1 qinshulei qinshulei 616  3月  6 15:20 special_parameters
-rwxrwxr-x 1 qinshulei qinshulei 339  3月  6 18:52 test
{% endhighlight%}


#### 计算字符串长度
{% highlight bash %}
$ expr length "abcde"
5
{% endhighlight%}


#### shell中我们可以是使用getopt管理命令行参数，使用shift管理位置参数。参数的特殊shell变量`OPTIND` `OPTARG`


#### `|` 和`()`都会进入子shell执行，而子shell的变量是不会传给父shell的。所以这里要留心。

#### read和IFS有个特殊写法，就是直接在行首定义IFS，然后这个变量只作用与当前行.
{% highlight bash %}
printf "%s" $IFS | od -b
printf "begin\n"
while IFS=: read login a b c name e; do
#    printf "%-12s %s\n" "$login" "$name"
    printf "%s" $IFS | od -b
    printf "in\n"
done < /etc/passwd

printf "%s" $IFS | od -b
printf "end\n"

{% endhighlight%}

#### 设置变量默认值.`${var:-default}`当字符为空或未设置设置默认值。 `${var-default}`只当未设置设置默认值。 `${var:+alternate}`只当字符设置，设置为默认值 `${var+alternate}` 当字符设置或者为空，设置默认值. 
{% highlight bash %}
$ var=
$ sa "${var:-default}"
:default:
{% endhighlight%}

第一个字符为空，所以就不会加空格。
{% highlight bash %}
for n in a b c d e f;do
> var="${var:+"$var "}$n"
> done
qinshulei@qinshulei:~/bpl/bi
qinshulei@qinshulei:~/bpl/bin$ sa "${var}"
:a b c d e f:
{% endhighlight%}

#### `${var:?message}`,如果未设置值，报错。`${var:=default}`与`${var:-default}`类似。但会输出
{% highlight bash %}
${1:? an argument is required} #必须输入一个参数的判断
{% endhighlight%}

#### `${#var}`显示变量长度。
{% highlight bash %}
$ var="1234567"
$ printf "%s\n" ${#var}
7
{% endhighlight%}

#### `${var%PATTERN}` 去除结尾匹配的字符。shell真变态，搞这么多变量的语法。。。。。 `${var%%PATTERN}` 去掉结尾匹配最长的串.`${var#PATRERN}`去掉开始匹配的最短串，`${var##PATRERN}`去掉开始匹配的最长串
{% highlight bash %}
$ var="tttggg"
$ var=${var%g??}
$ printf "%s\n" $var
ttt
{% endhighlight%}
取出参数中的目录
{% highlight bash %}
case $1 in
    */*) printf "%s\n" "${1%/*}" ;;
    *) [ -e "$1" ] && printf "%s\n" "$PWD" || echo '.' ;;
esac
{% endhighlight%}


#### `${var//PATTERN/STRING}`替换所有符合规则的字串
{% highlight bash %}
$ password=abcdedf
$ printf "%s\n" "${password//?/*}"
*******
{% endhighlight%}

#### `${var:OFFSET:LENGTH}`返回指定长度的子串
{% highlight bash %}
$ password=abcdedf
$ printf "%s\n" "${password:1:2}"
bc
{% endhighlight%}

#### `${!var}` 直接返回字符内容对应的变量的内容
{% highlight bash%}
$ x=yes
$ a=x
$ printf "%s\n" "${!a}"
yes
{% endhighlight %}

#### `${var^}` `${var^^}` 返回大写内容，第一个只转化部分，第二个全部,同样可以返回小写`${var,}` `${var,,}`
{% highlight bash%}
$ var=testvalue
$ printf "%s\n" "${var^}"
Testvalue
$ printf "%s\n" "${var^[a-z]}"
Testvalue
$ printf "%s\n" "${var^^[a-z]}"
TESTVALUE
$ printf "%s\n" "${var^^}"
TESTVALUE

$ var=UPERCASE
$ printf "%s\n" "${var,}"
uPERCASE
$ printf "%s\n" "${var,,}"
upercase
{% endhighlight %}

#### 遍历所有参数，执行shell
{% highlight bash%}
for param in "$@"
do
    #do something
done

while [ $# -gt 0 ]
do
    #do somethings
    shift
done

{% endhighlight %}



#### 数组的使用 ,使用括号可以快速初始化，使用井号可以查看对于个数,使用`+=`可以合并其他数组
{% highlight bash%}
$ boys=( shulei jiajia xx )
$ printf "%s\n" "${#boys[*]}"
3
$ printf "%s\n" "${boys[0]}"
shulei
$ printf "%s\n" "${boys[1]}"
jiajia
$ printf "%s\n" "${boys[2]}"
xx
$ boys[${#boys[*]}]=dahuang
$ printf "%s\n" "${boys[3]}"
dahuang
$ printf "%s\n" "${boys[@]}"
shulei
jiajia
xx
dahuang

$ boys+=( xiegongzhi chenxunshi )
$ printf "%s\n" "${boys[@]}"
shulei
jiajia
xx
dahuang
xiegongzhi
chenxunshi
{% endhighlight %}


#### 字符数组
{% highlight bash%}
$ declare -A array
$ array[shulei]=lv1
$ array[jiajia]=lv2
$ printf "%s\n" "${array[@]}"
lv2
lv1
$ printf "%s\n" "${array[jiajia]}"
lv2
{% endhighlight %}


#### 解析ip地址
{% highlight bash%}
$ ip=192.168.1.1
$ ips=( ${ip//./ } )
$ printf "%s\n" "${ips[@]}"
192
168
1
1
{% endhighlight %}


{% highlight bash%}
isvalidip()
{
    case $1 in
        "" | *[!0-9.]* | *[!0-9])
            return 1;;
    esac


    local IFS=.
    set -- $1
    
    [ $# -eq 4 ]&&[ ${1:-666} -le 255 ]&&[ ${2:-666} -le 255 ]&&[ ${3:-666} -le 255 ]&&[ ${4:-666} -le 255 ]
}

for ip in 127.0.0.1 168.260.0.234 1.2.3.4
do
    if isvalidip "$ip"
    then
        printf "%15s: valid\n" "$ip"
    else
        printf "%15s: invalid\n" "$ip"
    fi
done

###################################################################
$ isvalidip 
      127.0.0.1: valid
  168.260.0.234: invalid
        1.2.3.4: valid
{% endhighlight %}


#### shell的函数，内容体可以是`()` `{}` `for case until while`等任意一个具有作用域的关键词，但是其效果肯定是有不同的，比如`()`必然只能作用与子进程，修改不会影响当前进程

#### `set -- `替换参数,可以配合IFS实现灵活的替换。

#### 遍历变量字符串中的字符,相当的hack啊，，真心无语
{% highlight bash%}
while [ -n "$var" ]
do
    temp=${var#?}
    char=${var%"$temp"}
    # do some thing
    var=$temp
done
{% endhighlight %}

#### shell字符串去空格trim
{% highlight bash%}
_trim()
{
    local trim_string
    _TRIM=$1
    trim_string=${_TRIM##*[!${2:- }]}
    _TRIM=${_TRIM%"$trim_string"}
    trim_string=${_TRIM%%[!${2:- }]*}
    _TRIM=${_TRIM#"$trim_string"}
}

trim()
{
    _trim "$@" && printf "%s\n" "$_TRIM"
}

{% endhighlight %}

#### shell的index 函数
{% highlight bash%}
_index()
{
    local idx
    case $1 in
        "") _INDEX=0; return 1
            ;;
        *"${2}"*) idx=${1%%"$2"*}
            _INDEX=$(( ${#idx} + 1)) 
            ;;
        *) _INDEX=0; return 1 ;;
    esac
}

index()
{
    _index "$@"
    printf "%d\n" "$_INDEX"
}

{% endhighlight %}


#### bash 读取文件
{% highlight bash%}
while read  #no name default REPLY
do
    #do something

done < ${file}

{% endhighlight %}


#### `?(pattern-list)` 0个或者1个匹配实例。`*(pattern-list)` 0个或者多个匹配。 `@(pattern-list)` 单个匹配  。`+(pattern-list)`  多个匹配。`！(pattern-list)`不匹配的。



#### 递归显示
{% highlight bash%}
$ ls **
bin:
alert  dname  isvalidip  parseopts  print_head  readuser  sa  special_parameters  string_lib  test  trim

scripts:
{% endhighlight %}

#### time 重定向问题。time不会被重定向是因为他是bash的内置命令。要想重定向需要使用括号，括起来。


 `eval`进行执行结果的结果
{% highlight bash%}
$ x=yes
$ a=x
$ eval "sa \"\$$a\""
:yes:
{% endhighlight %}

{% highlight bash%}
$ eval "$(date "+year=%Y month=%m day=%d hour=%H minute=%M second=%S")"
$ echo $year
2014
{% endhighlight %}

#### 搜索命令执行的路径
{% highlight bash%}
$which echo
/bin/echo
$ type sa
sa is hashed (./sa)
{% endhighlight %}


#### 注意，判断条件中对变量进行判断，一定要用引号引起来。否则它不会将变量当作字符串
{% highlight bash%}
#显然下面这个变量位定义，但是仍然为真，就是这个原因
$ [ -n $tsdfafas ] && printf "%s\n" "test"
test

#下面是正确的行为
$ test=test
$ [ -n "$test" ] && printf "%s\n" "test"
test

{% endhighlight %}


#### 用`bash -n COMMAND`可以先测试一下命令的语法，结构等，这样可以提前解决一些问题。 然后再shell里面重定向输出不能有空格`>&2`.使用 `set -x` 可以打开命令的回显，更方便调用.设置PS4可以调整打印命令的内容,比如显示执行命令的行数`export PS4='+ $LINENO: '`.`set -u` 将unboud value 当成是错误。这样很多问题更容易暴露


#### 目录管理，常用的目录控制命令是`cd` ，并且`cd -` 可以返回上一次的目录，更强大的目录管理是`pushd` ,`popd` 使用堆栈管理目录，保存与变量`DIRSTACK`


#### 目录管理中，使用内置命令`dirs -l -p`可以显示DIRSTACK中的目录扩展特殊字符并且按行显示。

#### `eval "${!num#*:}"` 这句确实厉害，执行一个变量内容的内容的命令


#### `ctrl + L` 清屏幕，等同与`clear`

#### `less` 增强的结果显示，可以前进后退

#### shell的配置文件最好能被直接`source`，这样设置的变量就可以直接运行到环境中来,即配置直接写成shell代码


#### shell中array可以在中途reset掉，遍历的方法是使用`${array[@]}`.使用`${!array[@]}`可以遍历index.


#### bash 读取文件`mapfile -t array < "$kjv"` 或者 `array=( < "$kjv")`

#### pro bash 最后几章讲解了shell中的图形操作，键盘交互，暂时用不到我就一略而过。但若是想要使用shell编写高交互的东西，可以去参考一下。

#### shell 可以操作命令列表 `history -c` 清空历史.`history -s` 保存命令。

#### 一些变量
{% highlight bash%}
## bash path
$ echo $BASH
/bin/bash

## bash pid
$ echo $$
5154
$ echo $BASHPID
5154

## bash version
$ echo $BASH_VERSION
4.2.25(1)-release

## parent PID
$ echo $PPID
5042

## return random number
$ echo $RANDOM
6780

$ echo $LANG
en_US.UTF-8
{% endhighlight %}

#### shell的方法返回值可以用return,if语句会直接取return值作判断。但是若是想对return值取反，可行的办法可能还是只有用test命令，只能再对`$?`进行判断，判断`[ $? != 0 ]`.另一种可行的办法就是使用`$()`，取输出的结果。当然在方法中就不使用return了，全都默认为成功。用echo输出成功失败，也就是y或者n，然后再用test去判断。
