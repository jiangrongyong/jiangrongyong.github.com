---
layout: post
title: Octopress blog
tags: Octopress

---

> Octopress is a framework designed by Brandon Mathis for Jekyll, the blog aware static site generator powering Github Pages. To start blogging with Jekyll, you have to write your own HTML templates, CSS, Javascripts and set up your configuration. But with Octopress All of that is already taken care of. Simply clone or fork Octopress, install dependencies and the theme, and you’re set.

相关资料


* [Failed to build gem native extension when install RedCloth-4.2.9 install Linux](http://stackoverflow.com/questions/12119138/failed-to-build-gem-native-extension-when-install-redcloth-4-2-9-install-linux)

		$ sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2
		$ bundle install
		
* [Installing Ruby With RVM](http://octopress.org/docs/setup/rvm/)
* [Octopress中文问题](https://github.com/imathis/octopress/issues/232)

		修改文件/home/ben/.rvm/gems/ruby-1.9.2-p290/gems/jekyll-0.11.0/lib/jekyll/convertible.rb
		
		self.content = File.read(File.join(base, name))
		# 改成
		self.content = File.read(File.join(base, name), :encoding => "utf-8")
		
* [Octopress 乱码解决方法,以及云同步方法](http://songxiaofeng1981.github.com/blog/2012/10/16/octopress-recipe/)