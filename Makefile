.PHONY: build run clean quick-run install
.DEFAULT_GOAL = install

define colorecho
	@tput setaf $2
	@echo $1
	@tput sgr0
endef

build_log: Dockerfile
	$(call colorecho,"[Build environment]",3)
	@sudo docker build -t shell_script .
	@(date +">>> %F %T" && grep -v "^$$" $<) >> $@

build: build_log

run: build source/*
	$(call colorecho,"[Start environment]",2)
	@- sudo docker run -it --rm -v $(PWD)/source:/source shell_script

clean:
	$(call colorecho,"[Clean environment]",1)
	@- sudo sh -c "docker image prune -f > /dev/null && docker rmi shell_script"
	rm -f build_log

quick-run: run clean

install: source/*
	@sudo install -o root -g root -m 755 source/* -t /usr/local/bin
	@sudo install -o root -g root -m 644 completion/_calepin -t \
		/usr/share/zsh/site-functions
