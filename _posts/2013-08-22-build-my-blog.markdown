---
layout: post
title:  "记录一下博客的搭建"
date: 2013-08-22 23:57:23
categories: blog
---

## 记录此次建github pages博客历程 ##

### 安装ruby ###
[ruby][ruby-download] ruby官网下载，github的博客系统是ruby的
[ruby-download]: http://www.ruby-lang.org/en/downloads/ "ruby"

不过官网国内不稳定可使用[淘宝ruby镜像站点][taobao-ruby]
后面rails的安装该站上也都有
[taobao-ruby]: http://ruby.taobao.org/ "taobaoruby"

### 安装rails ###
[rails][rails-link] rails官网安装说明，ruby上的web框架
[rails-link]: http://rubyonrails.org/download "rails"
ruby的库都是可以通过gem命令安装的，很方便。

### 安装jekyll ###
[jekyll][jekyll-link] 首页就有安装说明，也是ruby包，也是生成静态博客的主要程序
[jekyll-link]: http://jekyllrb.com/ "jekyll"

### 安装git ###
[git][git-help] 这是github的帮助页，跟着帮助文档安装git
[git-help]: https://help.github.com/articles/set-up-git "git"

### 注册github ###
[github][github-link] github首页，提供免费的静态博客服务。
[github-link]: www.github.com "github"

### 在github上创建pages项目 ###
[github pages][github-pages] github 静态页面的服务，这是官方帮助文档，很详细
[github-pages]: https://help.github.com/articles/what-are-github-pages "github pages"


### 使用jekyll生成基础页面 ###
[jekyll document][jekyll-document] jekyll 的官方帮助文档，看完你就会怎么生成基础页面了。
[jekyll-document]: http://jekyllrb.com/docs/home/ "document"


### 使用用bootstrap美化页面 ###
[bootstrap][bootstrap-link] bootstrap 前端框架，有了它，你就不用自己再慢慢扣像素写页面了，，怎么用？自然是看文档
[bootstrap-link]: http://getbootstrap.com/2.3.2/ "bootstrap"


### 提交代码到github等待预览 ###
[commit to github][commit-github] 提交代码到github，官方帮助文档
[commit-github]: https://help.github.com/articles/create-a-repo "commit"

### 购买域名 ###
这次直接买了cn的姓名域名，10块一年，，买了10年，才100。不过cn姓名域名只能本人买，中间还要提交身份证之类的。不过也就一两天就通过验证了。
通过验证要关联到github还得提交个申请。据说国内空间要备案，看起来好麻烦。关联到github，提交申请后，也一两天就通过了。
### 添加CNAME到项目 ###
在根目录添加CNAME，然后把自己域名放进去就行了。比如我就是 www.qinshulei.cn。是的，就一行。
### 注册多说插件，加入社会化评论 ###
社会化评论插件挺多的，国内有多说，国外的有disqus；具体把它们生成的代码到模板就好了。
[disqus][disqus-link]  国外的社会化评论
[disqus-link]: http://disqus.com/ "disqus"

[多说][duoshuo] 国内的社会化评论
[duoshuo]: http://duoshuo.com/ "duoshuo"


