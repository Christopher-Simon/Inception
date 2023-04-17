#!/bin/bash

# Check if the wp-config.php file exists
echo "debut du script"
if [ ! -f /data/www/html/wp-config.php ]; then
		# Download the WordPress core files
		# sleep 20
		wp core download --path=/data/www/html --allow-root

		# Generate the wp-config.php file
		wp core config \
				--allow-root \
				--dbhost=mariadb:3306 \
				--dbname="$DB_DATABASE" \
				--dbuser="$DB_USER" \
				--dbpass="$DB_PASSWORD" \
				--path=/data/www/html \
				--skip-check

		# Wait for the database to be ready
		until wp db check --path=/data/www/html --allow-root --quiet; do
		    echo "Waiting for the database to be ready..."
		    sleep 5
		done

		# Run the WordPress installation
		wp core install --path=/data/www/html --allow-root \
				--url="$MY_URL" \
				--title="Inception" \
				--admin_user="$WP_ADMIN_USER" \
				--admin_password="$WP_ADMIN_PASSWORD" \
				--admin_email="$WP_ADMIN_USER@example.com" 

		wp user create "$WP_USER" \
			"$WP_USER@example.com" \
			--user_pass=$WP_USER_PASSWORD \
			--path=/data/www/html \
			--allow-root \
			--role=author

fi
echo "fin du script"

exec php-fpm7.3 --nodaemonize
