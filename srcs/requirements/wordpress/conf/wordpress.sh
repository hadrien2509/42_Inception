#!/bin/bash

if [ ! -d "/var/www/wordpress" ]; then
  mkdir -p /var/www/wordpress
fi


if [ ! -f /var/www/wordpress/wp-config.php ]; then
	cd /var/www/wordpress
	wp core download
	sleep 10
	echo "=> Creating a new configuration file..."
	wp config create \
			--allow-root \
			--dbname=$MYSQL_DATABASE \
			--dbuser=$MYSQL_USER \
			--dbpass=$MYSQL_PASSWORD \
			--dbhost=$MYSQL_HOSTNAME
	echo "=> Configuration file created!"
	wp core install \
			--allow-root \
			--url=$DOMAIN_NAME \
			--title=$WP_TITLE \
			--admin_user=$WP_ROOT_USER \
			--admin_password=$WP_ROOT_PASSWORD \
			--admin_email=$WP_ROOT_EMAIL
fi

php-fpm7.3 -F -R