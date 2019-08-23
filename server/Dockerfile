
FROM golang:1.12.7-stretch
WORKDIR /go/src/server

COPY . .
RUN go build cmd/flowthru-server/main.go -o /bin/app

EXPOSE 3000
CMD ["/bin/app"]

