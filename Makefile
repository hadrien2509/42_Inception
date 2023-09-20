all: up

prepare:
	@mkdir -p /Users/hgeissle/data/mariadb
	@mkdir -p /Users/hgeissle/data/wordpress

build:
	@docker-compose -f srcs/docker-compose.yml build

up: prepare build
	@docker-compose -f srcs/docker-compose.yml up -d

clean:
	@sh ./srcs/destroy.sh

.PHONY: all prepare build up clean