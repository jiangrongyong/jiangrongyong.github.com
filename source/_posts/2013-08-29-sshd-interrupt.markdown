---
layout: post
title: 防止ssh过一段时间后中断
tags: ssh

---

    $ sudo vim /etc/ssh/sshd_config
    
修改

    
    # 如果超过15秒后没有收到客户端的任何数据，sshd将通过安全通道向客户端发送一个"alive"消息，并等候应答，默认值0表示不发送
    ClientAliveInterval 15
    
    # sshd在未收到任何客户端回应前最多允许发送45个"alive"消息，默认值3
    ClientAliveCountMax 45
    
重启sshd

    $ sudo /etc/init.d/sshd restart