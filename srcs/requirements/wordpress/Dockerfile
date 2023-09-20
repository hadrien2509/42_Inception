FROM debian:bullseye

# Install packages
RUN apt-get update && apt-get -y install wget \
										php7.3 \
										php-mysql \
										php-fpm \
										mariadb-client


# Copy config files
# RUN		chown -R root:root /var/www/wordpress

# COPY	conf/wp-config.php /var/www/wordpress/wp-config.php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY conf/wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress.sh

# Expose ports
EXPOSE 9000

# Sets the entrypoint to wordpress.sh
ENTRYPOINT ["sh", "/usr/local/bin/wordpress.sh"]
