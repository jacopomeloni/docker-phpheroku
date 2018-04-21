# nginxphpfpm-heroku
Image for php application, ready to be deployed on Heroku Container Registry & Runtime
- Image based on alpine.
- Web server nginx with php7.2-fpm.
- Processes managed by supervisor.
- Image ready to be deployed on heroku as unique container-app.
- Heroku rule: you must expose $PORT port, so Heroku Container Registry & Runtime can correctly manage your image.

## Build your image based on this one

### Your Dockerfile
    FROM jacopomeloni/nginxphpfpm-heroku

    COPY <your code>:/var/www/public

    EXPOSE $PORT

    CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.d/supervisor.ini"]

### Build command
    $ docker build -t your-image .

## Run your container locally (example)
docker run --rm -e PORT=456 -p 9876:456 your-image

http://localhost:9876
