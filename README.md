# docker-phpheroku
Image for php application, ready to be deployed on Heroku Container Registry & Runtime
- nginx:stable-alpine image with php7-fpm installed.
- supervisord manage processes.
- you can deploy on heroku as unique container-app.
- you must expose $PORT port, so heroku can manage your image.

## Build your image based on this one

### Dockerfile
    FROM jacopomeloni/nginx-phpfpm-heroku

    COPY <your index.php>:/var/www/public

    EXPOSE $PORT

    CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]

### Build command
    $ docker build -t your-image .

## Run your container locally (example)
docker run -e PORT=456 -p 9876:456 your-image

http://localhost:9876
