FROM golang:1.23.3-bookworm AS builder

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

FROM gcr.io/distroless/cc-debian12:latest

COPY --from=builder /src/bin/serve /bin/serve
CMD ["/bin/serve"]
