#======================================#
# build env                            #
#======================================#

FROM golang:1.22 AS builder
LABEL author="ahmadalsajid@gmail.com"

WORKDIR /app

RUN git clone https://github.com/rakyll/hey.git

WORKDIR /app/hey

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/hey hey.go


#======================================#
# deployment env                       #
#======================================#

FROM alpine:3.20

ARG APPLICATION="hey"
ARG DESCRIPTION="Lightweight, minimal docker image of Hey, an HTTP load generator, ApacheBench (ab) replacement, inspired from https://hub.docker.com/r/ricoli/hey"
ARG PACKAGE="ahmadalsajid/hey"

LABEL org.opencontainers.image.ref.name="${PACKAGE}" \
    org.opencontainers.image.authors="ahmadalsajid@gmail.com" \
    org.opencontainers.image.documentation="https://github.com/${PACKAGE}/README.md" \
    org.opencontainers.image.description="${DESCRIPTION}" \
    org.opencontainers.image.licenses="Apache 2.0" \
    org.opencontainers.image.source="https://github.com/${PACKAGE}"

COPY --from=builder /go/bin/hey /hey

ENTRYPOINT ["/hey"]
# CMD ["sleep", "infinity"]
