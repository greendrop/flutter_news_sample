import 'package:flutter_news_sample/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_show_app_about_dialog.dart';
import 'package:flutter_news_sample/feature/setting/widget/app_about_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/dev_tool_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_page.dart';
import 'package:flutter_news_sample/feature/setting/widget/theme_list_tile.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_push_theme_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('SettingPage', () {
    group('showDevToolがtrue', () {
      testWidgets(
          [
            'ListTileが表示されること',
            'ListTileをタップすると、ページ遷移処理が呼ばれること',
          ].join(', '), (tester) async {
        var isTappedLocaleSettingPage = false;
        var isTappedThemeSettingPage = false;
        var isTappedShowAppAboutDialog = false;
        var isTappedDevToolPage = false;
        UsePushLocaleSettingPageReturn usePushLocaleSettingPage() {
          Future<void> run() {
            isTappedLocaleSettingPage = true;
            return Future.value();
          }

          return (run: run);
        }

        UsePushThemeSettingPageReturn usePushThemeSettingPage() {
          Future<void> run() {
            isTappedThemeSettingPage = true;
            return Future.value();
          }

          return (run: run);
        }

        UseShowAppAboutDialogReturn useShowAppAboutDialoge() {
          Future<void> run() {
            isTappedShowAppAboutDialog = true;
            return Future.value();
          }

          return (run: run);
        }

        UsePushDevToolPageReturn usePushDevToolPage() {
          Future<void> run() {
            isTappedDevToolPage = true;
            return Future.value();
          }

          return (run: run);
        }

        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: SettingPage(
                usePushLocaleSettingPage: usePushLocaleSettingPage,
                usePushThemeSettingPage: usePushThemeSettingPage,
                useShowAppAboutDialog: useShowAppAboutDialoge,
                usePushDevToolPage: usePushDevToolPage,
                showDevTool: true,
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(LocaleListTile), findsOneWidget);
        expect(find.byType(ThemeListTile), findsOneWidget);
        expect(find.byType(AppAboutListTile), findsOneWidget);
        expect(find.byType(DevToolListTile), findsOneWidget);

        await tester.tap(find.byType(LocaleListTile));
        await tester.pumpAndSettle();
        expect(isTappedLocaleSettingPage, isTrue);

        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
        expect(isTappedThemeSettingPage, isTrue);

        await tester.tap(find.byType(AppAboutListTile));
        await tester.pumpAndSettle();
        expect(isTappedShowAppAboutDialog, isTrue);

        await tester.tap(find.byType(DevToolListTile));
        await tester.pumpAndSettle();
        expect(isTappedDevToolPage, isTrue);
      });
    });

    group('showDevToolがfalse', () {
      testWidgets('DevToolListTileが表示されないこと', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: SettingPage(showDevTool: false),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(LocaleListTile), findsOneWidget);
        expect(find.byType(ThemeListTile), findsOneWidget);
        expect(find.byType(AppAboutListTile), findsOneWidget);
        expect(find.byType(DevToolListTile), findsNothing);
      });
    });
  });
}
