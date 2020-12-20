FROM golang:alpine AS builder

RUN apk add --no-cache --no-progress git make gcc libc-dev

RUN git clone --depth=1 https://github.com/indes/flowerss-bot.git

RUN cd flowerss-bot/ && make build

FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /go/flowerss-bot/flowerss-bot /bin/

VOLUME /flowerss
WORKDIR /flowerss

CMD flowerss-bot
