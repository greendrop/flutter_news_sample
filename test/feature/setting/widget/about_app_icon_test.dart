import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/about_app_icon.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AboutAppIcon', () {
    testWidgets('Iconが表示されること', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: AboutAppIcon(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('AboutAppIconContainer')), findsOneWidget);
    });
  });
}
