FROM debian:bullseye

RUN apt-get update && apt install -y \
	php php-mysql php-fpm wget curl sendmail

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.4/fpm/pool.d/www.conf

COPY /tools/wp_config.sh /

RUN chmod +x wp_config.sh


ENTRYPOINT ["/wp_config.sh"]