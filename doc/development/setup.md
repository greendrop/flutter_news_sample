# 開発環境

## 構築手順

### FVM をインストール

- Flutter SDK のインストール・バージョン管理のため、[FVM](https://fvm.app/) をインストール
- インストール後、`fvm doctor` を実行
  - 正常にインストールできているか確認
  - 問題がある場合、その問題を解消

### Flutter SDK をインストール

- Fluter SDK を `fvm install FLUTTER_VERSION` コマンドでインストール
  - `FLUTTER_VERSION` は[こちら](../.fvmrc)を参照
- インストール後、`fvm flutter doctor` を実行
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


### Firebase google-services.json, GoogleService-Info.plist を用意

- Firebase console から google-services.json, GoogleService-Info.plist をダウンロード
- ダウンロードした google-services.json, GoogleService-Info.plist を配置
  - Android Stg
    - 配置先: `android/app/src/stg/google-services.json`
  - Android Prod
    - 配置先: `android/app/src/prod/google-services.json`
  - iOS Stg
    - 配置先: `ios/Runner/Firebase/stg/GoogleService-Info.plist`
  - iOS Prod
    - 配置先: `ios/Runner/Firebase/prod/GoogleService-Info.plist`

### Visual Studio Code で開く

- 以下の URL を参考に、Visual Studio Code を用意し、Flutter extension を追加する
  https://docs.flutter.dev/tools/vs-code
- Visual Studio Code でこのリポジトリのルートディレクトリを指定して開く

### パーッケージのインストール

- ターミナルでリポジトリのルートディレクトリを開き、`flutter pub get` を実行

### 実機・シミュレーターでアプリを起動

参考: https://docs.flutter.dev/tools/vs-code#running-and-debugging

- 実機・シミュレーターでアプリを起動
  - 実機・シミュレーターを接続
  - Run > Start Debugging または F5 でアプリを起動

> [!NOTE]
> `.vscode/launch.json` で起動時のオプションを設定している

## Docker 構築手順

WireMock などの環境を Docker で構築する手順。

### Docker Desktop のインストール

https://docs.docker.com/desktop/

### コンテナの起動

```
docker compose up
```

## Node 構築手順

文章構成などで使用する Node.js の環境を構築する手順。

### nodenv のインストール

```
brew install nodenv node-build
```

### Node.js のインストール

```
nodenv install NODE_VERSION
```

※ `NODE_VERSION` は[こちら](../.node-version)を参照。

### npm パッケージのインストール

```
npm install
```

## Widgetbook 構築手順

### Widgetbook ディレクトリに移動

```
cd wigetbook
```

### パーッケージのインストール

- ターミナルでリポジトリのルートディレクトリを開き、`flutter pub get` を実行

### ブラウザでWidgetアプリを起動

```
flutter run -d chrome
```

## Integration Test 構築手順

### Dart define file を用意

- 以下のコマンドを実行し、Dart define file を用意

  ```
  cp dart_define/integration_test_android_sample.json dart_define/integration_test_android.json
  cp dart_define/integration_test_ios_sample.json dart_define/integration_test_ios.json
  ```

### iOS シミュレーター / Android エミュレーター を用意

Integration Test を実行するために、iOS シミュレーター / Android エミュレーター を用意する。

iOS シミュレーター: https://flutter.dev/docs/get-started/install/macos#set-up-the-ios-simulator

Android エミュレーター: https://flutter.dev/docs/get-started/install/macos#set-up-the-android-emulator
