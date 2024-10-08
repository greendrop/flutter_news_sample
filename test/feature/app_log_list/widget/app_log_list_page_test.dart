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
    UseAppLogFiles buildUseAppLogFiles({
      required AsyncValue<List<AppLogFile>> state,
    }) {
      UseAppLogFilesReturn useAppLogFiles() {
        Future<void> fetch({bool isRefresh = false}) async {}

        return (
          state: state,
          fetch: fetch,
        );
      }

      return useAppLogFiles;
    }

    var runnedPushAppLogDetailPageFilename = '';
    UsePushAppLogDetailPage buildUsePushAppLogDetailPage() {
      UsePushAppLogDetailPageReturn usePushAppLogDetailPage() {
        Future<void> run({required String filename}) {
          runnedPushAppLogDetailPageFilename = filename;
          return Future.value();
        }

        return (run: run);
      }

      return usePushAppLogDetailPage;
    }

    group('ログファイルがある場合', () {
      testWidgets(
          [
            'ログ一覧が表示されること',
            'ログ一覧をタップすると、詳細画面への遷移が呼び出されること',
          ].join(', '), (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              child: TestMaterialApp(
                child: AppLogListPage(
                  useAppLogFiles: buildUseAppLogFiles(
                    state: AsyncValue.data([
                      AppLogFile(path: '/path/to/test1.log'),
                      AppLogFile(path: '/path/to/test2.log'),
                      AppLogFile(path: '/path/to/test3.log'),
                    ]),
                  ),
                  usePushAppLogDetailPage: buildUsePushAppLogDetailPage(),
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

        runnedPushAppLogDetailPageFilename = '';
        await tester
            .tap(find.byKey(const ValueKey('ListTile-/path/to/test2.log')));

        expect(runnedPushAppLogDetailPageFilename, 'test2.log');
      });
    });
  });
}
