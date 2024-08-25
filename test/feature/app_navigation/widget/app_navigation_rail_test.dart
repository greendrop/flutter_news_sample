import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_rail.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_go_news_article_list_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_go_news_article_search_page.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppNavigationRail', () {
    group('currentUriが`/news_articles`の場合', () {
      testWidgets(
          [
            '/news_articlesのindexが選択されること',
            'NavigationRailDestinationをタップすると、ページ遷移処理が呼ばれること',
          ].join(', '), (tester) async {
        Uri useAppRouterCurrentUri() => Uri(path: '/news_articles');
        var isTappedNewsArticleListPage = false;
        var isTappedNewswArticleSearchPage = false;
        var isTappedSettingPage = false;
        UseGoNewsArticleListPageReturn useGoNewsArticleListPage() {
          void run() {
            isTappedNewsArticleListPage = true;
          }

          return (run: run);
        }

        UseGoNewsArticleSearchPageReturn useGoNewsArticleSearchPage() {
          void run() {
            isTappedNewswArticleSearchPage = true;
          }

          return (run: run);
        }

        UseGoSettingPageReturn useGoSettingPage() {
          void run() {
            isTappedSettingPage = true;
          }

          return (run: run);
        }

        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              ],
              child: TestMaterialApp(
                child: AppNavigationRail(
                  useAppRouterCurrentUri: useAppRouterCurrentUri,
                  useGoNewsArticleListPage: useGoNewsArticleListPage,
                  useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
                  useGoSettingPage: useGoSettingPage,
                ),
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
          find.byKey(
            const ValueKey('NewsArticlesNavigationRailDestinationIcon'),
          ),
        );
        await tester.pumpAndSettle();
        expect(isTappedNewsArticleListPage, isTrue);

        await tester.tap(
          find.byKey(
            const ValueKey('NewsArticlesSearchNavigationRailDestinationIcon'),
          ),
        );
        await tester.pumpAndSettle();
        expect(isTappedNewswArticleSearchPage, isTrue);

        await tester.tap(
          find.byKey(
            const ValueKey('SettingNavigationRailDestinationIcon'),
          ),
        );
        await tester.pumpAndSettle();
        expect(isTappedSettingPage, isTrue);
      });
    });

    group('currentUriが`/news_articles_search`の場合', () {
      testWidgets('/news_articles_searchのindexが選択されること', (tester) async {
        Uri useAppRouterCurrentUri() => Uri(path: '/news_articles_search');
        UseGoNewsArticleListPageReturn useGoNewsArticleListPage() {
          void run() {}
          return (run: run);
        }

        UseGoNewsArticleSearchPageReturn useGoNewsArticleSearchPage() {
          void run() {}
          return (run: run);
        }

        UseGoSettingPageReturn useGoSettingPage() {
          void run() {}
          return (run: run);
        }

        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              ],
              child: TestMaterialApp(
                child: AppNavigationRail(
                  useAppRouterCurrentUri: useAppRouterCurrentUri,
                  useGoNewsArticleListPage: useGoNewsArticleListPage,
                  useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
                  useGoSettingPage: useGoSettingPage,
                ),
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

    group('currentUriが`/setting`の場合', () {
      testWidgets('/settingのindexが選択されること', (tester) async {
        Uri useAppRouterCurrentUri() => Uri(path: '/setting');
        UseGoNewsArticleListPageReturn useGoNewsArticleListPage() {
          void run() {}
          return (run: run);
        }

        UseGoNewsArticleSearchPageReturn useGoNewsArticleSearchPage() {
          void run() {}
          return (run: run);
        }

        UseGoSettingPageReturn useGoSettingPage() {
          void run() {}
          return (run: run);
        }

        await tester.runAsync(() async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              ],
              child: TestMaterialApp(
                child: AppNavigationRail(
                  useAppRouterCurrentUri: useAppRouterCurrentUri,
                  useGoNewsArticleListPage: useGoNewsArticleListPage,
                  useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
                  useGoSettingPage: useGoSettingPage,
                ),
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
