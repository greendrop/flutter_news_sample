import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_about_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_page.dart';
import 'package:flutter_news_sample/feature/setting/widget/theme_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('SettingPage', () {
    testWidgets('ListTileが表示されること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
            ],
            child: const TestMaterialApp(
              child: SettingPage(),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(LocaleListTile), findsOneWidget);
      expect(find.byType(ThemeListTile), findsOneWidget);
      expect(find.byType(SettingAboutListTile), findsOneWidget);
    });
  });
}
