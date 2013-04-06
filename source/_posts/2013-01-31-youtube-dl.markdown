---
layout: post
title: OS X下载youtube视频
tags: Youtube

---

首先上youtube必须先打开vpn

然后到视频页面，如`http://www.youtube.com/watch?v=kUT1Z3F2nLE`

先安装brew，`ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"`

再安装youtube-dl，`brew install youtube-dl`

然后下载视频，`youtube-dl http://www.youtube.com/watch?v=kUT1Z3F2nLE`

下载完成后，可以发现视频文件名为`kUT1Z3F2nLE.flv`


