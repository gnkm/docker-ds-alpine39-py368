FROM python:3.7.2-alpine3.9
MAINTAINER gnkm <@gnkm>

RUN apk add --update --no-cache \
        gcc && \
    apk add --virtual jupyter-dependencies \
        g++ \
        # https://stackoverflow.com/questions/30624829/no-such-file-or-directory-limits-h-when-installing-pillow-on-alpine-linux
        linux-headers \
        musl-dev && \
    pip install \
        cython==0.29.6 \
        jupyter && \
    apk del jupyter-dependencies

