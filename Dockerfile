FROM golang:latest AS builder

WORKDIR /app

COPY . .

RUN go build -o /main hello.go


FROM scratch

WORKDIR /

COPY --from=builder /main /hello

ENTRYPOINT ["/hello"]