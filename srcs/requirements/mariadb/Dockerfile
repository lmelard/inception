FROM		debian:buster
RUN         apt update -y
RUN         apt upgrade -y
RUN         apt-get install mariadb-server -y
RUN         apt install curl -y
RUN	    	apt install vim -y

COPY	    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		tools/mysql.sh .

RUN			chmod +x ./mysql.sh

ENTRYPOINT	["./mysql.sh"]
