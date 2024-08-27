import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_go_news_article_list_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_go_news_article_search_page.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppNavigationBar', () {
    group('currentUriが`/news_articles`の場合', () {
      testWidgets(
          [
            'NewsArticlesNavigationDestinationが選択されること',
            'NavigationDestinationをタップすると、ページ遷移処理が呼ばれること',
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
            TestMaterialApp(
              child: AppNavigationBar(
                useAppRouterCurrentUri: useAppRouterCurrentUri,
                useGoNewsArticleListPage: useGoNewsArticleListPage,
                useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
                useGoSettingPage: useGoSettingPage,
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
          find.byKey(const ValueKey('NewsArticlesNavigationDestination')),
        );
        await tester.pumpAndSettle();
        expect(isTappedNewsArticleListPage, isTrue);

        await tester.tap(
          find.byKey(const ValueKey('NewsArticlesSearchNavigationDestination')),
        );
        await tester.pumpAndSettle();
        expect(isTappedNewswArticleSearchPage, isTrue);

        await tester
            .tap(find.byKey(const ValueKey('SettingNavigationDestination')));
        await tester.pumpAndSettle();
        expect(isTappedSettingPage, isTrue);
      });
    });

    group('currentUriが`/news_articles_search`の場合', () {
      testWidgets('NewsArticlesSearchNavigationDestinationが選択されること',
          (tester) async {
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
            TestMaterialApp(
              child: AppNavigationBar(
                useAppRouterCurrentUri: useAppRouterCurrentUri,
                useGoNewsArticleListPage: useGoNewsArticleListPage,
                useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
                useGoSettingPage: useGoSettingPage,
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

    group('currentUriが`/setting`の場合', () {
      testWidgets('SettingNavigationDestinationが選択されること', (tester) async {
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
            TestMaterialApp(
              child: AppNavigationBar(
                useAppRouterCurrentUri: useAppRouterCurrentUri,
                useGoNewsArticleListPage: useGoNewsArticleListPage,
                useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
                useGoSettingPage: useGoSettingPage,
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
