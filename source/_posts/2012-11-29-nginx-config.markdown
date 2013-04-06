---
layout: post
title: nginx配置
tags: Nginx

---

#### 配置多子站点时，例如游戏各种子官网，可以使用通配符或正则表达式的方式配置

    server {
        listen       80;
        server_name  *.wan.xoyo.com;
        root   /Users/jiangrongyong/Program/online_code/official_website/guanwang;
        index  index.html index.htm index.php;
        location ~ \.php$ {
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }
    }
    
需要注意的是，PHP在获取`$_SERVER["SERVER_NAME"]`时，会获取到*.wan.xoyo.com，如果需要获取真实的域名，修改fastcgi_params，把SERVER_NAME的值改成host

	fastcgi_param  SERVER_NAME        $host;