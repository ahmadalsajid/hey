#======================================#
# build env                            #
#======================================#

FROM golang:1.22 AS builder

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
ARG DESCRIPTION="Lightweight, minimal docker image of Hey, an HTTP loadgenerator, ApacheBench (ab) replacement, main Go code is available here:--> https://github.com/rakyll/hey"
ARG PACKAGE="ahmadalsajid/hey"

LABEL name="${PACKAGE}" \
    author="ahmadalsajid@gmail.com" \
    documentation="https://github.com/${PACKAGE}/README.md" \
    description="${DESCRIPTION}" \
    licenses="MIT License" \
    source="https://github.com/${PACKAGE}"

COPY --from=builder /go/bin/hey /hey

ENTRYPOINT ["/hey"]
# CMD ["sleep", "infinity"]
