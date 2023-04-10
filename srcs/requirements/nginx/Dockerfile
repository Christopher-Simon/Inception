FROM debian:buster

COPY ./conf/my-nginx-config.conf /etc/nginx/sites-available/
# RUN mkdir -p /src
# COPY ./conf/index.php /src/
RUN apt-get update && apt-get install -y nginx openssl \
    && ln -s /etc/nginx/sites-available/my-nginx-config.conf /etc/nginx/sites-enabled/
# RUN mkdir /cert && \
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /cert/my-cert.key -out /cert/my-cert.crt -subj "/CN=chsimon.com" 

RUN		openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
		-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost/UID=chsimon" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt
RUN		chmod 777 /etc/ssl/private/nginx-selfsigned.key
RUN		chmod 777 /etc/ssl/certs/nginx-selfsigned.crt

CMD ["nginx", "-g", "daemon off;"]
