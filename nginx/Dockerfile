FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

COPY ./my-nginx-config.conf /etc/nginx/conf.d/

RUN mkdir /site
COPY ./conf/index.html /site/

RUN mkdir /cert && \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /cert/my-cert.key -out /cert/my-cert.crt -subj "/CN=chsimon.com" 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
