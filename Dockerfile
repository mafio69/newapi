FROM khromov/alpine-nginx-php8


ENV XDEBUG_VERSION="3.0.0"
ENV APP_NAME="CCFOUND"
ENV DATABASE_NAME="ccfound"
ENV DOCUMENT_ROOT="public"
ENV DATABASE_USER="test"
ENV DATABASE_PASSWORD=1234
ENV DATABASE_ROOT_PASSWORD=4567
ENV DEBUG=1
ENV WEB_PORT=8070
ENV DATABASE_PORT=3306
ENV EMAIL_USER=test
ENV EMAIL_PASSWORD=test
ENV EMAIL_HOST=mailhog
ENV VAR_DUMPER_SERVER=/main/var/log
ENV DB_HOST_LOCAL=database
ENV SERVERNAME=api.ccfound.test
ENV SERVERALIAS=www.api.ccfound.test
COPY ./config/fpm-pool.conf /etc/php7/php-fpm.d/server.conf
COPY ./config/nginx.conf /etc/nginx/conf.d/server.conf
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/php.ini /etc/php7/conf.d/settings.ini
COPY ./main /main
RUN chown 1000:1001 /main
RUN chmod 777 /main

WORKDIR /main