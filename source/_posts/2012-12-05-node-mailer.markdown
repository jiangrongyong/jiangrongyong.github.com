---
layout: post
title: node-mailer简单的发邮件程序
tags: Nodejs

---
 
明天公司有小米2的内部抢购，翻出n久前写的邮件程序，但愿明天能抢到。

上代码，迟点丢到github

mailer.js

    var email = require('mailer');

    email.send({
          host : "smtp.gmail.com",
          port : "25",
          domain : "smtp.gmail.com",
          to : "jiangrongyong@gmail.com",
          from : "jiangrongyong@gmail.com",
          subject : "小米手机2竞购",
          body: "小米32G*2",
          authentication : "login",
          username : "jiangrongyong",
          password : "***"
    }, function(err, result){
          if(err){ console.log(err); }
          console.log(new Date() + 'sended.');
    });

start.sh

    #!/bin/bash

    export PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$PATH

    mails[0]='mailer.js'
    repeat=3

    for((i=1;i<=$repeat;i++));do
        for item in ${mails[@]}; do
            node /data/app/node-mailer-test/$item &
        done
        sleep 1
    done