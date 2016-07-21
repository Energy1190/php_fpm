FROM debian:jessie

RUN apt-get update && \
    apt-get install -y $buildDeps \
        php5-cli \
        php5-common \
        php5-mysql \
        php5-gd \
        php5-fpm \
        php5-cgi \
        php5-fpm \
        php-pear \
        php5-mcrypt \
        php5-memcache \
        php5-curl \
        curl \
        sendmail \
        perl \
        mysql-client \
     && rm -rf /var/lib/apt/lists/*
    
RUN curl -sS https://getcomposer.org/installer | php
RUN php composer.phar require mailgun/mailgun-php:~2.0
RUN php composer.phar require phpmailer/phpmailer:~5.2

RUN sed -e 's/^listen = .*/listen = 9000/' -i /etc/php5/fpm/pool.d/www.conf \
	&& sed -e 's/^;security\.limit_extensions = .*/security\.limit_extensions = \.pl \.php \.php3 \.php4 \.php5 \.phtml/' -i /etc/php5/fpm/pool.d/www.conf

RUN ln -sf /dev/stdout /var/log/php5-fpm.log

EXPOSE 9000
ENTRYPOINT /usr/sbin/php5-fpm --nodaemonize
