import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/package_info/hook/use_package_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('usePackageInfo', () {
    group('#initialize', () {
      testWidgets('PackageInfoがstateに設定されること', (tester) async {
        late UsePackageInfoReturn packageInfo;
        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                packageInfo = usePackageInfo();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        PackageInfo.setMockInitialValues(
          appName: 'appName',
          packageName: 'packageName',
          version: 'version',
          buildNumber: 'buildNumber',
          buildSignature: 'buildSignature',
        );

        await packageInfo.initialize();
        await tester.pumpAndSettle();

        expect(packageInfo.state?.appName, 'appName');
      });
    });

    group('#refresh', () {
      testWidgets('PackageInfoがstateに設定されること', (tester) async {
        late UsePackageInfoReturn packageInfo;
        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                packageInfo = usePackageInfo();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        PackageInfo.setMockInitialValues(
          appName: 'appName',
          packageName: 'packageName',
          version: 'version',
          buildNumber: 'buildNumber',
          buildSignature: 'buildSignature',
        );

        await packageInfo.refresh();
        await tester.pumpAndSettle();

        expect(packageInfo.state?.appName, 'appName');
      });
    });
  });
}
