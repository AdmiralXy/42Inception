#!/bin/sh

if [ ! -d "/var/www/wordpress/wp-config.php" ]; then
    echo "-- [42Inception] Wordpress not found, installing... --"
    mkdir -p /var/www/wordpress/
    cd /var/www/wordpress/
    wp core download --allow-root
    wp core config --dbhost=mariadb --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --allow-root
    wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WORDPRESS_ADMIN_USERNAME} --admin_email=${WORDPRESS_ADMIN_EMAIL} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --allow-root
    wp user create ${WORDPRESS_USERNAME} ${WORDPRESS_USER_EMAIL} --allow-root --role=subscriber --user_pass=${WORDPRESS_PASSWORD}
fi

/usr/sbin/php-fpm7.3 --nodaemonize