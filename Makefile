GO = go

bin/serve:
	$(GO) build -o ./bin/serve ./cmd/serve

.PHONY: build
build: bin/serve
