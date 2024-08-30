import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_rail.dart';
import 'package:flutter_news_sample/widget/scaffold_with_nav_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/widget/test_material_app.dart';

void main() {
  group('ScaffoldWithNavBar', () {
    group('縦向きの場合', () {
      testWidgets('AppNavigationBarが表示されること', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            MediaQuery(
              data: const MediaQueryData(size: Size(320, 640)),
              child: TestMaterialApp(
                child: ScaffoldWithNavBar(
                  currentIndex: 0,
                  onDestinationSelected: (index) {},
                  child: Container(),
                ),
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(AppNavigationBar), findsOneWidget);
      });
    });

    group('横向きの場合', () {
      testWidgets('AppNavigationRailが表示されること', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            MediaQuery(
              data: const MediaQueryData(size: Size(640, 320)),
              child: TestMaterialApp(
                child: ScaffoldWithNavBar(
                  currentIndex: 0,
                  onDestinationSelected: (index) {},
                  child: Container(),
                ),
              ),
            ),
          );
        });
        await tester.pumpAndSettle();

        expect(find.byType(AppNavigationRail), findsOneWidget);
      });
    });
  });
}
