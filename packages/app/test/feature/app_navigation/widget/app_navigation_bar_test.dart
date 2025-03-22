import 'package:app/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppNavigationBar', () {
    group('selectedIndexが0の場合', () {
      testWidgets(
          [
            'NavigationBarが表示されること',
            'NavigationDestinationが3つ表示されること',
            'NavigationBarのselectedIndexが0であること',
            'アイコンをタップすると、ページ遷移処理が呼ばれること',
          ].join(', '), (tester) async {
        var onDestinationSelectedIndex = 0;

        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: AppNavigationBar(
                selectedIndex: 0,
                onDestinationSelected: (index) {
                  onDestinationSelectedIndex = index;
                },
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(NavigationBar), findsOneWidget);
        expect(find.byType(NavigationDestination), findsNWidgets(3));

        final navigationBar =
            tester.widget<NavigationBar>(find.byType(NavigationBar));
        expect(navigationBar.selectedIndex, 0);

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

        await tester.tap(find.byKey(const ValueKey('SettingNavigationIcon')));
        await tester.pumpAndSettle();
        expect(onDestinationSelectedIndex, 2);
      });
    });

    group('selectedIndexが1の場合', () {
      testWidgets(
          [
            'NavigationBarが表示されること',
            'NavigationDestinationが3つ表示されること',
            'NavigationBarのselectedIndexが1であること',
          ].join(', '), (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: AppNavigationBar(
                selectedIndex: 1,
                onDestinationSelected: (index) {},
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(NavigationBar), findsOneWidget);
        expect(find.byType(NavigationDestination), findsNWidgets(3));

        final navigationBar =
            tester.widget<NavigationBar>(find.byType(NavigationBar));
        expect(navigationBar.selectedIndex, 1);
      });
    });

    group('selectedIndexが2の場合', () {
      testWidgets(
          [
            'NavigationBarが表示されること',
            'NavigationDestinationが3つ表示されること',
            'NavigationBarのselectedIndexが2であること',
          ].join(', '), (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            TestMaterialApp(
              child: AppNavigationBar(
                selectedIndex: 2,
                onDestinationSelected: (index) {},
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(NavigationBar), findsOneWidget);
        expect(find.byType(NavigationDestination), findsNWidgets(3));

        final navigationBar =
            tester.widget<NavigationBar>(find.byType(NavigationBar));
        expect(navigationBar.selectedIndex, 2);
      });
    });
  });
}
