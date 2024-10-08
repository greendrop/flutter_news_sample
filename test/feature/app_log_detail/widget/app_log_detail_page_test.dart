import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogDetailPage', () {
    UseAppLogFileContent buildUseAppLogFileContent({
      required AsyncValue<String> state,
    }) {
      UseAppLogFileContentReturn useAppLogFileContent({
        required String filename,
      }) {
        Future<void> fetch() async {}

        return (
          state: state,
          fetch: fetch,
        );
      }

      return useAppLogFileContent;
    }

    group('ログファイル内容がある場合', () {
      testWidgets('内容が表示されること', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              child: TestMaterialApp(
                child: AppLogDetailPage(
                  filename: 'test.log',
                  useAppLogFileContent: buildUseAppLogFileContent(
                    state: AsyncValue.data(
                      List.generate(3, (index) => 'dummy$index').join('\n'),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(ListTile), findsNWidgets(3));
      });
    });

    group('ログファイル内容がない場合', () {
      testWidgets('データがないことが表示されること', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              child: TestMaterialApp(
                child: AppLogDetailPage(
                  filename: 'test.log',
                  useAppLogFileContent: buildUseAppLogFileContent(
                    state: AsyncValue.data(''),
                  ),
                ),
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.text('データがありません。'), findsOneWidget);
      });
    });

    group('ログファイルが読み込み中の場合', () {
      testWidgets('読み込み中が表示されること', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              child: TestMaterialApp(
                child: AppLogDetailPage(
                  filename: 'test.log',
                  useAppLogFileContent: buildUseAppLogFileContent(
                    state: AsyncValue.loading(),
                  ),
                  stopLoadingIndicator: true,
                ),
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });
  });
}
