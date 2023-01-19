FROM debian:buster

RUN apt-get update && apt-get install -y nginx

COPY ./my-nginx-config.conf /etc/nginx/conf.d/

RUN mkdir /site
COPY ./conf/index.html /site/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
