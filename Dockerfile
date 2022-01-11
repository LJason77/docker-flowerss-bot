FROM golang:alpine AS builder

RUN apk add -qq --force-refresh --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community gcc libc-dev

RUN go install github.com/indes/flowerss-bot@latest

FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /go/bin/flowerss-bot /bin/

VOLUME /flowerss

WORKDIR /flowerss

CMD flowerss-bot
