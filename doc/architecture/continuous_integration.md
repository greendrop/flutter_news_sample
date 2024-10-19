# 継続的インテグレーション / Continuous Integration (CI)

GitHub Actions を使用し、テストの実行などを行う。

## Flutter Lint

Flutter の静的解析を行う。

- `dart run build_runner build` の生成ファイルの差分確認
- `dart format`
- `flutter analyze`

### 設定ファイル

[flutter_lint.yml](../../.github/workflows/flutter_lint.yml)

### 実行タイミング

- Pull Request すべてのアクティビティ
- main, develop ブランチへ push

### Secrets, Variables 設定

なし

## Flutter Test

Flutter のテストを行う。

### 設定ファイル

[flutter_test.yml](../../.github/workflows/flutter_test.yml)

### 実行タイミング

- Pull Request すべてのアクティビティ
- main, develop ブランチへ push

### Secrets, Variables 設定

なし


## Flutter Golden Test

Flutter の Golden Test, VRT を行う。

### 設定ファイル

[flutter_golden_test.yml](../../.github/workflows/flutter_golden_test.yml)

### 実行タイミング

- Pull Request すべてのアクティビティ
- main, develop ブランチへ push

### Secrets, Variables 設定

なし


## Flutter Widgetbook Lint

Flutter Widgetbook の静的解析を行う。

- `dart run build_runner build` の生成ファイルの差分確認
- `dart format`
- `flutter analyze`

### 設定ファイル

[flutter_widgetbook_lint.yml](../../.github/workflows/flutter_widgetbook_lint.yml)

### 実行タイミング

- Pull Request すべてのアクティビティ
- main, develop ブランチへ push

### Secrets, Variables 設定

なし


## GitHub Actions Lint

GitHub Actions の静的解析を行う。

- [actionlint](https://github.com/rhysd/actionlint)
- [ghalint](https://github.com/suzuki-shunsuke/ghalint)

### 設定ファイル

[github_actions_lint.yml](../../.github/workflows/github_actions_lint.yml)

### 実行タイミング

- Pull Request すべてのアクティビティで、以下のファイルが変更がある
  - .github/workflows/*.yaml
  - .github/workflows/*.yml

### Secrets, Variables 設定

なし


## yamllint

YAMLファイル の静的解析を行う。

- [yamllint](https://yamllint.readthedocs.io/)

### 設定ファイル

[yamllint.yml](../../.github/workflows/yamllint.yml)

### 実行タイミング

- Pull Request すべてのアクティビティで、以下のファイルが変更がある
  - **/*.yaml
  - **/*.yml

### Secrets, Variables 設定

なし
