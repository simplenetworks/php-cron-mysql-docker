#!/bin/bash

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' >/var/www/container.env

cron -f &
docker-php-entrypoint php-fpm
