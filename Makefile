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

