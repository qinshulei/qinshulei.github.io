---
layout: post
title:  "linux 管理命令"
date:   2014-01-18 11:15:26
description: linux 管理命令"
categories: linux
tages: linux
---

+ 磁盘管理
df : disk free
du : disk usage
{% highlight bash %}
$ df
Filesystem     1K-blocks     Used Available Use% Mounted on
/dev/sda1       47929224  6179644  39308212  14% /
udev             1957144        4   1957140   1% /dev
tmpfs             786636      856    785780   1% /run
none                5120        0      5120   0% /run/lock
none             1966584     1980   1964604   1% /run/shm
/dev/sda3      428683400 41580400 365320472  11% /home
$ du loopbackfile.img 
33184	loopbackfile.img
$ du -c Downloads/
2772	Downloads/book/done
73704	Downloads/book
628	Downloads/make-4.0/config
32	Downloads/make-4.0/tests/scripts/misc
40	Downloads/make-4.0/tests/scripts/targets
172	Downloads/make-4.0/tests/scripts/features
124	Downloads/make-4.0/tests/scripts/functions
68	Downloads/make-4.0/tests/scripts/options
88	Downloads/make-4.0/tests/scripts/variables
532	Downloads/make-4.0/tests/scripts
692	Downloads/make-4.0/tests
144	Downloads/make-4.0/glob
64	Downloads/make-4.0/w32/subproc
28	Downloads/make-4.0/w32/compat
24	Downloads/make-4.0/w32/include
164	Downloads/make-4.0/w32
2328	Downloads/make-4.0/po
1168	Downloads/make-4.0/doc
7376	Downloads/make-4.0
358060	Downloads/
358060	total
$ du -sh qsl
776M	qsl
{% endhighlight %}
统计目录磁盘占用du要加`-c`或者`-s`参数,`-h` 使用单位显示

+ 找出目录下最大的文件
{% highlight bash %}
$ find . -type f -exec du -k {} \; | sort -nrk 1 | head
{% endhighlight %}

+ 打印命令执行时间
{% highlight bash %}
$ time ls
book               jdk-6u35-linux-x64.bin  make-4.0              semc_chain.pem                             skype-bin_4.2.0.11-0ubuntu0.12.04.2_i386.deb
emacs-24.3.tar.gz  jenkins_1.546_all.deb   make-4.0.tar.gz       Semc_chain.zip
Install.zip        jenkins.war             node-v0.10.24.tar.gz  skype_4.2.0.11-0ubuntu0.12.04.2_amd64.deb

real	0m0.002s
user	0m0.000s
sys	0m0.000s
{% endhighlight %}

+ 显示系统进程
{% highlight bash %}
$ ps
  PID TTY          TIME CMD
 2933 pts/3    00:00:00 bash
 6340 pts/3    00:00:00 ps
{% endhighlight %}

+ 显示系统进程及cpu占用率
{% highlight bash %}
ps -eo comm,pcpu | head
COMMAND         %CPU
init             0.0
kthreadd         0.0
ksoftirqd/0      0.0
kworker/0:0H     0.0
kworker/u:0H     0.0
migration/0      0.0
rcu_bh           0.0
rcu_sched        0.0
watchdog/0       0.0
{% endhighlight %}


+ 查看十个占用cpu最高的进程
{% highlight bash %}
ps -eo comm,pcpu --sort -pcpu | head
COMMAND         %CPU
chrome           1.5
Xorg             0.9
compiz           0.7
emacs23          0.5
python           0.2
pulseaudio       0.2
java             0.1
chrome           0.1
chrome           0.1
{% endhighlight %}

+ 查看可发出的信号
{% highlight bash %}
$ kill -l
 1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
 6) SIGABRT	 7) SIGBUS	 8) SIGFPE	 9) SIGKILL	10) SIGUSR1
