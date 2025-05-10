# gcook

## Prerequisite

-   Go 1.24+
-   OrbStack (recommended)

framework: https://gin-gonic.com/ja/

### コンテナ起動 (for Docker addicts)

```shell
docker compose up -d    コンテナ起動
docker compose ps       確認
```

### API サーバー起動

```shell
go run ./cmd/serve API サーバを起動
curl --location --request GET 'http://localhost:8080/ping'  動作確認
```

### Docker 開発

[direnv](https://direnv.net/) を導入すると go コマンドを Docker 内で実行することができる

```shell
direnv allow
docker compose up -d app コンテナの起動
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

## Managing database schemas

データベースのスキーマ管理は https://atlasgo.io/ で行う

```sh
atlas migrate apply --env local
atlas schema clean --env local
atlas migrate diff --env local
```

# 🍳 gCook 開発タスクリスト（gRPC × CRUD 学習用）

## ✅ フェーズ 1: 設計 & 準備

-   [x] 要件定義を確認・確定する
-   [ ] ER 図と DB スキーマを設計する
-   [ ] gRPC の proto ファイルを設計する
-   [ ] 開発環境（Docker）を構築する

---

## ⚙ フェーズ 2: サーバー開発（gRPC バックエンド）

-   [ ] gRPC サーバーの起動ロジックを実装する
-   [ ] gRPC Service 実装：CreateRecipe
-   [ ] gRPC Service 実装：GetRecipe / ListRecipes
-   [ ] gRPC Service 実装：UpdateRecipe
-   [ ] gRPC Service 実装：DeleteRecipe
-   [ ] gRPC Service 実装：RateRecipe
-   [ ] gRPC Service 実装：GetAverageRating
-   [ ] gRPC Service 実装：PostComment / ListComments
-   [ ] gRPC Service 実装：タグ関連（一覧・追加）

---

## 🧪 フェーズ 3: テスト & CLI クライアント

-   [ ] gRPC サービスの単体テストを書く
-   [ ] gRPC CLI クライアントを用意する（grpcurl や手製 CLI）
-   [ ] テストデータ投入スクリプト作成

---

## 🚀 フェーズ 4: デプロイ・運用（任意）

-   [ ] Docker Compose による統合起動
-   [ ] README にセットアップ手順を記載
-   [ ] CI/CD 設定（任意、GitHub Actions など）
