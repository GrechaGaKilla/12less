FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o app .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/app .

COPY tracker.db .

CMD ["./app"]