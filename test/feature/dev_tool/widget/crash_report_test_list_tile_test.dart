import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/crash_report_test_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('CrashReportListTile', () {
    testWidgets('leading, titleが表示されること', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: CrashReportListTile(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final leadingFinder =
          find.byKey(const Key('CrashReportListTileLeadingIcon'));
      expect(leadingFinder, findsOneWidget);

      final titleFinder = find.byKey(const Key('CrashReportListTileTitleText'));
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('タップして、onTapが呼ばれること', (tester) async {
      var isCalled = false;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: CrashReportListTile(
                onTap: () {
                  isCalled = true;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CrashReportListTile));
      expect(isCalled, isTrue);
    });
  });
}
