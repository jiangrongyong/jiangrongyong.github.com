---
layout: post
title: php cookie deleted
tags: php,cookie

---

使用`setcookie('name', '')`方式删除cookie时，PHP将cookie的值设置为`deleted`，过期时间设置为一年前。如果用户本地时间为两年前，则该cookie没有被删除，而是将值设置为了deleted。

比较靠谱的删除cookie的方法为：

    setcookie('name', 'deleted', 1, $path, $domain);
    
注意：在PHP5.2版本之前(包含5.2)，cookie的值可以不是deleted，但是不能为空，否则，时间参数将不被参考。