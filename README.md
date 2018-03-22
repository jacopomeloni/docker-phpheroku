# docker-phpheroku
nginx with php7-fpm, managed with supervisord optimized for deploy on heroku

It exposes $PORT port in order to be managed by heroku container system.

## to run
docker run -e PORT=xyz -p your-public-port:xyz
