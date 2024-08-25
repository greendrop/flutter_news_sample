import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:flutter_news_sample/widget/scaffold_with_nav_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../support/logger.dart';
import '../support/widget/test_material_app.dart';

void main() {
  group('ScaffoldWithNavBar', () {
    testWidgets('AppNavigationBarが表示されること', (tester) async {
      Uri useAppRouterCurrentUri() => Uri(path: '/');

      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
            ],
            child: TestMaterialApp(
              child: ScaffoldWithNavBar(
                useAppRouterCurrentUri: useAppRouterCurrentUri,
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
}