11) SIGSEGV	12) SIGUSR2	13) SIGPIPE	14) SIGALRM	15) SIGTERM
16) SIGSTKFLT	17) SIGCHLD	18) SIGCONT	19) SIGSTOP	20) SIGTSTP
21) SIGTTIN	22) SIGTTOU	23) SIGURG	24) SIGXCPU	25) SIGXFSZ
26) SIGVTALRM	27) SIGPROF	28) SIGWINCH	29) SIGIO	30) SIGPWR
31) SIGSYS	34) SIGRTMIN	35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
48) SIGRTMIN+14	49) SIGRTMIN+15	50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
63) SIGRTMAX-1	64) SIGRTMAX	
{% endhighlight %}

+ 杀死某个进程
{% highlight bash %}
$ kill -9 pid
{% endhighlight %}

+ 查看某个命令的位置
{% highlight bash %}
$ which ls
/bin/ls
{% endhighlight %}

+ 查看该命令位置及man帮助地址
{% highlight bash %}
$ whereis git
git: /usr/bin/git /usr/bin/X11/git /usr/share/man/man1/git.1.gz
{% endhighlight %}

+ 查看文件类型
{% highlight bash %}
$ file jenkins.war 
jenkins.war: Zip archive data, at least v2.0 to extract
{% endhighlight %}

+ 查看cpu信息
{% highlight bash %}
cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 58
model name	: Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz
stepping	: 9
microcode	: 0x19
cpu MHz		: 1600.000
cache size	: 6144 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms
bogomips	: 6385.28
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:
{% endhighlight %}

+ 定时关机,crontab定时执行任务
{% highlight bash %}
$ crontab <<EOF
> 00 01 * * * /sbin/shutdown -h
> EOF
{% endhighlight %}

+ 显示所有定时任务
{% highlight bash %}
$ crontab -l
00 01 * * * /sbin/shutdown -h
{% endhighlight %}

+ 用户管理,用户信息存于`／etc/passwd`中,1-500 是系统预ID。500以上是普通用户.用户组通常用来描述用户详细信息。
{% highlight bash %}
$  more /etc/passwd
root:x:0:0:root:/root:/bin/bash
qinshulei:x:1000:1000:qinshulei,,,:/home/qinshulei:/bin/bash
{% endhighlight %}

+ 用户密码存于`/etc/shadow`，快来破解我的密码。shadow采用DES加密方式，破解方式为暴力破解，可以采用字典攻击
{% highlight bash %}
sudo cat /etc/shadow
[sudo] password for qinshulei:
qinshulei:$6$xhw9lQPp$kiscnXnFi9b1Ue7HNw435J3bGGRixWUwY4c96PZyHSx2/0rFvTeMJu/Y7vtqT9LdYCNY2KM7E86ZKnX5TOeKH0:16080:0:99999:7:::
{% endhighlight %}

+ 创建组：
{% highlight bash %}
$ sudo addgroup ccache
[sudo] password for qinshulei: 
Adding group `ccache' (GID 1002) ...
Done.
{% endhighlight %}

+ 创建用户
{% highlight bash %}
$ sudo useradd ccache -g ccache -M
#创建用户，并创建对应目录
{% endhighlight %}

+ 显示用户id及信息
{% highlight bash %}
$ id
uid=1000(qinshulei) gid=1000(qinshulei) groups=1000(qinshulei),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),109(lpadmin),124(sambashare)
{% endhighlight %}

+ 显示用户组信息。信息存于`/etc/group`
{% highlight bash %}
$ more /etc/group
qinshulei:x:1000:
{% endhighlight %}

+ 修改用户信息
{% highlight bash %}
$ sudo usermod -p 123456 qinsl0106
{% endhighlight %}


+ 删除用户
{% highlight bash %}
sudo userdel -r ccache
userdel: ccache home directory (/home/ccache) not found
{% endhighlight %}

+ 查看登录用户名
{% highlight bash %}
$ whoami
qinshulei
{% endhighlight %}


+ 有两种方法通过shell提示信息。一个是`zenity`,一个是`notify-send`
{% highlight bash %}
$ zenity --notification --text "work done"
$ notify-send "complie" "done"
{% endhighlight%}
