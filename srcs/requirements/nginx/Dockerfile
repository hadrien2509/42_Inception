FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/hgeissle.crt -keyout /etc/nginx/ssl/hgeissle.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hgeissle.42.fr/UID=hgeissle"

RUN mkdir -p /var/run/nginx

RUN rm -rf /etc/nginx/sites-enabled/default
COPY conf/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

