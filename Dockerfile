FROM nginx:stable-alpine

LABEL MANTAINER=jacopomeloni@gmail.com

ENV PORT=80


RUN apk --update --upgrade add \
    php7 \
    php7-fpm \
    py-pip && \
    ln -s /usr/bin/php7 /usr/bin/php

RUN pip install --upgrade pip
RUN pip install supervisor
    
RUN rm -rf /var/cache/apk/*

# set the nginx configuration
COPY ./conf/nginx/default.conf /default.conf
COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf

# copy the phpfpm configuration
COPY ./conf/phpfpm/php-fpm.conf /etc/php7/php-fpm.conf
COPY ./conf/phpfpm/www.conf /etc/php7/php-fpm.d/www.conf

# copy the supervisord configuration
ADD ./conf/supervisord/supervisor.ini /etc/supervisor.d/supervisor.ini

# copy the start scripts
COPY ./conf/scripts/startNginx.sh /startNginx.sh
COPY ./conf/scripts/startPhpFpm.sh /startPhpFpm.sh
RUN chmod +x /startNginx.sh && \
    chmod +x /startPhpFpm.sh

# copy the application code
COPY ./public/ /var/www/public

EXPOSE $PORT

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]
