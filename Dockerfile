
FROM golang:1.22.3-alpine3.20 AS builder
ENV APP_NAME pluralia
ENV WORKDIR /app
WORKDIR $WORKDIR
COPY . .
RUN go mod download
RUN go build -o /$APP_NAME

## Deploy
FROM alpine:3.19.0
ENV APP_NAME pluralia
WORKDIR /
COPY --from=builder /$APP_NAME /$APP_NAME
ENTRYPOINT ["/pluralia"]
