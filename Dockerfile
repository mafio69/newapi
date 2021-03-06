FROM mafio69/phpnginx
USER root
RUN apk update && apk add git
RUN mkdir /.symfony
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

COPY ./main /main
RUN chown 1000:1001 /main
RUN chown 1000:1001 /.symfony
RUN chmod -R 777 /main
# RUN chmod -R 777 /.gitconfig

USER 1000

WORKDIR /main