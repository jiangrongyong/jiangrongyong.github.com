---
layout: post
title: vim打开nginx conf时语法高亮
tags: vim

---

	mkdir -p ~/.vim/syntax/

	wget -O ~/.vim/syntax/nginx.vim http://www.vim.org/scripts/download_script.php?src_id=14376

	# /usr/local/etc/nginx/vhosts/*为nginx配置文件存放目录
	echo "au BufRead,BufNewFile /usr/local/etc/nginx/vhosts/* set ft=nginx" >> ~/.vim/filetype.vim