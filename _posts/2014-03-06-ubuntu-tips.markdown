---
layout: post
title:  "ubuntu tips"
date:   2014-03-06 10:02:51
description:  "ubuntu tips"
categories: linux shell ubuntu
tages: shell
---

+ ubuntu 运行久了，性能会直线下降，需要我们杀死那些耗费比较多的进程
  - 查看内存`free -m`,m选项设置单位为MB
  - 查看cpu使用情况`top`
  - 查看进程cpu使用情况 `ps -aux`
  - 暂停某个进程`kill -stop PID`，恢复某个进程`kill -cont PID`,直接kill掉有风险，就可以先暂停
  - `kill -9 PID`似乎不清理占用的资源
