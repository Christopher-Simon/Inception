FROM debian:buster

COPY ./conf/install-wordpress.sh /
RUN chmod +x /install-wordpress.sh

RUN mkdir -p /data/www/html \
		&& mkdir -p /run/php \
		&& chown -R www-data:www-data /run/php \
    && echo "<?php phpinfo(); ?>" > /data/www/html/index.php \
    && apt-get update \
    && apt-get install \
    php7.3 php7.3-fpm\
		php7.3-mysql php7.3-gd php7.3-curl \
    php7.3-mbstring php7.3-xml php7.3-zip \
		mariadb-client \
    wget \
    vim \
    -y 

# Modify the main PHP-FPM configuration to listen on port 9000 instead of the Unix socket
RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.3/fpm/php-fpm.conf \
    && sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Download and install WP-CLI
RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# RUN /install-wordpress.sh

CMD ["sh", "/install-wordpress.sh"]
