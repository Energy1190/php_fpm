FROM php:5.6-fpm-alpine

RUN sed -e 's/^listen = .*/listen = 9000/' -i /etc/php5/fpm/pool.d/www.conf \
	&& sed -e 's/^;security\.limit_extensions = .*/security\.limit_extensions = \.pl \.php \.php3 \.php4 \.php5 \.phtml/' -i /etc/php5/fpm/pool.d/www.conf

RUN ln -sf /dev/stdout /var/log/php5-fpm.log

EXPOSE 9000
ENTRYPOINT /usr/sbin/php5-fpm --nodaemonize
