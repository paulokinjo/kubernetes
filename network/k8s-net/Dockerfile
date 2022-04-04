FROM golang:1.15 AS builder
WORKDIR /opt
COPY webserver.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o webserver .

FROM golang:1.15
WORKDIR /opt
COPY --from=0 /opt/webserver .
CMD ["/opt/webserver"]
