FROM debian:bullseye

RUN apt update && apt install -y mariadb-server mariadb-client

COPY tools/conf-script.sh /

RUN chmod +x /conf-script.sh

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld


CMD ["/conf-script.sh"]
