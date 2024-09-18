import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/package_info/hook/use_package_info.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_show_app_about_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('useShowAppAboutDialog', () {
    group('#run', () {
      testWidgets('AboutDialogが表示されること', (tester) async {
        late UsePackageInfoReturn packageInfo;
        late UseShowAppAboutDialogReturn showAppAboutDialog;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                packageInfo = usePackageInfo();
                showAppAboutDialog = useShowAppAboutDialog();
                return Container();
              },
            ),
          ),
        );

        PackageInfo.setMockInitialValues(
          appName: 'appName',
          packageName: 'packageName',
          version: 'version',
          buildNumber: 'buildNumber',
          buildSignature: 'buildSignature',
        );

        await packageInfo.initialize();
        await tester.pumpAndSettle();

        showAppAboutDialog.run();
        await tester.pumpAndSettle();

        expect(find.byType(AboutDialog), findsOneWidget);
      });
    });
  });
}
