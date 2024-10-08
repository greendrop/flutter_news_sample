# 非スマホエンジニア向けのトピック

## スマホ・スマホアプリの状態

スマホ・スマホアプリの状態はいくつかある。

### スマホ本体の状態

- OS 状態
  - OS
  - バージョン
- 電源状態
  - オン
  - オフ
  - スリープ
- バッテリー状態
  - 使用中
  - 充電中
  - 充電完了
  - 低電力モード
  - バッテリー切れ
- 通信状態
  - Wi-Fi 接続
  - モバイルデータ通信
  - 機内モード
  - オフライン
- ストレージ状態
  - ストレージ容量
  - 空き容量あり
  - 空き容量なし

### スマホアプリの状態

- インストール状態
  - 未インストール
  - インストール済
- 実行状態
  - 実行中（フォアグラウンド）
  - バックグラウンド実行
  - 停止（Kill）
- 更新状態
  - 最新版
  - アップデート可能
  - アップデート不可
- 権限状態
  - 必要な権限が付与されている
  - 一部の権限が拒否されている
  - すべての権限が拒否されている
- データ状態
  - データが同期されている
  - データが同期されていない
  - データが破損している
- エラー状態
  - クラッシュ
  - フリーズ
  - エラーメッセージが表示される

## スマホアプリの画面遷移について

スマホアプリで次の画面へ遷移したり、前の画面に戻るような内容はスタックで管理されている。

### 例

#### 1. 画面 A を表示

##### スマホ画面

- 「画面 A」が表示されている
- 戻るボタンなし

##### スタック

- 画面 A

#### 2. 画面 A から画面 B に遷移

##### スマホ画面

- 「画面 B」が表示されている
- 戻るボタンあり

##### スタック

- 画面 B
- 画面 A

#### 3. 画面 A から画面 B に遷移し、画面 C に遷移

##### スマホ画面

- 「画面 C」が表示されている
- 戻るボタンあり

##### スタック

- 画面 C
- 画面 B
- 画面 A

#### 4. 画面 A から画面 B に遷移し、画面 C に遷移した後、1 つ戻る

##### スマホ画面

- 「画面 B」が表示されている
- 戻るボタンあり

##### スタック

- 画面 B
- 画面 A

#### 4. 画面 A から画面 B に遷移し、画面 C に遷移した後、前画面に戻らない状態の画面 D に遷移

##### スマホ画面

- 「画面 D」が表示されている
- 戻るボタンなし

##### スタック

- 画面 D

## 通知について

通知には、大きく分けて「ローカル通知」と「プッシュ通知」の 2 種類がある。

## ローカル通知

- スマホアプリ自体で 即時 または 決められた時間 に通知を表示ができる
- 決められた時間に通知する場合、その設定でメッセージも指定するため、柔軟にメッセージを変更することはできない
- オフラインでも通知を表示ができる
- サーバーが不要

## プッシュ通知

