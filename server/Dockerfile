
FROM gobuffalo/buffalo:v0.14.6
WORKDIR /go/src/server

COPY . .
RUN go get
RUN buffalo setup
RUN git init && git add . && git commit -m "initial commit"
RUN buffalo build -o /bin/app

EXPOSE 3000

