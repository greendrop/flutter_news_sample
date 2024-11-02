import 'package:flutter_news_sample/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../roboto/news_article_list/news_article_list_page_driver.dart';
import '../roboto/setting/setting_page_driver.dart';
import '../roboto/theme_setting/theme_setting_page_driver.dart';
import '../support/integration_test_widgets.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Theme Setting', () {
    integrationTestWidgets('テーマが設定できること', binding, (tester) async {
      await app.main();

      final newsArticleListPageDriver = NewsArticleListPageDriver(tester);
      await newsArticleListPageDriver.waitUntileVisible();
      await newsArticleListPageDriver.tapSettingNavigationIcon();

      final settingPageDriver = SettingPageDriver(tester);
      await settingPageDriver.waitUntileVisible();
      await settingPageDriver.tapThemeListTile();

      final themeSettingPageDriver = ThemeSettingPageDriver(tester);
      await themeSettingPageDriver.waitUntileVisible();
      await themeSettingPageDriver.tapThemeModeLightRadioListTile();
      await themeSettingPageDriver.tapThemeModeDarkRadioListTile();
      await themeSettingPageDriver.tapThemeModeSystemRadioListTile();
      await themeSettingPageDriver.tapBack();
    });
  });
}
