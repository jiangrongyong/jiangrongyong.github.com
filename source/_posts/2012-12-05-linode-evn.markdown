---
layout: post
title: linode环境搭建
tags: Linode Centos

---
### 安装gcc
	yum install gcc 

### 安装git
	yum install git
	
### 163 centos镜像
> http://mirrors.163.com/.help/centos.html

	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
	wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
	yum makecache

	
### 安装ruby
> http://zengrong.net/post/1674.htm

找不到make`yum -y install gcc automake autoconf libtool make`

	
### 安装jekyll
	gem install jekyll
	

### 安装nginx
> http://www.centos.bz/2011/07/centos-compile-nginx-from-source/

nginx.conf

	server {
        listen 80;
        server_name free-will.me,106.187.34.61;
        root        /data/app/jiangrongyong.github.com/_site;
        index       index.html index.htm;
    }

### 安装nodejs
	yum install gcc-c++ openssl-devel  #先安装nodejs编译依赖
	
	git clone git://github.com/joyent/node.git  #clone源码
	
	cd node
	
	#编译源码
	./configure
	make
	make install
	
	#新版本已自带npm
	
	