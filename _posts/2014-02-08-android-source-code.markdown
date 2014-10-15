---
layout: post
title:  "android 源码资源"
date:   2014-02-08 09:38:02
description:  "android 源码资源"
categories: linux
tages: linux
---



+ andorid目录如下:
{% highlight bash %}
$ ls -rlt
drwxrwxr-x   3 qinshulei qinshulei 4096  1月 20 19:16 abi
drwxrwxr-x   9 qinshulei qinshulei 4096  1月 20 19:16 bionic
drwxrwxr-x   5 qinshulei qinshulei 4096  1月 20 19:16 bootable
drwxrwxr-x   7 qinshulei qinshulei 4096  1月 20 19:16 build
-r--r--r--   1 qinshulei qinshulei   87  1月 20 19:16 Makefile
drwxrwxr-x  11 qinshulei qinshulei 4096  1月 20 19:16 cts
drwxrwxr-x  18 qinshulei qinshulei 4096  1月 20 19:16 dalvik
drwxrwxr-x  19 qinshulei qinshulei 4096  1月 20 19:17 development
drwxrwxr-x   8 qinshulei qinshulei 4096  1月 20 19:17 device
drwxrwxr-x   3 qinshulei qinshulei 4096  1月 20 19:17 docs
drwxrwxr-x 157 qinshulei qinshulei 4096  1月 20 19:18 external
drwxrwxr-x  14 qinshulei qinshulei 4096  1月 20 19:19 frameworks
drwxrwxr-x  10 qinshulei qinshulei 4096  1月 20 19:19 gdk
drwxrwxr-x   9 qinshulei qinshulei 4096  1月 20 19:19 hardware
drwxrwxr-x  24 qinshulei qinshulei 4096  1月 20 19:20 kernel
drwxrwxr-x  11 qinshulei qinshulei 4096  1月 20 19:20 libcore
drwxrwxr-x   4 qinshulei qinshulei 4096  1月 20 19:20 libnativehelper
drwxrwxr-x   8 qinshulei qinshulei 4096  1月 20 19:20 ndk
drwxrwxr-x   7 qinshulei qinshulei 4096  1月 20 19:21 packages
drwxrwxr-x   4 qinshulei qinshulei 4096  1月 20 19:21 pdk
drwxrwxr-x  12 qinshulei qinshulei 4096  1月 20 19:21 prebuilt
drwxrwxr-x   9 qinshulei qinshulei 4096  1月 20 19:22 prebuilts
drwxrwxr-x  49 qinshulei qinshulei 4096  1月 20 19:22 sdk
drwxrwxr-x  10 qinshulei qinshulei 4096  1月 20 19:22 system
drwxrwxr-x  12 qinshulei qinshulei 4096  1月 20 19:24 vendor
{% endhighlight %}

+ abi (application binary interface)(应用程序二进制接口)
  ABI涵盖了各种细节，如：
数据类型的大小、布局和对齐;
调用约定（控制着函数的参数如何传送以及如何接受返回值），例如，是所有的参数都通过栈传递，还是部分参数通过寄存器传递；哪个寄存器用于哪个函数参数；通过栈传递的第一个函数参数是最先push到栈上还是最后；
系统调用的编码和一个应用如何向操作系统进行系统调用；
以及在一个完整的操作系统ABI中，目标文件的二进制格式、程序库等等。[1]
ABI不同于API ，API定义了源代码和库之间的接口，因此同样的代码可以在支持这个API的任何系统中编译 ，然而ABI允许编译好的目标代码在使用兼容ABI的系统中无需改动就能运行。 ABI掩盖了各种细节，例如:调用约定控制着函数的参数如何传送以及如何接受返回值；系统调用的编码和一个应用如何向操作系统进行系统调用；以及在一个完整的操作系统ABI中，对象文件的二进制格式、程序库等等。一个完整的ABI，像 Intel二进制兼容标准 (iBCS) ，允许支持它的操作系统上的程序不经修改在其他支持此ABI的操作体统上运行。其他的 ABI 标准化细节包括C++ name decoration和同一个平台上的编译器之间的调用约定，但是不包括跨平台的兼容性。在Unix的操作系统中，存在很多运行在同一件平台上互相相关但是不兼容的操作系统（尤其是80386兼容系统）。有一些努力尝试标准化A I，以减少销售商将程序移植到其他系统时所需的工作。然而，直到现在还没有很成功的例子，虽然LBS正在为Linux做这方面的努力。
它描述了应用程序与OS之间的底层接口。ABI涉及了程序的各个方面，比如：目标文件格式、数据类型、数据对齐、函数调用约定以及函数如何传递参数、如何返回值、系统调用号、如何实现系统调用等。
一套完整的ABI（比如：Intel Binary Compatibility Standard (iBCS)），可以让程序在所有支持该ABI的系统上运行，而无需对程序进行修改。

+ Bionic（Android的Linux内核库）
  Android除了使用的是ARM版本的内核外和传统的x86有所不同外，重要的是Google为Linux内核增强了不少东西，自己开发了 Bionic库，同时又贡献会Linux社区了。首先GNU的内核在体积和运行效率上不适合移动设备，系统核心组件都是以动态库的形式驻留在每个进程中， 运行效率和内存占用都是十分重要的问题。Google开发了一个自定义的库名为Bionic，以BSD许可形式开源。[1]
  Bionic库仅为200KB大小是GNU版本体积的一半，这意味着更高的效率和低内存占用，同时配合经过优化的Java VM Dalvik才可以保证高的性能。Bionic不支持一些特性比如宽字节对unicode，类似c++那样的异常处理。[1]

+ bootable (启动引导相关代码)

+ build (存放系统编译规则及generic等基础开发包配置)

+ Makefile (顶层的makefile)

+ cts (Android兼容性测试套件标准)(Compatibility Test Suite)

+ dalvik （dalvik JAVA虚拟机）
  Dalvik是Google公司自己设计用于Android平台的Java虚拟机。Dalvik虚拟机是Google等厂商合作开发的Android移动设备平台的核心组成部分之一。它可以支持已转换为 .dex（即Dalvik Executable）格式的Java应用程序的运行，.dex格式是专为Dalvik设计的一种压缩格式，适合内存和处理器速度有限的系统。Dalvik 经过优化，允许在有限的内存中同时运行多个虚拟机的实例，并且每一个Dalvik 应用作为一个独立的Linux 进程执行。独立的进程可以防止在虚拟机崩溃的时候所有程序都被关闭。
  Dalvik虚拟机既不支持Java SE 也不支持Java ME类库(如：Java类,AWT和Swing都不支持)。 相反,它使用自己建立的类库（Apache Harmony Java的一个子集）。[3]

+ development （应用程序开发相关）

+ device

+ docs

+ external （android使用的一些开源的模组）

+ frameworks （核心框架——java及C++语言）

+ gdk

+ hardware （主要保护硬解适配层HAL代码）

+ kernel

+ libcore

+ libnativehelper

+ ndk

+ packages （应用程序包）

+ pdk 

+ prebuilt （x86和arm架构下预编译的一些资源）

+ prebuilts

+ sdk （sdk及模拟器）

+ system  （文件系统库、应用及组件——C语言）

+ vendor  （厂商定制代码）
