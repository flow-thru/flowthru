
FROM golang:1.12.7-stretch
WORKDIR /go/src/server

COPY . .
RUN GO111MODULE=on go build -o bin/app cmd/flowthru-server/main.go

EXPOSE 3000
CMD ["/bin/app"]

