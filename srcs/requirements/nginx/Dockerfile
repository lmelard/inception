FROM        debian:buster

RUN         apt update
RUN         apt upgrade -y
RUN         apt install nginx -y 
RUN         apt install curl -y
RUN         apt install vim -y

RUN         mkdir -p /etc/nginx/ssl
RUN         apt -y install openssl

RUN         openssl req -x509 -nodes \
                -out /etc/nginx/ssl/inception.crt \
                -keyout /etc/nginx/ssl/inception.key \
                -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lmelard.42.fr/UID=lmelard"

RUN         mkdir -p /var/run/nginx

COPY	    conf/nginx.conf /etc/nginx/nginx.conf

RUN         chmod 755 /var/www/html
RUN 	    chown -R www-data:www-data /var/www/html

EXPOSE      443

ENTRYPOINT	[ "nginx", "-g", "daemon off;" ]
