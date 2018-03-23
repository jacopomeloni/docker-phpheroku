# docker-phpheroku
nginx with php7-fpm, managed with supervisord optimized to deploy on heroku as unique container-app

It exposes $PORT port in order to be managed by heroku container system.

## to run (example)
docker run -e PORT=456 -p 9876:546

http://localhost:9876
