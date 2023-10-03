all: up

prepare:
	@sudo mkdir -p /home/hgeissle/data/mariadb
	@sudo mkdir -p /home/hgeissle/data/wordpress

mariadb:
	@sudo docker build -t mariadb ./srcs/requirements/mariadb/
	@sudo docker run -it mariadb

nginx:
	@sudo docker build -t nginx ./srcs/requirements/nginx/
	@sudo docker run -it nginx

wordpress:
	@sudo docker build -t wordpress ./srcs/requirements/wordpress/
	@sudo docker run -it wordpress

build:
	@sudo docker-compose -f srcs/docker-compose.yml build

up: prepare build
	@sudo docker-compose -f srcs/docker-compose.yml up -d

clean:
	@sudo sh ./srcs/destroy.sh

re:	clean all

.PHONY: all prepare mariadb nginx wordpress build up clean re