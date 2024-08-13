import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('LocaleListTile', () {
    testWidgets('leading, titleが表示されること', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: LocaleListTile(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final leadingFinder = find.byKey(const Key('LocaleListTileLeadingIcon'));
      expect(leadingFinder, findsOneWidget);

      final titleFinder = find.byKey(const Key('LocaleListTileTitleText'));
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('タップして、onTapが呼ばれること', (tester) async {
      var isCalled = false;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: LocaleListTile(
                onTap: () {
                  isCalled = true;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(LocaleListTile));
      expect(isCalled, isTrue);
    });
  });
}
