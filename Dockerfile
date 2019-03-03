FROM python:3.6.8-alpine3.9
LABEL maintainer="gnkm <@gnkm>"

RUN apk add --update --no-cache \
        --allow-untrusted \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        hdf5 \
        hdf5-dev \
        g++ \
        gcc \
        gfortran \
        lapack \
        lapack-dev \
        # https://stackoverflow.com/questions/30624829/no-such-file-or-directory-limits-h-when-installing-pillow-on-alpine-linux
        linux-headers \
        musl-dev && \
    # https://stackoverflow.com/questions/22388519/problems-with-pip-install-numpy-runtimeerror-broken-toolchain-cannot-link-a
    apk add --virtual scipy-dependencies \
        make \
        automake \
        subversion && \
    pip install \
        # for installing jupyter
        cython==0.29.6 \
        jupyter==1.0.0 \
        https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl \
        keras==2.2.4 && \
    apk del --purge scipy-dependencies

