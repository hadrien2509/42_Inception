FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/database.sh /database.sh

EXPOSE 3306

ENTRYPOINT ["database.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]