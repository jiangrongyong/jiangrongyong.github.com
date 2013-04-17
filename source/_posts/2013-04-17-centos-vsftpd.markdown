---
layout: post
title: Centos下搭建ftp
tags: ftp

---

vsftpd作为FTP服务器，在Linux系统中是非常常用的。下面我们介绍如何在centos系统上安装vsftp。


### 什么是vsftpd

vsftpd是一款在Linux发行版中最受推崇的FTP服务器程序。特点是小巧轻快，安全易用。

vsftpd 的名字代表”very secure FTP daemon”, 安全是它的开发者 Chris Evans 考虑的首要问题之一。在这个 FTP 服务器设计开发的最开始的时候，高安全性就是一个目标。

### 安装vsftpd

1. 以管理员（root）身份执行以下命令

		yum install vsftpd

2. 设置开机启动vsftpd ftp服务

		chkconfig vsftpd on
		
3. 启动vsftpd服务

		service vsftpd start

### 管理vsftpd相关命令

1. 停止vsftpd

		service vsftpd stop

2. 重启vsftpd

		service vsftpd restart

3. 配置防火墙

	打开/etc/sysconfig/iptables文件

		vi /etc/sysconfig/iptables
		
	在REJECT行之前添加如下代码

		-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT

	保存和关闭文件，重启防火墙

		service iptables start

	配置vsftpd服务器

	默认的配置文件是/etc/vsftpd/vsftpd.conf，你可以用文本编辑器打开。

		vi /etc/vsftpd/vsftpd.conf

### 添加ftp用户

下面是添加ftpuser用户，设置根目录为/home/wwwroot/ftpuser,禁止此用户登录SSH的权限，并限制其访问其它目录。

1. 修改/etc/vsftpd/vsftpd.conf

	将底下三行

		#chroot_list_enable=YES
		# (default follows)
		#chroot_list_file=/etc/vsftpd.chroot_list
		
	改为

		chroot_list_enable=YES
		# (default follows)
		chroot_list_file=/etc/vsftpd/chroot_list
	
2. 增加用户ftpuser，指向目录/home/wwwroot/ftpuser,禁止登录SSH权限。

		useradd -d /home/wwwroot/ftpuser -g ftp -s /sbin/nologin ftpuser
	
3. 设置用户口令

		passwd ftpuser
	
4. 编辑文件chroot_list:

		vi /etc/vsftpd/chroot_list
	
	内容为ftp用户名,每个用户占一行,如：

		peter
		john

5. 重新启动vsftpd

		service vsftpd restart
	
	
[转载自](http://www.centos.bz/2011/03/centos-install-vsftpd-ftp-server/)