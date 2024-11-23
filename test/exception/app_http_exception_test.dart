import 'package:flutter_gen/gen_l10n/l10n_ja.dart';
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

    group('messageByL10n', () {
      test('statusCodeに対応した翻訳されたメッセージが返ること', () {
        final l10n = L10nJa();

        expect(
          AppHttpException(statusCode: 400, body: '400').messageByL10n(l10n),
          'リクエストが不正です。',
        );
        expect(
          AppHttpException(statusCode: 401, body: '401').messageByL10n(l10n),
          '認証が必要です。',
        );
        expect(
          AppHttpException(statusCode: 402, body: '402').messageByL10n(l10n),
          '支払いが必要です。',
        );
        expect(
          AppHttpException(statusCode: 403, body: '403').messageByL10n(l10n),
          'アクセスが禁止されています。',
        );
        expect(
          AppHttpException(statusCode: 404, body: '404').messageByL10n(l10n),
          'リソースが見つかりません。',
        );
        expect(
          AppHttpException(statusCode: 405, body: '405').messageByL10n(l10n),
          'メソッドが許可されていません。',
        );
        expect(
          AppHttpException(statusCode: 406, body: '406').messageByL10n(l10n),
          '受理できません。',
        );
        expect(
          AppHttpException(statusCode: 407, body: '407').messageByL10n(l10n),
          'プロキシ認証が必要です。',
        );
        expect(
          AppHttpException(statusCode: 408, body: '408').messageByL10n(l10n),
          'リクエストがタイムアウトしました。',
        );
        expect(
          AppHttpException(statusCode: 409, body: '409').messageByL10n(l10n),
          '競合が発生しました。',
        );
        expect(
          AppHttpException(statusCode: 410, body: '410').messageByL10n(l10n),
          'リソースが存在しません。',
        );
        expect(
          AppHttpException(statusCode: 411, body: '411').messageByL10n(l10n),
          '長さが必要です。',
        );
        expect(
          AppHttpException(statusCode: 412, body: '412').messageByL10n(l10n),
          '前提条件が失敗しました。',
        );
        expect(
          AppHttpException(statusCode: 413, body: '413').messageByL10n(l10n),
          'ペイロードが大きすぎます。',
        );
        expect(
          AppHttpException(statusCode: 414, body: '414').messageByL10n(l10n),
          'URIが長すぎます。',
        );
        expect(
          AppHttpException(statusCode: 415, body: '415').messageByL10n(l10n),
          'サポートされていないメディアタイプです。',
        );
        expect(
          AppHttpException(statusCode: 416, body: '416').messageByL10n(l10n),
          '範囲が満たされていません。',
        );
        expect(
          AppHttpException(statusCode: 417, body: '417').messageByL10n(l10n),
          '期待が失敗しました。',
        );
        expect(
          AppHttpException(statusCode: 418, body: '418').messageByL10n(l10n),
          '私はティーポットです。',
        );
        expect(
          AppHttpException(statusCode: 421, body: '421').messageByL10n(l10n),
          '誤ったリクエストです。',
        );
        expect(
          AppHttpException(statusCode: 422, body: '422').messageByL10n(l10n),
          '処理できません。',
        );
        expect(
          AppHttpException(statusCode: 423, body: '423').messageByL10n(l10n),
          'ロックされています。',
        );
        expect(
          AppHttpException(statusCode: 424, body: '424').messageByL10n(l10n),
          '依存関係が失敗しました。',
        );
        expect(
          AppHttpException(statusCode: 425, body: '425').messageByL10n(l10n),
          '早すぎます。',
        );
        expect(
          AppHttpException(statusCode: 426, body: '426').messageByL10n(l10n),
          'アップグレードが必要です。',
        );
        expect(
          AppHttpException(statusCode: 428, body: '428').messageByL10n(l10n),
          '前提条件が必要です。',
        );
        expect(
          AppHttpException(statusCode: 429, body: '429').messageByL10n(l10n),
          'リクエストが多すぎます。',
        );
        expect(
          AppHttpException(statusCode: 431, body: '431').messageByL10n(l10n),
          'リクエストヘッダーフィールドが大きすぎます。',
        );
        expect(
          AppHttpException(statusCode: 451, body: '451').messageByL10n(l10n),
          '法的な理由で利用できません。',
        );
        expect(
          AppHttpException(statusCode: 500, body: '500').messageByL10n(l10n),
          'サーバーエラー',
        );
        expect(
          AppHttpException(statusCode: 501, body: '501').messageByL10n(l10n),
          '実装されていません。',
        );
        expect(
          AppHttpException(statusCode: 502, body: '502').messageByL10n(l10n),
          '不正なゲートウェイ',
        );
        expect(
          AppHttpException(statusCode: 503, body: '503').messageByL10n(l10n),
          'サービス利用不可',
        );
        expect(
          AppHttpException(statusCode: 504, body: '504').messageByL10n(l10n),
          'ゲートウェイタイムアウト',
        );
        expect(
          AppHttpException(statusCode: 505, body: '505').messageByL10n(l10n),
          'HTTPバージョンがサポートされていません。',
        );
        expect(
          AppHttpException(statusCode: 506, body: '506').messageByL10n(l10n),
          'Variant Also Negotiates',
        );
        expect(
          AppHttpException(statusCode: 507, body: '507').messageByL10n(l10n),
          '容量不足です。',
        );
        expect(
          AppHttpException(statusCode: 508, body: '508').messageByL10n(l10n),
          'ループが検出されました。',
        );
        expect(
          AppHttpException(statusCode: 510, body: '510').messageByL10n(l10n),
          'Not Extended',
        );
        expect(
          AppHttpException(statusCode: 511, body: '511').messageByL10n(l10n),
          'ネットワーク認証が必要です。',
        );
        expect(
          AppHttpException(statusCode: 599, body: '599').messageByL10n(l10n),
          '未知のエラー (599)',
        );
      });
    });
  });
}
