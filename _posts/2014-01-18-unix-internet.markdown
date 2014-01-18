---
layout: post
title:  "linux 网络命令"
date:   2014-01-18 09:33:20
categories: linux
tages: linux
---

+ 查询网络设置:
{% highlight bash %}
$ ifconfig
eth0      Link encap:Ethernet  HWaddr f8:b1:56:b5:17:08  
          inet addr:192.168.65.49  Bcast:192.168.65.255  Mask:255.255.255.0
          inet6 addr: fe80::fab1:56ff:feb5:1708/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:19136 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6343 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:8532074 (8.5 MB)  TX bytes:2266160 (2.2 MB)
          Interrupt:20 Memory:f7c00000-f7c20000
lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:308 errors:0 dropped:0 overruns:0 frame:0
          TX packets:308 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:51347 (51.3 KB)  TX bytes:51347 (51.3 KB)
{% endhighlight %}


+ 打印网络接口列表
``` bash
$ ifconfig | cut -c-10 | tr -d ' ' | tr -s '\n'
eth0
lo
```

+ 打印ip地址
``` bash
$ ifconfig eth0 | egrep -o "inet addr:[^ ]*" | egrep -o "[0-9.]*"
192.168.65.49
```

+ 设置ip地址和子网掩码
``` bash
$ ifconfig eth0 192.168.1.2 netmask 255.255.252.0
```
+ 查询DNS
{% highlight bash %}
$ nslookup baidu.com
Server:		127.0.0.1
Address:	127.0.0.1#53
Non-authoritative answer:
Name:	baidu.com
Address: 220.181.111.86
Name:	baidu.com
Address: 220.181.111.85
Name:	baidu.com
Address: 123.125.114.144
$ host baidu.com
baidu.com has address 220.181.111.86
baidu.com has address 220.181.111.85
baidu.com has address 123.125.114.144
baidu.com mail is handled by 20 mx1.baidu.com.
baidu.com mail is handled by 20 jpmx.baidu.com.
baidu.com mail is handled by 20 mx50.baidu.com.
baidu.com mail is handled by 10 mx.mailcdn.baidu.com.
{% endhighlight %}


+ 检查主机是否可到达
{% highlight bash %}
$ ping baidu.com
PING baidu.com (123.125.114.144) 56(84) bytes of data.
64 bytes from 123.125.114.144: icmp_req=1 ttl=50 time=32.3 ms
  C-c C-c64 bytes from 123.125.114.144: icmp_req=2 ttl=50 time=33.3 ms
{% endhighlight %}

+ 检查一个范围内有多少可抵达地址
{% highlight bash %}
#!/bin/bash
for ip in 192.168.65.{1..255} ;
do
（
	ping $ip -c 2 &> /dev/null ;

	if [ $? -eq 0 ];
	then
		echo $ip is alive
	fi
）＆
done

wait
{% endhighlight %}

使用`（）＆` 后台运行，并使用wait等待所有子shell结束。实现并行。

+ 远程复制
{% highlight bash %}
$ scp user@remotehost:/home/path/filename filename
{% endhighlight %}

+ 监听端口
{% highlight bash %}
$ lsof -i
COMMAND    PID      USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
ubuntu-ge 2021 qinshulei   11u  IPv4   9994      0t0  TCP qinshulei.local:48351->mulberry.canonical.com:http (CLOSE_WAIT)
chrome    2571 qinshulei  111u  IPv4  15313      0t0  TCP qinshulei.local:35710->hg-in-f125.1e100.net:xmpp-client (ESTABLISHED)
jekyll    3974 qinshulei    6u  IPv4  52313      0t0  TCP *:4000 (LISTEN)

$ netstat -tnp
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        1      0 192.168.65.49:48351     91.189.94.25:80         CLOSE_WAIT  2021/ubuntu-geoip-p
tcp        0      0 192.168.65.49:35710     74.125.128.125:5222     ESTABLISHED 2571/chrome     
tcp6       0      0 192.168.65.49:34143     192.168.65.60:37288     ESTABLISHED -               
{% endhighlight %}
