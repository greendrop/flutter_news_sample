# テストアーキテクチャ

## ユニットテスト・ウィジェットテスト

### 目的

- Widget, Hook, Riverpod, Repository を対象に、機能・ロジックが正しく動作することを確認する
- テスト対象の機能・ロジックが変更された際に、その変更が他の機能・ロジックに影響を及ぼさないかを確認する
- 機能・ロジックは、なるべく網羅するようにテストをする


### ツール

- [flutter_test](https://docs.flutter.dev/cookbook/testing)
- [mocktail](https://pub.dev/packages/mocktail)
- [http_mock_adapter](https://pub.dev/packages/http_mock_adapter)


## ビジュアルリグレッションテスト

### 目的

- Widget が正しく表示されることを画像で確認する
- Widget の変更が、意図しない変更を引き起こしていないかを確認する

### ツール

- [flutter_test](https://docs.flutter.dev/cookbook/testing)
- [alchemist](https://pub.dev/packages/alchemist)


## 結合テスト

### 目的

- Widget, Hook, Riverpod, Repository を結合し、正しく動作することを確認する
- iOS シミュレーター, Android エミュレーターで動作することを確認する
- 外部の Web API との通信などは、モックサーバーを利用してテストする

### ツール

- [integration_test](https://docs.flutter.dev/cookbook/testing)
- [WireMock](http://wiremock.org/)


## E2Eテスト

### 目的

- アプリケーション全体の動作を確認する
- ユーザーが操作するようなシナリオを再現し、正しく動作することを確認する

### ツール

TODO
