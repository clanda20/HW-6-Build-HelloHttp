# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY app_files/* .
RUN apk add --no-cache build-base && \
    gcc -o dummyserv dummy_serv.c && \
    apk del build-base && \ 
    apk add --no-cache python3 py3-pip && \
    apk add  --no-cache git &&\
    apk add --no-cache bash
EXPOSE 5000
CMD ["./dummyserv"]