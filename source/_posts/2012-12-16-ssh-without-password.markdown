---
layout: page
title: ssh 不用输入密码
tags: SSH

---

* Step 1.生成ssh公钥和密钥
		
		ssh-keygen -t rsa
		
* Step 2.上传公钥文件到远程服务器,生成authorized_keys文件

		scp ~/.ssh/id_rsa.pub root@10.20.229.145/root/.ssh/authorized_keys
		
