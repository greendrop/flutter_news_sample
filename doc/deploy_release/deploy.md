# デプロイ

## ステージング環境

本番環境へリリースする前に、その動作を最終的に確認するための環境。

### デプロイ先

#### Android

Firebase App Distribution

※ テスターに登録されているユーザーのみ利用可能。

### 接続先

#### News API

https://newsapi.org/

※ 開発者向けの別環境はないため、News API の本番環境へ接続する。

#### Firebase

ステージング環境用に作成した Firebase プロジェクト。

### デプロイ手順

#### Android / 特定ブランチをデプロイ

1. GitHub Actions >「Deploy Android (Stg)」を選択
2. Run workflow のドロップダウンブランチを選択し、「Run workflow」をクリック

#### Android / Pull Request のブランチをデプロイ

1. 対象の Pull Request を開く
2. コメントに `/deploy_android_stg` を登録


## 本番環境 (Production)

実際にユーザーに公開され、利用される環境。

### デプロイ先

#### Android

Google Play

### 接続先

#### News API

https://newsapi.org/

#### Firebase

本番環境用に作成した Firebase プロジェクト。

### デプロイ手順

#### Android / 特定ブランチをデプロイ

1. GitHub Actions >「Deploy Android (Prod)」を選択
2. Run workflow のドロップダウンブランチを選択し、「Run workflow」をクリック

#### Android / Pull Request のブランチをデプロイ

1. 対象の Pull Request を開く
2. コメントに `/deploy_android_prod` を登録
