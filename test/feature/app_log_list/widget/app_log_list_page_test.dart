import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_log_list/entity/app_log_file.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_app_log_files.dart';
import 'package:flutter_news_sample/feature/app_log_list/widget/app_log_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogListPage', () {
    testWidgets(
        [
          'ログ一覧が表示されること',
          'ログ一覧をタップすると、詳細画面への遷移が呼び出されること',
        ].join(', '), (tester) async {
      var tappedFilename = '';

      UseAppLogFilesReturn useMockAppLogFiles() {
        final state = AsyncValue.data([
          AppLogFile(path: '/path/to/test1.log'),
          AppLogFile(path: '/path/to/test2.log'),
          AppLogFile(path: '/path/to/test3.log'),
        ]);

        Future<void> fetch({bool isRefresh = false}) async {}

        return (
          state: state,
          fetch: fetch,
        );
      }

      UsePushAppLogDetailPageReturn useMockPushAppLogDetailPage() {
        Future<void> run({required String filename}) {
          tappedFilename = filename;
          return Future.value();
        }

        return (run: run);
      }

      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: AppLogListPage(
                useAppLogFiles: useMockAppLogFiles,
                usePushAppLogDetailPage: useMockPushAppLogDetailPage,
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(
        find.byKey(const ValueKey('ListTile-/path/to/test1.log')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('ListTile-/path/to/test2.log')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('ListTile-/path/to/test3.log')),
        findsOneWidget,
      );

      await tester
          .tap(find.byKey(const ValueKey('ListTile-/path/to/test2.log')));

      expect(tappedFilename, 'test2.log');
    });
  });
}
