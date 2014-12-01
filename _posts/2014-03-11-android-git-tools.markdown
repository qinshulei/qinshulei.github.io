---
layout: post
title:  "Android Project Git Tools"
date:   2014-03-11 15:41:54
categories: android git tools
tages: android
---

#### 今天遇到了一个需求，统计指定的committer提交的改动的文件。这是一个很常见的需求。实现也很简单，就是使用`git log`，并用committer作为筛选条件。其中使用format选项可以将不要的内容都不显示。然后使用sed命令去空格。最后在用sort去掉重复项。
{% highlight bash %}
#!/bin/bash
#: Title                  : query changes by committer
#: Date                   : 2014-03-11
#: Author                 : shulei
#: version                : 1.0
#: Description            : query changes by committer
#: Options                : None

progname=${0###/} #get the script name without its path

verbose=0
filename=
repo_dir=

optstring=f:d:v

printf "the optind : %s\n" "$OPTIND"

while  getopts $optstring opt ; do
    case $opt in
        f)
            filename=$OPTARG
            ;;
        v)
            verbose=$(( $verbose + 1 ))
            ;;
        d)
            repo_dir=$OPTARG
            ;;
        *)
            exit 1
            ;;
    esac
done

printf "the optind : %s\n" "$OPTIND"

shift "$(( $OPTIND - 1 ))"


if [ -n "$filename" ]; then
    if [ $verbose -gt 0 ]; then
        printf "filename is %s \n" "$filename"
    fi
else
    if [ $verbose -gt 0 ]; then
        printf "No filename extered\n" >&2        
    fi
    exit 1
fi

if [ -f "$filename" ]; then
    if [ $verbose -gt 0 ]; then
        printf "filename %s found\n" "$filename"
    fi
    mv $filename ${filename}$$"bak"
else
    if [ $verbose -gt 0 ]; then
        printf "file %s don't exist \n" "$filename"
    fi
fi

if [ $verbose -gt 0 ]; then
    printf "Number of arguments is %d\n" "$#"
fi



if [ -n $repo_dir ]; then
    if [ -d "$repo_dir" ]; then
        if [ $verbose -gt 0 ]; then
            printf "current repo_dir is %s\n" "${repo_dir}"
        fi
    else
        if [ $verbose -gt 0 ]; then
            printf "current repo_dir %s don't exit!!\n" "${repo_dir}" >&2
        fi
        exit 3
    fi
else
    repo_dir=$PWD
    if [ $verbose -gt 0 ]; then
        printf "set default repo_dir %s \n" "${PWD}"
    fi
fi

cd ${repo_dir}

repo forall -c  'printf "######%s\n" $REPO_PATH >> ~/query_changes_by_author_tmp.log;git log --name-status \
--committer="jiddua@xxxxx.com" \
--committer="zhenua.wang@xxxxx.com" \
--committer="li2@xxxxx.com" \
--committer="qiiang.cui@xxxxx.com" \
--committer="hameng@xxxxx.com" \
--committer="miu@xxxxx.com" \
--committer="teu@xxxxx.com" \
--committer="xiian@xxxxx.com" \
--committer="waia@xxxxx.com" \
--committer="yuang@xxxxx.com" \
--committer="miu2@xxxxx.com" \
--committer="huzhou@xxxxx.com" \
--committer="liren@xxxxx.com" \
--committer="yutang@xxxxx.com" \
--committer="miyu2@xxxxx.com" \
--committer="huzhou@xxxxx.com" \
--committer="liren@xxxxx.com" \
--committer="yuhao@xxxxx.com" \
--committer="lijiao@xxxxx.com" \
--committer="xucheng@xxxxx.com" \
--committer="xichen@xxxxx.com" \
--committer="liliu@xxxxx.com" \
--committer="yufeng@xxxxx.com" \
--committer="goang@xxxxx" \
--committer="jiai@xxxxx.com" \
--committer="haliao@xxxxx.com" \
--committer="xilian@xxxxx.com" \
--committer="qima@xxxxx.com" \
--committer="guli@xxxxx.com" \
--committer="jiiu2@xxxxx.com" \
--format=format:  | sed "/^$/d" | sort -u >> ~/query_changes_by_author_tmp.log'

mv ~/query_changes_by_author_tmp.log "${filename}"
printf "the out file is %s\n" "${filename}"
{% endhighlight %}

#### 然后生产的数据距离可读还是有距离的，这里进一步处理，我使用的是python，用shell也可以，就是用awk，不过我觉得用python和awk差别不大。相比而言用python也更舒服.
{% highlight python%}
#!/usr/bin/python
# -*- coding: utf-8 -*-

data_file = open('tmp.log','r')
try:
    data = data_file.read()
except:
    print "file error"
    exit()
finally:
    data_file.close()

datas = data.splitlines() #save all datas
dicts = {} #save result after filter

length = len(datas)

current_pro = "default" #temp save the project
for index in range(length):
    if datas[index].startswith("####"):
        if index + 1 < length and (not datas[index + 1].startswith("####")):
            current_pro=datas[index].strip("#").strip()
            dicts[current_pro]=[]
    else:
        dicts[current_pro].append(datas[index])

print("project,Add,Modify,Delete") #printf  header

for key in dicts.keys():
    key_out=key
    file_out=""
    A_out="\""
    M_out="\""
    D_out="\""
    for file in dicts[key]:
        if file.startswith("A"):
            A_out=A_out+"/"+key+file.lstrip("A").strip()+"\n"
        elif file.startswith("M"):
            M_out=M_out+"/"+key+file.lstrip("M").strip()+"\n"
        elif file.startswith("D"):
            D_out=D_out+key+"/"+file.lstrip("D").strip()+"\n"
        else:
            file=file.strip()
            file_out=file_out + " " +file
    A_out=A_out+"\""
    M_out=M_out+"\""
    D_out=D_out+"\""

    print(key+","+A_out+","+M_out+","+D_out) #print the content
{% endhighlight %}


