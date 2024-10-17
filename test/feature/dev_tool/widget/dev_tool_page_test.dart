import 'package:flutter_news_sample/feature/app_log_list/hook/use_push_app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_crash_report_test.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/crash_report_test_list_tile.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('DevToolPage', () {
    var runnedPushAppLogListPage = false;
    UsePushAppLogListPage buildUsePushAppLogListPage() {
      UsePushAppLogListPageReturn usePushAppLogListPage() {
        Future<void> run() {
          runnedPushAppLogListPage = true;
          return Future.value();
        }

        return (run: run);
      }

      return usePushAppLogListPage;
    }

    var runnedCrashReportTest = false;
    UseCrashReportTest buildUseCrashReportTest() {
      UseCrashReportTestReturn useCrashReportTest() {
        Future<void> run() {
          runnedCrashReportTest = true;
          return Future.value();
        }

        return (run: run);
      }

      return useCrashReportTest;
    }

    testWidgets(
        [
          'ListTileが表示されること',
          'ListTileをタップすると、ページ遷移処理が呼ばれること',
        ].join(', '), (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          TestMaterialApp(
            child: DevToolPage(
              usePushAppLogListPage: buildUsePushAppLogListPage(),
              useCrashReportTest: buildUseCrashReportTest(),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(AppLogListTile), findsOneWidget);
      expect(find.byType(CrashReportListTile), findsOneWidget);

      runnedPushAppLogListPage = false;
      await tester.tap(find.byType(AppLogListTile));
      await tester.pumpAndSettle();
      expect(runnedPushAppLogListPage, isTrue);

      runnedCrashReportTest = false;
      await tester.tap(find.byType(CrashReportListTile));
      await tester.pumpAndSettle();
      expect(runnedCrashReportTest, isTrue);
    });
  });
}
