# Dockerfile for data science

This image is based on python:3.6.8-alpine3.9.

## Build

```
$ docker build -t gnkm/ds:python3.6.8-alpine3.9 .
```

## Run

```
$ docker run --rm --name jupyter -p 8888:8888 gnkm/ds:python3.6.8-alpine3.9 jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root
```

