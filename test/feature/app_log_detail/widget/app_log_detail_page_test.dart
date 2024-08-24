import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogDetailPage', () {
    testWidgets('ログファイルの内容が表示されること', (tester) async {
      UseAppLogFileContentReturn useAppLogFileContent({
        required String filename,
      }) {
        const state = AsyncValue.data('dummy1\ndummy2\ndummy3');

        Future<void> fetch() async {}

        return (
          state: state,
          fetch: fetch,
        );
      }

      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: AppLogDetailPage(
                filename: 'test.log',
                useAppLogFileContent: useAppLogFileContent,
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(3));
    });
  });
}