- サーバーから通知内容を受け取り、通知を表示できる
- サーバーから通知内容を送信するため、柔軟にメッセージ・タイミングを変更できる
- iOS は APNs(Apple Push Notification service)、Android は FCM(Firebase Cloud Messaging)で送信する
  - FCM 経由で APNs へ送信することも可能
  - サードパーティのサービスもある
    - [Amazon Simple Notification Service](https://aws.amazon.com/jp/sns/)
    - [OneSignal](https://onesignal.com/)
    - [Repro](https://repro.io/)
    - など
- プッシュ通知の中でも、通知を表示する「通知メッセージ」とデータのみの「データメッセージ」に分かれる。

### 通知メッセージ

- バックグラウンド実行・停止（Kill）
  - 受け取った通知内容をもとに通知に表示される
- フォアグラウンド
  - 自動で通知は表示されない
  - スマホアプリで通知を受け取ったことを検知し、ローカル通知により通知へ表示ができる

### データメッセージ

- データを受け取り、スマホアプリにて処理を行うことができる
- FCM 経由で APNs に送信した場合、サイレントプッシュ通知として扱われる
  - 実行可能時間は 30 秒
  - ユーザーによって明示的に停止（Kill）されてなければ実行可能

## URL によるスマホアプリ起動について

Web ページ内やメール文章内のリンクからスマホアプリを起動することができる。

### カスタムスキーマ

- `myapp:://` のようにスマホアプリ独自のカスタムスキーマ設定することができる
- そのカスタムスキーマを指定したリンクを作成しそれをクリックすると、スマホアプリが起動する
- スマホアプリがインストールされていない場合、なにも動作しない
- カスタムスキーマは自由に設定できるため、乗っ取り攻撃のセキュリティーリスクがある
  - 例: https://developers.line.biz/ja/news/2020/03/25/line-url-scheme-deprecation/

### Universal Links (iOS)

- `https://myapp.example.com` のような特定の URL でスマホアプリが起動できる
- `https://myapp.example.com/.well-known/apple-app-site-association` に設定を記載したファイルを配置しなければならない

### App Links (Android)

- `https://myapp.example.com` のような特定の URL でスマホアプリが起動できる
- `https://myapp.example.com/.well-known/assetlinks.json` に設定を記載したファイルを配置しなければならない

### サードパーティのサービス

サードパーティのサービスを利用することで、スマホアプリ起動の URL が用意でき、スマホアプリがインストールされていない場合は App Store, Play Store を開くことができる。

- [Firebase Dynamic Links](https://firebase.google.com/docs/dynamic-links?hl=ja) (2025/08/25 サービス終了)
- [Adjust](https://www.adjust.com/ja/)
- [AppsFlyer](https://www.appsflyer.com/ja/)

## URL によるスマホアプリ起動時に特定の画面に遷移したい

`myapp:///page_a` や `mypage:///page_a/page_b` のように URL のパスを利用して遷移したい画面の情報を受け取ることができる。
そのパスを受け取り画面を遷移する処理は、スマホアプリ側で実装しなければならない。

### 参考

- https://docs.flutter.dev/ui/navigation/deep-linking

## スマホアプリの審査について

App Store (iOS), Play Store (Android) にスマホアプリを公開する場合、審査がある。
審査には一定時間かかるため、すぐに公開することはできない。
また、審査で拒否された場合、拒否内容を修正し再度審査しなければならない。

### 審査期間

#### App Store (iOS)

- 1〜2 日程度
- 審査期間が長引くこともある
  - 初回提出: 初めて App Store にアプリを提出する場合、審査が厳しく行われるため、時間がかかることがある。
  - 大きなアップデート: アプリの機能が大幅に変更されるようなアップデートの場合も、審査に時間がかかることがある。
  - 審査項目への違反: ガイドラインに違反している部分があると、修正を求められ、審査が遅れる可能性がある。
  - 審査の混雑: 審査依頼が集中している時期は、審査に時間がかかることがある。

> 平均すると、提出件数の 90%が 24 時間以内に審査されます。審査のステータスに変更があると、通知メールが送信されます。また、App Store Connect の「アプリ」セクションや、iPhone／iPad 向けの App Store Connect アプリでも、提出したアイテムの審査ステータスを確認できます。提出したアイテムに不備がある場合は、審査の所要時間が長くなったり、審査を通過できない可能性があります。

https://developer.apple.com/jp/distribute/app-review/

#### Play Store (Android)

- 1〜2 日程度
- 審査期間が長引くこともある
  - アプリの複雑さ: 機能が多いアプリや、新しい技術を採用しているアプリは、審査に時間がかかることがある。
  - 審査状況: 審査依頼が集中している時期や、重大なバグが見つかった場合などは、審査が遅れる可能性がある。
  - ポリシー違反: Google Play のポリシーに違反している部分があると、修正を求められ、審査が遅れることがある。

> アプリの変更は公開する前に、すべて処理が完了している必要があります。この処理には、アプリの審査期間に応じて数時間から最長で 7 日程度かかりますが、例外的にもっとかかる場合もあります。
> ヒント: アプリの送信から公開まで 1 週間以上かかることを加味して計画を立てることをおすすめします。

https://support.google.com/googleplay/android-developer/answer/9859654?hl=ja

#### 参考

- https://developer.apple.com/jp/distribute/app-review/
- https://play.google/developer-content-policy/
