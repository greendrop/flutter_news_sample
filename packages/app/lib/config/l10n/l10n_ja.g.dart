// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.g.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get generalAppTitle => 'News';

  @override
  String get generalOk => 'OK';

  @override
  String get generalNg => 'NG';

  @override
  String get generalYes => 'はい';

  @override
  String get generalNo => 'いいえ';

  @override
  String get generalClose => '閉じる';

  @override
  String get generalAdd => '追加';

  @override
  String get generalCreate => '登録';

  @override
  String get generalEdit => '編集';

  @override
  String get generalUpdate => '更新';

  @override
  String get generalSearch => '検索';

  @override
  String get generalBack => '戻る';

  @override
  String get generalShare => '共有';

  @override
  String get generalNoDataAvailable => 'データがありません。';

  @override
  String get appExceptionMessage => 'エラーが発生しました。';

  @override
  String get appHttpExceptionBadRequestMessage => 'リクエストが不正です。';

  @override
  String get appHttpExceptionUnauthorizedMessage => '認証が必要です。';

  @override
  String get appHttpExceptionPaymentRequiredMessage => '支払いが必要です。';

  @override
  String get appHttpExceptionForbiddenMessage => 'アクセスが禁止されています。';

  @override
  String get appHttpExceptionNotFoundMessage => 'リソースが見つかりません。';

  @override
  String get appHttpExceptionMethodNotAllowedMessage => 'メソッドが許可されていません。';

  @override
  String get appHttpExceptionNotAcceptableMessage => '受理できません。';

  @override
  String get appHttpExceptionProxyAuthenticationRequiredMessage => 'プロキシ認証が必要です。';

  @override
  String get appHttpExceptionRequestTimeoutMessage => 'リクエストがタイムアウトしました。';

  @override
  String get appHttpExceptionConflictMessage => '競合が発生しました。';

  @override
  String get appHttpExceptionGoneMessage => 'リソースが存在しません。';

  @override
  String get appHttpExceptionLengthRequiredMessage => '長さが必要です。';

  @override
  String get appHttpExceptionPreconditionFailedMessage => '前提条件が失敗しました。';

  @override
  String get appHttpExceptionPayloadTooLargeMessage => 'ペイロードが大きすぎます。';

  @override
  String get appHttpExceptionUriTooLongMessage => 'URIが長すぎます。';

  @override
  String get appHttpExceptionUnsupportedMediaTypeMessage => 'サポートされていないメディアタイプです。';

  @override
  String get appHttpExceptionRangeNotSatisfiableMessage => '範囲が満たされていません。';

  @override
  String get appHttpExceptionExpectationFailedMessage => '期待が失敗しました。';

  @override
  String get appHttpExceptionIAmATeapotMessage => '私はティーポットです。';

  @override
  String get appHttpExceptionMisdirectedRequestMessage => '誤ったリクエストです。';

  @override
  String get appHttpExceptionUnprocessableEntityMessage => '処理できません。';

  @override
  String get appHttpExceptionLockedMessage => 'ロックされています。';

  @override
  String get appHttpExceptionFailedDependencyMessage => '依存関係が失敗しました。';

  @override
  String get appHttpExceptionTooEarlyMessage => '早すぎます。';

  @override
  String get appHttpExceptionUpgradeRequiredMessage => 'アップグレードが必要です。';

  @override
  String get appHttpExceptionPreconditionRequiredMessage => '前提条件が必要です。';

  @override
  String get appHttpExceptionTooManyRequestsMessage => 'リクエストが多すぎます。';

  @override
  String get appHttpExceptionRequestHeaderFieldsTooLargeMessage => 'リクエストヘッダーフィールドが大きすぎます。';

  @override
  String get appHttpExceptionUnavailableForLegalReasonsMessage => '法的な理由で利用できません。';

  @override
  String get appHttpExceptionInternalServerErrorMessage => 'サーバーエラー';

  @override
  String get appHttpExceptionNotImplementedMessage => '実装されていません。';

  @override
  String get appHttpExceptionBadGatewayMessage => '不正なゲートウェイ';

  @override
  String get appHttpExceptionServiceUnavailableMessage => 'サービス利用不可';

  @override
  String get appHttpExceptionGatewayTimeoutMessage => 'ゲートウェイタイムアウト';

  @override
  String get appHttpExceptionHttpVersionNotSupportedMessage => 'HTTPバージョンがサポートされていません。';

  @override
  String get appHttpExceptionVariantAlsoNegotiatesMessage => 'Variant Also Negotiates';

  @override
  String get appHttpExceptionInsufficientStorageMessage => '容量不足です。';

  @override
  String get appHttpExceptionLoopDetectedMessage => 'ループが検出されました。';

  @override
  String get appHttpExceptionNotExtendedMessage => 'Not Extended';

  @override
  String get appHttpExceptionNetworkAuthenticationRequiredMessage => 'ネットワーク認証が必要です。';

  @override
  String appHttpExceptionDefaultMessage(int statusCode) {
    final intl.NumberFormat statusCodeNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String statusCodeString = statusCodeNumberFormat.format(statusCode);

    return '未知のエラー ($statusCodeString)';
  }

  @override
  String get aboutAppTitle => 'このアプリについて';

  @override
  String get appLogListTitle => 'アプリログ';

  @override
  String get devToolsTitle => '開発ツール';

  @override
  String get devToolsCrashReportTest => 'クラッシュレポートテスト';

  @override
  String get localeSettingTitle => '言語';

  @override
  String get localeSettingSystem => 'システム';

  @override
  String get localeSettingEnglish => 'English';

  @override
  String get localeSettingJapanese => '日本語';

  @override
  String get newsArticleListTitle => 'ニュース記事';

  @override
  String get newsHeadlineCategoryGeneral => '一般';

  @override
  String get newsHeadlineCategoryBusiness => 'ビジネス';

  @override
  String get newsHeadlineCategoryEntertainment => 'エンタメ';

  @override
  String get newsHeadlineCategoryHealth => '健康';

  @override
  String get newsHeadlineCategoryScience => '科学';

  @override
  String get newsHeadlineCategorySports => 'スポーツ';

  @override
  String get newsHeadlineCategoryTechnology => 'テクノロジー';

  @override
  String get newsArticleSearchTitle => 'ニュース記事検索';

  @override
  String get newsArticleSearchFormKeywordLabel => 'キーワード';

  @override
  String get newsArticleSearchFormKeywordHint => 'キーワードを入力してください。';

  @override
  String get newsArticleSearchFormKeywordValidateBlank => 'キーワードを入力してください。';

  @override
  String newsArticleSearchFormKeywordValidateTooLong(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'キーワードは$countString文字以内で入力してください。';
  }

  @override
  String get settingTitle => '設定';

  @override
  String get themeSettingTitle => 'テーマ';

  @override
  String get themeSettingSystem => 'システム';

  @override
  String get themeSettingLight => 'ライト';

  @override
  String get themeSettingDark => 'ダーク';
}
