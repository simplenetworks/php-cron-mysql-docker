FROM php:7.2-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev cron\
    mariadb-client --no-install-recommends \
    && docker-php-ext-install pdo_mysql

ADD crontab /etc/cron.d/laravel-cron
RUN /bin/ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN chmod 0644 /etc/cron.d/laravel-cron

RUN touch  /var/log/cron.log
COPY ./entrypoint.sh /
ENTRYPOINT /entrypoint.sh