FROM debian:buster

COPY ./my-nginx-config.conf /etc/nginx/sites-available/
# RUN mkdir -p /src
# COPY ./conf/index.php /src/
RUN apt-get update && apt-get install -y nginx openssl vim htop  \
    && ln -s /etc/nginx/sites-available/my-nginx-config.conf /etc/nginx/sites-enabled/
# RUN mkdir /cert && \
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /cert/my-cert.key -out /cert/my-cert.crt -subj "/CN=chsimon.com" 

CMD ["nginx", "-g", "daemon off;"]
