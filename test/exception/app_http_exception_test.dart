import 'package:flutter_news_sample/config/i18n/strings.g.dart';
import 'package:flutter_news_sample/exception/app_http_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppHttpException', () {
    group('message', () {
      test('statusCodeに対応したメッセージが返ること', () {
        expect(
          AppHttpException(statusCode: 400, body: '400').message,
          'Bad Request',
        );
        expect(
          AppHttpException(statusCode: 401, body: '401').message,
          'Unauthorized',
        );
        expect(
          AppHttpException(statusCode: 402, body: '402').message,
          'Payment Required',
        );
        expect(
          AppHttpException(statusCode: 403, body: '403').message,
          'Forbidden',
        );
        expect(
          AppHttpException(statusCode: 404, body: '404').message,
          'Not Found',
        );
        expect(
          AppHttpException(statusCode: 405, body: '405').message,
          'Method Not Allowed',
        );
        expect(
          AppHttpException(statusCode: 406, body: '406').message,
          'Not Acceptable',
        );
        expect(
          AppHttpException(statusCode: 407, body: '407').message,
          'Proxy Authentication Required',
        );
        expect(
          AppHttpException(statusCode: 408, body: '408').message,
          'Request Timeout',
        );
        expect(
          AppHttpException(statusCode: 409, body: '409').message,
          'Conflict',
        );
        expect(
          AppHttpException(statusCode: 410, body: '410').message,
          'Gone',
        );
        expect(
          AppHttpException(statusCode: 411, body: '411').message,
          'Length Required',
        );
        expect(
          AppHttpException(statusCode: 412, body: '412').message,
          'Precondition Failed',
        );
        expect(
          AppHttpException(statusCode: 413, body: '413').message,
          'Payload Too Large',
        );
        expect(
          AppHttpException(statusCode: 414, body: '414').message,
          'URI Too Long',
        );
        expect(
          AppHttpException(statusCode: 415, body: '415').message,
          'Unsupported Media Type',
        );
        expect(
          AppHttpException(statusCode: 416, body: '416').message,
          'Range Not Satisfiable',
        );
        expect(
          AppHttpException(statusCode: 417, body: '417').message,
          'Expectation Failed',
        );
        expect(
          AppHttpException(statusCode: 418, body: '418').message,
          "I'm a teapot",
        );
        expect(
          AppHttpException(statusCode: 421, body: '421').message,
          'Misdirected Request',
        );
        expect(
          AppHttpException(statusCode: 422, body: '422').message,
          'Unprocessable Entity',
        );
        expect(
          AppHttpException(statusCode: 423, body: '423').message,
          'Locked',
        );
        expect(
          AppHttpException(statusCode: 424, body: '424').message,
          'Failed Dependency',
        );
        expect(
          AppHttpException(statusCode: 425, body: '425').message,
          'Too Early',
        );
        expect(
          AppHttpException(statusCode: 426, body: '426').message,
          'Upgrade Required',
        );
        expect(
          AppHttpException(statusCode: 428, body: '428').message,
          'Precondition Required',
        );
        expect(
          AppHttpException(statusCode: 429, body: '429').message,
          'Too Many Requests',
        );
        expect(
          AppHttpException(statusCode: 431, body: '431').message,
          'Request Header Fields Too Large',
        );
        expect(
          AppHttpException(statusCode: 451, body: '451').message,
          'Unavailable For Legal Reasons',
        );
        expect(
          AppHttpException(statusCode: 500, body: '500').message,
          'Internal Server Error',
        );
        expect(
          AppHttpException(statusCode: 501, body: '501').message,
          'Not Implemented',
        );
        expect(
          AppHttpException(statusCode: 502, body: '502').message,
          'Bad Gateway',
        );
        expect(
          AppHttpException(statusCode: 503, body: '503').message,
          'Service Unavailable',
        );
        expect(
          AppHttpException(statusCode: 504, body: '504').message,
          'Gateway Timeout',
        );
        expect(
          AppHttpException(statusCode: 505, body: '505').message,
          'HTTP Version Not Supported',
        );
        expect(
          AppHttpException(statusCode: 506, body: '506').message,
          'Variant Also Negotiates',
        );
        expect(
          AppHttpException(statusCode: 507, body: '507').message,
          'Insufficient Storage',
        );
        expect(
          AppHttpException(statusCode: 508, body: '508').message,
          'Loop Detected',
        );
        expect(
          AppHttpException(statusCode: 510, body: '510').message,
          'Not Extended',
        );
        expect(
          AppHttpException(statusCode: 511, body: '511').message,
          'Network Authentication Required',
        );
        expect(
          AppHttpException(statusCode: 599, body: '599').message,
          'Unknown (599)',
        );
      });
    });

    group('messageByTranslations', () {
      test('statusCodeに対応した翻訳されたメッセージが返ること', () {
        final translations = AppLocale.ja.translations;

        expect(
          AppHttpException(statusCode: 400, body: '400')
              .messageByTranslations(translations),
          'リクエストが不正です。',
        );
        expect(
          AppHttpException(statusCode: 401, body: '401')
              .messageByTranslations(translations),
          '認証が必要です。',
        );
        expect(
          AppHttpException(statusCode: 402, body: '402')
              .messageByTranslations(translations),
          '支払いが必要です。',
        );
        expect(
          AppHttpException(statusCode: 403, body: '403')
              .messageByTranslations(translations),
          'アクセスが禁止されています。',
        );
        expect(
          AppHttpException(statusCode: 404, body: '404')
              .messageByTranslations(translations),
          'リソースが見つかりません。',
        );
        expect(
          AppHttpException(statusCode: 405, body: '405')
              .messageByTranslations(translations),
          'メソッドが許可されていません。',
        );
        expect(
          AppHttpException(statusCode: 406, body: '406')
              .messageByTranslations(translations),
          '受理できません。',
        );
        expect(
          AppHttpException(statusCode: 407, body: '407')
              .messageByTranslations(translations),
          'プロキシ認証が必要です。',
        );
        expect(
          AppHttpException(statusCode: 408, body: '408')
              .messageByTranslations(translations),
          'リクエストがタイムアウトしました。',
        );
        expect(
          AppHttpException(statusCode: 409, body: '409')
              .messageByTranslations(translations),
          '競合が発生しました。',
        );
        expect(
          AppHttpException(statusCode: 410, body: '410')
              .messageByTranslations(translations),
          'リソースが存在しません。',
        );
        expect(
          AppHttpException(statusCode: 411, body: '411')
              .messageByTranslations(translations),
          '長さが必要です。',
        );
        expect(
          AppHttpException(statusCode: 412, body: '412')
              .messageByTranslations(translations),
          '前提条件が失敗しました。',
        );
        expect(
          AppHttpException(statusCode: 413, body: '413')
              .messageByTranslations(translations),
          'ペイロードが大きすぎます。',
        );
        expect(
          AppHttpException(statusCode: 414, body: '414')
              .messageByTranslations(translations),
          'URIが長すぎます。',
        );
        expect(
          AppHttpException(statusCode: 415, body: '415')
              .messageByTranslations(translations),
          'サポートされていないメディアタイプです。',
        );
        expect(
          AppHttpException(statusCode: 416, body: '416')
              .messageByTranslations(translations),
          '範囲が満たされていません。',
        );
        expect(
          AppHttpException(statusCode: 417, body: '417')
              .messageByTranslations(translations),
          '期待が失敗しました。',
        );
        expect(
          AppHttpException(statusCode: 418, body: '418')
              .messageByTranslations(translations),
          '私はティーポットです。',
        );
        expect(
          AppHttpException(statusCode: 421, body: '421')
              .messageByTranslations(translations),
          '誤ったリクエストです。',
        );
        expect(
          AppHttpException(statusCode: 422, body: '422')
              .messageByTranslations(translations),
          '処理できません。',
        );
        expect(
          AppHttpException(statusCode: 423, body: '423')
              .messageByTranslations(translations),
          'ロックされています。',
        );
        expect(
          AppHttpException(statusCode: 424, body: '424')
              .messageByTranslations(translations),
          '依存関係が失敗しました。',
        );
        expect(
          AppHttpException(statusCode: 425, body: '425')
              .messageByTranslations(translations),
          '早すぎます。',
        );
        expect(
          AppHttpException(statusCode: 426, body: '426')
              .messageByTranslations(translations),
          'アップグレードが必要です。',
        );
        expect(
          AppHttpException(statusCode: 428, body: '428')
              .messageByTranslations(translations),
          '前提条件が必要です。',
        );
        expect(
          AppHttpException(statusCode: 429, body: '429')
              .messageByTranslations(translations),
          'リクエストが多すぎます。',
        );
        expect(
          AppHttpException(statusCode: 431, body: '431')
              .messageByTranslations(translations),
          'リクエストヘッダーフィールドが大きすぎます。',
        );
        expect(
          AppHttpException(statusCode: 451, body: '451')
              .messageByTranslations(translations),
          '法的な理由で利用できません。',
        );
        expect(
          AppHttpException(statusCode: 500, body: '500')
              .messageByTranslations(translations),
          'サーバーエラー',
        );
        expect(
          AppHttpException(statusCode: 501, body: '501')
              .messageByTranslations(translations),
          '実装されていません。',
        );
        expect(
          AppHttpException(statusCode: 502, body: '502')
              .messageByTranslations(translations),
          '不正なゲートウェイ',
        );
        expect(
          AppHttpException(statusCode: 503, body: '503')
              .messageByTranslations(translations),
          'サービス利用不可',
        );
        expect(
          AppHttpException(statusCode: 504, body: '504')
              .messageByTranslations(translations),
          'ゲートウェイタイムアウト',
        );
        expect(
          AppHttpException(statusCode: 505, body: '505')
              .messageByTranslations(translations),
          'HTTPバージョンがサポートされていません。',
        );
        expect(
          AppHttpException(statusCode: 506, body: '506')
              .messageByTranslations(translations),
          'Variant Also Negotiates',
        );
        expect(
          AppHttpException(statusCode: 507, body: '507')
              .messageByTranslations(translations),
          '容量不足です。',
        );
        expect(
          AppHttpException(statusCode: 508, body: '508')
              .messageByTranslations(translations),
          'ループが検出されました。',
        );
        expect(
          AppHttpException(statusCode: 510, body: '510')
              .messageByTranslations(translations),
          'Not Extended',
        );
        expect(
          AppHttpException(statusCode: 511, body: '511')
              .messageByTranslations(translations),
          'ネットワーク認証が必要です。',
        );
        expect(
          AppHttpException(statusCode: 599, body: '599')
              .messageByTranslations(translations),
          '未知のエラー (599)',
        );
      });
    });
  });
}
