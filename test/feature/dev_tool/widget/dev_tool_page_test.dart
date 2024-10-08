import 'package:flutter_news_sample/feature/app_log_list/hook/use_push_app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
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
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(AppLogListTile), findsOneWidget);

      runnedPushAppLogListPage = false;
      await tester.tap(find.byType(AppLogListTile));
      await tester.pumpAndSettle();
      expect(runnedPushAppLogListPage, isTrue);
    });
  });
}
