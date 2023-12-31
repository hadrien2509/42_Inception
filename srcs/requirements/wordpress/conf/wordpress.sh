#!/bin/bash

cd /var/www/wordpress

if [ -f ./wp-config.php ]
then
	echo "Wordpress already installed!"

else
	sleep 5
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

	wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
		--user_pass="${WP_USER_PASSWORD}" \
		--role=author \
		--allow-root

	echo "=> Wordpress installed!"
fi

exec /usr/sbin/php-fpm7.4 -F