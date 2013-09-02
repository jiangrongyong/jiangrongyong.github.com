---
layout: post
title: OSX 文件系统大小写不敏感
tags: osx

---

HFS+(Mac文件系统)一般配置是大小写不敏感但大小写保留，意思是文件系统会认为`foo`和`FoO`是同一个文件，但当创建该文件时系统就记住哪个字母大写哪个小写

当格式化成HFS+格式时你可以指定文件系统是否大小写敏感。但如果你格式化成UFS(Unix FileSystem)的话将会永远是大小写敏感

检查你的磁盘格式是否大小写敏感

    diskutil info <device>
    
例如

    diskutil info /dev/disk0s2

`Name (User Visible):      Mac OS Extended (Journaled)`

如果是`Mac OS Extended (Case-sensitive, Journaled)`则表示大小写敏感，如果没有`Case-sensitive`字样则仅仅是大小写保留非大小写敏感。


---

http://apple.stackexchange.com/questions/22297/is-bash-in-osx-case-insensitive