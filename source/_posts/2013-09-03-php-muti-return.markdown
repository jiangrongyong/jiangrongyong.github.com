---
layout: post
title: php返回多个参数
tags: php

---

    function callee() {
        return array($content = "foo", $code = 200);
    }
    
    list($content, $code) = callee();