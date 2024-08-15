import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogListTile', () {
    testWidgets('leading, titleが表示されること', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: AppLogListTile(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final leadingFinder = find.byKey(const Key('AppLogListTileLeadingIcon'));
      expect(leadingFinder, findsOneWidget);

      final titleFinder = find.byKey(const Key('AppLogListTileTitleText'));
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('タップして、onTapが呼ばれること', (tester) async {
      var isCalled = false;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: AppLogListTile(
                onTap: () {
                  isCalled = true;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(AppLogListTile));
      expect(isCalled, isTrue);
    });
  });
}
