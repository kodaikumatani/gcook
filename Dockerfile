FROM golang:1.24.0-bookworm AS builder

WORKDIR /src

RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=bind,source=go.mod,target=go.mod \
    --mount=type=bind,source=go.sum,target=go.sum \
    go mod download -x

COPY . .

RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=cache,target=/root/.cache/go-build/ \
    make build

# ---

FROM builder AS dev

RUN apt-get update && apt-get upgrade -yq && \
    rm -rf /var/lib/apt/lists/*

CMD ["/src/bin/serve"]

# ---

FROM gcr.io/distroless/cc-debian12:latest

COPY --from=builder /src/bin/serve /bin/serve
CMD ["/bin/serve"]
