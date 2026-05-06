#!/bin/sh

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp core download --allow-root
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root

    wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root #wardpressの初期設定
    wp user create $MYSQL_USER $MYSQL_EMAIL --role=author --user_pass=$MYSQL_PASSWORD --allow-root #userの追加設定(adomin以外)
fi
exec php-fpm83 -F