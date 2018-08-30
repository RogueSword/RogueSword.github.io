---
title: git日常命令
copyright: true
date: 2018-08-25 17:53:50
tags:
categories:
comments:
password:
---


## Git提交代码常规
### Git add的几种区别

- git add .
提交被修改(modified)文件和新文件(new)，不包括被删除(deleted)文件

- git add -u => git add --update
提交被修改(modified)和被删除(deleted)文件，不包括新文件(new)

- git add -A => git add --all 
提交所有变化

### git使用说明
> 场景：新增功能，使用新的分支开发
```
1. 在github或码云中，新建分支，输入新分支名称,如： index-swiper
2. 打开项目，cd至项目文件根目录
    git pull：拉分支代码至本地
3. 切换新的分支
    git checkout index-swiper
4. 新的分支上开发
5. 提交代码（本地index-swiper => 远程index-swiper）
    git add -A  提交在本地暂存空间
    git commit -m '本次提交的说明'
    git push    将本地分支代码提交至远程分支
6. 切换至本地的master分支
    git checkout master
7. 将线上的index-swiper分支内容与本地的master合并
    git merge origin/index-swiper
8. 将本地master的代码提交至远程master
    git push
    
9. 删除远程分支
    git push origin :BranchName
    git push origin -D BranchName
10. 删除本地分支
    git branch -D BranchName
11. 显示git的修改日志
    git log --pretty=oneline
```

### git的几种[撤销](https://blog.csdn.net/kongbaidepao/article/details/52253774)
```
1. git add 的撤销
    git status 先看一下add 中的文件 
    git reset HEAD 如果后面什么都不跟的话 就是上一次add 里面的全部撤销了 
    git reset HEAD XXX/XXX/XXX.java 就是对某个文件进行撤销了
2. git commit 的撤销
    git log 查看节点
    git reset commit_id
3. git push的撤销
    git revert HEAD
    git revert HEAD 撤销前一次 commit 
    git revert HEAD^ 撤销前前一次 commit 
```

### git pull详细示例
- 定义： 从另一个存储库或本地分支获取并集成（整合）。取回远程某个分支的更新，再与本地的指定分支合并
- 语法：git pull [options] [<repository>[<refspec>...]]
- 白话：git pull <远程主机名> <远程分支名>:<本地分支名>

```
示例：
1. 取回远程分支next，并与本地分支master合并
    git pull origin next:master
2. 取回远程分支next，并与本地当前的分支合并
    git pull origin next
2.1 拓展实质
    上述表示取回origin/next分支，再与当前分支合并。实质上等同于先做git fetch, 再执行git merge
    git fetch origin
    git merge origin/next

3. 拓展：在git中，git会自动在本地分支和远程分支之间，建立一种追踪关系。比如，git clone的时候，所有本地的分支默认与远程主机的同名分支，建立追踪关系，即本地master分支，自动追踪远程origin/master分支
3.1 当然也可以手动建立追踪关系。指定本地master分支追踪远程origin/next分支
    git branch --set-upstream master origin/next
3.2 如果当前分支与远程分支存在追踪关系，git pull可以省略远程分支名
    git pull origin
3.3 如果当前分支只有一个追踪分支，可以省略主机名
    git pull
```

## 快速上手
### git初始化五连
```
 git init (初始化本地仓库)
 git add .  （将本地所有文件加到仓库里）
 git commit -m "message" （设置提交信息）
 git remote add origin git@github.com:sunningcarryhaha/flexSupplement.git（本地仓库链接远程仓库）
 
 git push -u origin master （push文件到仓库中）
 git push --set-upstream origin master

```

## 其他易错点
### git pull 和 git merge的区别
- git fetch 是指从远程获取最新版本到本地，不会自动合并
- 在实际使用中，git fetch更安全一些，因为在merge前，我们可以查看更新情况，然后再决定是否合并。

```
示例-写法1：
git fetch origin master             // 远程分支取回
git log -p master..origin/master    // 对比本地master与远程master区别
git merge origin/master             // 将fetch放在存储库里的内容与本地工作区合并
```
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


### 查看远程分支
```
1. git branch -r    // 查看当前远程分支
2. git branch -a    // 查看所有分支，远程及本地
```

> 参考：
1. [Git-SSH文章链接](https://blog.csdn.net/superxlcr/article/details/51354257)
2. [Git命令详解](https://www.yiibai.com/git/git_pull.html)