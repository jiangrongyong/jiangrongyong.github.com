---
layout: post
title: 使用MAKEFILE自动化部署
tags: makefile

---

自动提交本地git，然后ssh到服务器更新和部署，终于优雅实现这个一直很久的需求了

vim Makefile


	 PROJECT=free-will.me
	 SERVER=hugh@106.187.34.61
	 PATH=/data/app/octopress/
	 SSH=/usr/bin/ssh
	 GIT=/usr/bin/git
	 AWK=/usr/bin/awk
	 XARGS=/usr/bin/xargs
	 LOCAL_PATH=/Users/jiangrongyong/Program/jiangrongyong.github.com

	 remote_deploy:
	        @cd $(LOCAL_PATH)
	        @$(GIT) status -s|$(AWK) '{print $$2}'|$(XARGS) $(GIT) add
    	    @$(GIT) commit -m "posts update"
        	@$(GIT) push -u origin source
	        @$(SSH) -t $(SERVER) "echo Deploy $(PROJECT) to the $(SERVER) server.; cd $(PATH); git pull; rake gen_deploy;"
	        
参考文章

* http://tchen.me/posts/2013-06-12-use-makefile-to-automate-deployment.html