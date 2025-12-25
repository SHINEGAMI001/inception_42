#!/bin/sh

sleep 5


if [ ! -f /var/www/html/index.php ]; then
	wp core download --path=/var/www/html --allow-root
fi

if [ ! -f /var/www/html/wp-config.php ]; then
	wp config create \
		--path=/var/www/html --dbname="${DB_NAME}" \
		--dbuser="${DB_USER}" --dbpass="${USER_PWD}" \
		--dbhost="${HOST_NAME}" --allow-root
fi

if ! wp core is-installed --path=/var/www/html --allow-root; then
	wp core install --path=/var/www/html --url="${DOMAIN_NAME}" --title="${SITE_NAME}" \
		--admin_user="${ADMIN_USER}" --admin_password="${ADMIN_PWD}" \
		--admin_email="${ADMIN_EMAIL}" --allow-root

fi

if ! wp user list --path=/var/www/html --allow-root | grep -q "${WORDPRESS_USER}" ;then
	echo "creating normal user..."
		wp user create "${WORDPRESS_USER}" "${USER_EMAIL}" --user_pass="${WORDPRESS_PWD}" \
		--path=/var/www/html --role=subscriber --allow-root
fi

# chown -R www-data:www-data /var/www/html
# chmod -R 755 /var/www/html


if [ ! -d /run/php ]; then
	mkdir /run/php
	echo ""/run/php/" directory created"
fi


exec php-fpm7.4 -F