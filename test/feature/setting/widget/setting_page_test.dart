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
    var runnedLocaleSettingPage = false;
    UsePushLocaleSettingPage buildUsePushLocaleSettingPage() {
      UsePushLocaleSettingPageReturn usePushLocaleSettingPage() {
        Future<void> run() {
          runnedLocaleSettingPage = true;
          return Future.value();
        }

        return (run: run);
      }

      return usePushLocaleSettingPage;
    }

    var runnedThemeSettingPage = false;
    UsePushThemeSettingPage buildUsePushThemeSettingPage() {
      UsePushThemeSettingPageReturn usePushThemeSettingPage() {
        Future<void> run() {
          runnedThemeSettingPage = true;
          return Future.value();
        }

        return (run: run);
      }

      return usePushThemeSettingPage;
    }

    var runnedShowAppAboutDialog = false;
    UseShowAppAboutDialog buildUseShowAppAboutDialog() {
      UseShowAppAboutDialogReturn useShowAppAboutDialog() {
        Future<void> run() {
          runnedShowAppAboutDialog = true;
          return Future.value();
        }

        return (run: run);
      }

      return useShowAppAboutDialog;
    }

    var runnedDevToolPage = false;
    UsePushDevToolPage buildUsePushDevToolPage() {
      UsePushDevToolPageReturn usePushDevToolPage() {
        Future<void> run() {
          runnedDevToolPage = true;
          return Future.value();
        }

        return (run: run);
      }

      return usePushDevToolPage;
    }

    group('showDevToolがtrueの場合', () {
      testWidgets(
          [
            'ListTileが表示されること',
            'ListTileをタップすると、ページ遷移処理が呼ばれること',
          ].join(', '), (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: SettingPage(
                usePushLocaleSettingPage: buildUsePushLocaleSettingPage(),
                usePushThemeSettingPage: buildUsePushThemeSettingPage(),
                useShowAppAboutDialog: buildUseShowAppAboutDialog(),
                usePushDevToolPage: buildUsePushDevToolPage(),
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

        runnedLocaleSettingPage = false;
        await tester.tap(find.byType(LocaleListTile));
        await tester.pumpAndSettle();
        expect(runnedLocaleSettingPage, isTrue);

        runnedThemeSettingPage = false;
        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
        expect(runnedThemeSettingPage, isTrue);

        runnedShowAppAboutDialog = false;
        await tester.tap(find.byType(AppAboutListTile));
        await tester.pumpAndSettle();
        expect(runnedShowAppAboutDialog, isTrue);

        runnedDevToolPage = false;
        await tester.tap(find.byType(DevToolListTile));
        await tester.pumpAndSettle();
        expect(runnedDevToolPage, isTrue);
      });
    });

    group('showDevToolがfalseの場合', () {
      testWidgets('DevToolListTileが表示されないこと', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: SettingPage(
                usePushLocaleSettingPage: buildUsePushLocaleSettingPage(),
                usePushThemeSettingPage: buildUsePushThemeSettingPage(),
                useShowAppAboutDialog: buildUseShowAppAboutDialog(),
                usePushDevToolPage: buildUsePushDevToolPage(),
                showDevTool: false,
              ),
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
