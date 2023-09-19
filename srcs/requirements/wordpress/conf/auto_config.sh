#!/bin/bash

sleep 10

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	echo "=> Creating a new configuration file..."
	cd /var/www/wordpress
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path="/var/www/wordpress"
	echo "=> Configuration file created!"
	wp core install --allow-root --url="hgeissle.42.fr" --title="hgeissle.42.fr" --admin_user="hgeissle" --admin_password="hgeissle" --admin_email="" --path="/var/www/wordpress"
fi
