FROM bosh/main-mysql-5.7

ENV MYSQL_USER root
ENV MYSQL_PASSWORD ''
ENV MYSQL_DATABASE backtests

COPY schema/config.sql /data/config.sql
WORKDIR /data

CMD mysql -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE < data/config.sql