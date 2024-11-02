import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_rail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppNavigationRail', () {
    group('selectedIndexが0の場合', () {
      testWidgets(
          [
            'NavigationRailが表示されること',
            'NavigationRailDestinationが3つ表示されること',
            'NavigationRailのselectedIndexが0であること',
            'アイコンをタップすると、ページ遷移処理が呼ばれること',
          ].join(', '), (tester) async {
        var onDestinationSelectedIndex = 0;
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: AppNavigationRail(
                selectedIndex: 0,
                onDestinationSelected: (index) {
                  onDestinationSelectedIndex = index;
                },
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(NavigationRail), findsOneWidget);

        final navigationRail =
            tester.widget<NavigationRail>(find.byType(NavigationRail));
        expect(navigationRail.destinations.length, 3);
        expect(navigationRail.selectedIndex, 0);

        await tester.tap(
          find.byKey(const ValueKey('NewsArticlesNavigationIcon')),
        );
        await tester.pumpAndSettle();
        expect(onDestinationSelectedIndex, 0);

        await tester.tap(
          find.byKey(const ValueKey('NewsArticlesSearchNavigationIcon')),
        );
        await tester.pumpAndSettle();
        expect(onDestinationSelectedIndex, 1);

        await tester.tap(
          find.byKey(const ValueKey('SettingNavigationIcon')),
        );
        await tester.pumpAndSettle();
        expect(onDestinationSelectedIndex, 2);
      });
    });

    group('selectedIndexが1の場合', () {
      testWidgets(
          [
            'NavigationRailが表示されること',
            'NavigationRailDestinationが3つ表示されること',
            'NavigationRailのselectedIndexが1であること',
          ].join(', '), (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: AppNavigationRail(
                selectedIndex: 1,
                onDestinationSelected: (index) {},
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(NavigationRail), findsOneWidget);

        final navigationRail =
            tester.widget<NavigationRail>(find.byType(NavigationRail));
        expect(navigationRail.destinations.length, 3);
        expect(navigationRail.selectedIndex, 1);
      });
    });

    group('selectedIndexが2の場合', () {
      testWidgets(
          [
            'NavigationRailが表示されること',
            'NavigationRailDestinationが3つ表示されること',
            'NavigationRailのselectedIndexが2であること',
          ].join(', '), (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: AppNavigationRail(
                selectedIndex: 2,
                onDestinationSelected: (index) {},
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(NavigationRail), findsOneWidget);

        final navigationRail =
            tester.widget<NavigationRail>(find.byType(NavigationRail));
        expect(navigationRail.destinations.length, 3);
        expect(navigationRail.selectedIndex, 2);
      });
    });
  });
}
