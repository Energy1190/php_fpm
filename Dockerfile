FROM php:5.6-fpm-alpine

RUN sed -e 's/^listen = .*/listen = 9000/' -i /usr/local/etc/php-fpm.d/www.conf \
	&& sed -e 's/^;security\.limit_extensions = .*/security\.limit_extensions = \.pl \.php \.php3 \.php4 \.php5 \.phtml/' -i /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000
CMD ["php-fpm"]
