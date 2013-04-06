---
layout: post
title: centos下vsftpd配置
tags: FTP Linux

---

# 背景

每次为服务器添加ftp用户总要google，老记不住，运维那边也不是每次都那么有空可以帮忙配置，这次自己配好并mark下来

## 创建ftp用户
* `/usr/sbin/adduser -d /data/app/kis_support -g ftp -s /sbin/nologin jiangrongyong`

adduser 代表添加jiangrongyong用户

并却不能登录系统(-s /sbin/nologin)

自己的所属文件夹，即ftp的根目录在(-d /data/app/kis_support)

属于组ftp(-g ftp)

* 接着给用户创建`passwd jiangrongyong`，就大功告成了
