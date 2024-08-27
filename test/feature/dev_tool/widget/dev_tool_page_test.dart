import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('DevToolPage', () {
    testWidgets('ListTileが表示されること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          const TestMaterialApp(
            child: DevToolPage(),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(AppLogListTile), findsOneWidget);
    });
  });
}
