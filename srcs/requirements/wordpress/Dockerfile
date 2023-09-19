FROM debian:bullseye

# Install packages
RUN apt-get update && apt-get upgrade && apt-get -y install wget \
															php7.3 \
															php-mysql \
															php-fpm \
															mariadb-client

# Install wordpress
RUN wget https://fr.wordpress.org/wordpress-6.3.1-fr_FR.tar.gz -P /var/www && \
	tar -xzf /var/www/wordpress-6.3.1-fr_FR.tar.gz -C /var/www && \
	rm /var/www/wordpress-6.3.1-fr_FR.tar.gz

# Copy config files
RUN		chown -R root:root /var/www/wordpress

# COPY	conf/wp-config.php /var/www/wordpress/wp-config.php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/auto_config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/auto_config.sh

ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

# Expose ports
EXPOSE 9000

# Start services
CMD ["/usr/sbin/php-fpm7.3", "-F"]