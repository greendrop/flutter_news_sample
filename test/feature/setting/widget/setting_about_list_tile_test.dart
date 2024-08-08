import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/package_info/hook/use_package_info.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_about_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('SettingAboutListTile', () {
    testWidgets('AboutListTileが表示されること', (tester) async {
      final packageInfo = PackageInfo(
        appName: 'appName',
        packageName: 'packageName',
        version: 'version',
        buildNumber: 'buildNumber',
        buildSignature: 'buildSignature',
      );

      UsePackageInfoReturn useMockPackageInfo() {
        final state = AsyncValue<PackageInfo>.data(packageInfo);
        AsyncValue<PackageInfo> refresh() {
          return AsyncValue.data(packageInfo);
        }

        return (state: state, refresh: refresh);
      }

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: SettingAboutListTile(
                usePackageInfo: useMockPackageInfo,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final aboutListTileFinder = find.byType(AboutListTile);
      expect(aboutListTileFinder, findsOneWidget);

      final aboutListTile =
          aboutListTileFinder.evaluate().first.widget as AboutListTile;
      expect(aboutListTile.applicationName, packageInfo.appName);
      expect(aboutListTile.applicationVersion, packageInfo.version);
    });
  });
}
