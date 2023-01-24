FROM debian:buster

#WP CLI https://www.hostinger.fr/tutoriels/wp-cli
RUN apt update && apt install -y curl wget  \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && apt -y install php7.3-cli php7.3-common php7.3-curl php7.3-mbstring php7.3-mysql php7.3-xml 
RUN wp core download 
# use --allow-root with wp
