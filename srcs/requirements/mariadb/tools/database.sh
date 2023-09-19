#!/bin/sh

# Creates the directory used to store socket files and gives permissions to the mysql user
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

# Initializes database and gives permissions to mysql user
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null 2>&1
	chown -R mysql:mysql /var/lib/mysql
fi

# Ensures that the server listens for network connections
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

# Creates a database with a user and changes the root password
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > db.sql
echo "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> db.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> db.sql
echo "FLUSH PRIVILEGES ;" >> db.sql

# Starts the server in daemon mode by executing the sql file
mysqld --bind-address 0.0.0.0 --user=mysql --init-file=/home/db.sql