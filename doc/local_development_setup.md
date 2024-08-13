# ローカル開発環境

## 構築手順

### FVM をインストール

- Flutter SDK のインストール・バージョン管理のため、[FVM](https://fvm.app/) をインストール
- インストール後、`fvm doctor`を実行
  - 正常にインストールできているか確認
  - 問題がある場合、その問題を解消

### Flutter SDK をインストール

- Fluter SDK を`fvm install FLUTTER_VERSION`コマンドでインストール
  - `FLUTTER_VERSION`は[こちら](../.fvmrc)を参照
- インストール後、`fvm flutter doctor`を実行
  - 正常にインストールできているか確認
  - 問題がある場合、その問題を解消

### Dart define file を用意

- 以下のコマンドを実行し、Dart define file を用意

  ```
  cp dart_define/stg_sample.json dart_define/stg.json
  ```

  ```
  cp dart_define/prod_sample.json dart_define/prod.json
  ```

- News API から取得した API KEY を stg.json, prod.json に設定