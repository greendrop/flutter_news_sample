import 'package:app/config/l10n/l10n_ja.g.dart';
import 'package:app/exception/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppException', () {
    group('.fromException', () {
      group('引数がnull', () {
        test('AppExceptionのインスタンスが返ること', () {
          final result = AppException.fromException(null);

          expect(result, isA<AppException>());
        });
      });

      group('引数がAppExceptionインスタンス', () {
        test('引数のAppExceptionインスタンスが返ること', () {
          final appException = AppException();
          final result = AppException.fromException(appException);

          expect(result, appException);
        });
      });

      group('引数がAppException以外のException', () {
        test('AppExceptionでラップされた例外が返ること', () {
          final exception = Exception('Test exception');
          final result = AppException.fromException(exception);

          expect(result.parentException, exception);
        });
      });
    });

    group('#message', () {
      test('メッセージが返ること', () {
        final appException = AppException();

        expect(appException.message, 'An error has occurred.');
      });
    });

    group('#messageByL10n', () {
      test('翻訳されたメッセージが返ること', () {
        final l10n = L10nJa();
        expect(AppException().messageByL10n(l10n), 'エラーが発生しました。');
      });
    });
  });
}
