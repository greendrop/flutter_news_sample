import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('DevToolPage', () {
    testWidgets('ListTileが表示されること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
            ],
            child: const TestMaterialApp(
              child: DevToolPage(),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(AppLogListTile), findsOneWidget);
    });
  });
}
