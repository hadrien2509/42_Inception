FROM debian:bullseye

# Install packages
RUN apt-get update && apt-get -y install wget \
										php7.4 \
										php-mysql \
										php7.4-fpm \
										mariadb-client


RUN mkdir -p /var/www/wordpress

# Download wordpress
RUN wget https://wordpress.org/wordpress-6.3.1.tar.gz && \
	tar -xvzf wordpress-6.3.1.tar.gz && \
	rm -rf wordpress-6.3.1.tar.gz && \
	mv wordpress/* /var/www/wordpress

RUN mkdir -p /run/php

# Download wp-cli to manage wordpress installation
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/wordpress.sh /

# Expose ports
EXPOSE 9000

# Sets the entrypoint to wordpress.sh
ENTRYPOINT ["bash", "wordpress.sh"]
