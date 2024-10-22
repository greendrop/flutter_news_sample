# 開発環境コマンド

## pub package manager

https://dart.dev/tools/pub/cmd

### パッケージの取得

```
flutter pub get
```

### 更新可能なパッケージの確認

```
flutter pub outdated
```

### パッケージの更新

*すべてのパッケージ（依存関係も含む）を更新*

```
flutter pub upgrade
```

*特定パッケージの更新*

```
flutter pub upgrade package_name
```

*上限制約を無視してパッケージを更新*

```
flutter pub upgrade --major-versions
```

## 自動生成

### build_runner による自動生成

[build_runner](https://pub.dev/packages/build_runner) に対応したものの自動生成を行う。

例えば、[freezed](https://pub.dev/packages/freezed), [riverpod_generator](https://pub.dev/packages/riverpod_generator), [go_router_builder](https://pub.dev/packages/go_router_builder) など。

*自動生成*

```
dart run build_runner build
```

*競合する出力を削除して自動生成*

```
dart run build_runner build -d
```

### アイコンの自動生成

[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) を使用し、iOS, Android のアイコンを自動生成する。

```
dart run flutter_launcher_icons
```

### スプラッシュの自動生成

[flutter_native_splash](https://pub.dev/packages/flutter_native_splash) を使用し、iOS, Android のアイコンを自動生成する。

```
dart run flutter_native_splash:create
```

## テスト

### 単体テスト

https://docs.flutter.dev/cookbook/testing/unit/introduction

*すべてのテストを実行*

```
flutter test
```

*Golden Test, VRT を除くテストを実行*

```
flutter test --coverage --exclude-tags golden
```

*Golden Test, VRT テストを実行*

```
flutter test --tags golden
```

*Golden Test, VRT テストの比較画像を更新*

```
flutter test --update-goldens --tags=golden
```
