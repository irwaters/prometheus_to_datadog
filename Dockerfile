FROM golang:1.8.0-alpine

RUN apk add --update --no-cache bash 

RUN mkdir /app
WORKDIR /app

ADD bin /app/bin

EXPOSE 4242
CMD bin/prom_to_datadog
