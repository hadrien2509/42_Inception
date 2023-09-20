FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/database.sh /usr/local/bin/database.sh

RUN chmod +x /usr/local/bin/database.sh

EXPOSE 3306

ENTRYPOINT ["sh","/usr/local/bin/database.sh"]