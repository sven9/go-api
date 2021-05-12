FROM golang:1.16.4-buster AS base

WORKDIR /project

COPY go.mod go.sum .
RUN go mod download

COPY . /project

RUN go build -o /server

FROM base AS development

RUN go get github.com/codegangsta/gin

CMD ["gin", "run", "main.go"]

FROM debian:buster AS build

EXPOSE 8080

WORKDIR /
COPY --from=base /server /

CMD ["/server"]
