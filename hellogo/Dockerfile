# syntax=docker/dockerfile:1

FROM golang:1.25 AS builder
WORKDIR /src
COPY ./main.go ./main.go
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/hello ./main.go

FROM scratch
COPY --from=builder /bin/hello /bin/hello
CMD ["/bin/hello"]
