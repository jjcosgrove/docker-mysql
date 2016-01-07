FROM debian:latest
MAINTAINER Jonathan James Cosgrove

ENV TERM=xterm
ENV DEBIAN_FRONTEND noninteractive

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN bash -c "debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysql'"
RUN bash -c "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysql'"

RUN apt-get update && apt-get install -y \
    mysql-server \
    php5-mysql

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD mysqlsetup.sh /usr/local/bin/mysqlsetup
RUN chmod +x /usr/local/bin/mysqlsetup
RUN /usr/local/bin/mysqlsetup

VOLUME /var/lib/mysql

CMD /usr/bin/mysqld_safe
