---
layout: post
title: Install dnsmasq on Centos
tags: 

---

## 1. 安装
yum install dnsmasq

## 2. 配置

vim /etc/dnsmasq.conf

    conf-dir=/etc/dnsmasq.d
    
vim /etc/dnsmasq.d/mobile-game.conf

    address=/www.baidu.com/127.0.0.1
    server=8.8.8.8

## 3. 配置生效

/etc/init.d/dnsmasq restart