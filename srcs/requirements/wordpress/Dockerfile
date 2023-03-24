FROM		debian:buster
RUN			apt update
RUN			apt upgrade -y
RUN			apt install wget -y
RUN			apt install php7.3 php-fpm php-mysql mariadb-client -y

RUN			wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www
RUN			cd /var/www && tar -xzf wordpress-6.1.1-fr_FR.tar.gz && rm wordpress-6.1.1-fr_FR.tar.gz
RUN			chown -R root:root /var/www/wordpress

RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

COPY		conf/wordpress_config.sh .
RUN			chmod +x ./wordpress_config.sh

ENTRYPOINT	["./wordpress_config.sh"]
