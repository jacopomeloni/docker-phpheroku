FROM php:7.2-fpm-alpine

LABEL MANTAINER=jacopomeloni@gmail.com

ENV PORT=80

# install packages
RUN apk --update add \
    curl \
    git \
    nginx \
    supervisor

# set the nginx configuration
COPY ./conf/nginx/default.conf /default.conf
COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf

# copy the phpfpm configuration
COPY ./conf/phpfpm/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./conf/phpfpm/php-fpm.conf /etc/php7/php-fpm.conf

# copy the supervisord configuration
ADD ./conf/supervisord/supervisor.ini /etc/supervisor.d/supervisor.ini

# copy the start scripts
COPY ./conf/scripts/startNginx.sh /startNginx.sh
COPY ./conf/scripts/startPhpFpm.sh /startPhpFpm.sh
RUN chmod +x /startNginx.sh && \
    chmod +x /startPhpFpm.sh

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# copy the application code
COPY ./public/ /var/www/public

EXPOSE $PORT

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
