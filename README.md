# gin-test
framework: https://gin-gonic.com/ja/

### コンテナ起動 (for Docker addicts)
```shell
docker compose up -d	コンテナ起動
docker compose ps		確認
```

### APIサーバー起動
```shell
make build			コードをビルド
go run ./cmd/serve	API サーバを起動
curl --location --request GET 'http://localhost:8080/ping'	動作確認
```

### Docker 開発
[direnv](https://direnv.net/) を導入すると go コマンドを Docker 内で実行することができる
```shell
direnv allow
docker compose up -d	app コンテナの起動
```

## Tool
### Installation
```shell
go get -tool ${package}
```

### Execution
```shell
go tool golangci-lint run # Linter を実行
```