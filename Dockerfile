FROM golang:rc-alpine AS builder

WORKDIR /go/src/app
COPY ./hello-world.go .

RUN go build hello-world.go

#############################
FROM scratch

COPY --from=builder /go/src/app/hello-world /go/src/app/hello-world

ENTRYPOINT ["/go/src/app/hello-world"]