![hey](http://i.imgur.com/szzD9q0.png)

![Build](https://github.com/ahmadalsajid/hey-docker/actions/workflows/actions.yml/badge.svg?branch=main)

Lightweight, minimal docker image of [Hey](https://github.com/rakyll/hey),
an HTTP load generator, ApacheBench (ab) replacement., with latest version
of Go and Alpine for both Linux/amd64 and Linux/arm64 architectures.

Hey is a tiny program that sends some load to a web application.

## Installation

```
$ docker pull ahmadalsajid/hey-docker
```

## Usage

hey runs provided number of requests in the provided concurrency level and
prints stats. A basic usage could be

```
$ docker run --rm  ahmadalsajid/hey-docker -n 1000 -c 100 https://google.com
```

It also supports HTTP2 endpoints.

```
Usage: hey [options...] <url>

Options:
  -n  Number of requests to run. Default is 200.
  -c  Number of workers to run concurrently. Total number of requests cannot
      be smaller than the concurrency level. Default is 50.
  -q  Rate limit, in queries per second (QPS) per worker. Default is no rate limit.
  -z  Duration of application to send requests. When duration is reached,
      application stops and exits. If duration is specified, n is ignored.
      Examples: -z 10s -z 3m.
  -o  Output type. If none provided, a summary is printed.
      "csv" is the only supported alternative. Dumps the response
      metrics in comma-separated values format.

  -m  HTTP method, one of GET, POST, PUT, DELETE, HEAD, OPTIONS.
  -H  Custom HTTP header. You can specify as many as needed by repeating the flag.
      For example, -H "Accept: text/html" -H "Content-Type: application/xml" .
  -t  Timeout for each request in seconds. Default is 20, use 0 for infinite.
  -A  HTTP Accept header.
  -d  HTTP request body.
  -D  HTTP request body from file. For example, /home/user/file.txt or ./file.txt.
  -T  Content-type, defaults to "text/html".
  -a  Basic authentication, username:password.
  -x  HTTP Proxy address as host:port.
  -h2 Enable HTTP/2.

  -host	HTTP Host header.

  -disable-compression  Disable compression.
  -disable-keepalive    Disable keep-alive, prevents re-use of TCP
                        connections between different HTTP requests.
  -disable-redirects    Disable following of HTTP redirects
  -cpus                 Number of used cpu cores.
                        (default for current machine is 8 cores)
```