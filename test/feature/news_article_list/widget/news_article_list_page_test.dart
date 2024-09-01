import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_list/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/widget/news_article_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleListPage', () {
    group('useNewsArticles#state.itemsが1件以上', () {
      testWidgets(
          [
            'TabBar,TabBarViewが表示されること',
            'NewsArticleGridItemが表示されること',
            // ignore: lines_longer_than_80_chars
            'NewsArticleGridItemをタップした場合、usePushNewsArticleDetailPage#runが呼ばれること',
          ].join(', '), (tester) async {
        UseNewsArticlesReturn useNewsArticles({required String category}) {
          final state = AsyncValue.data(
            NewsArticles(
              items: [
                NewsArticle(
                  title: 'title1',
                  url: 'https://example.com',
                ),
                NewsArticle(
                  title: 'title2',
                  url: 'https://example.com',
                ),
                NewsArticle(
                  title: 'title3',
                  url: 'https://example.com',
                ),
              ],
            ),
          );

          Future<void> fetch({
            bool isRefresh = false,
          }) async {
            return Future.value();
          }

          Future<void> fetchMore() async {
            return Future.value();
          }

          return (
            state: state,
            fetch: fetch,
            fetchMore: fetchMore,
          );
        }

        var isCalled = false;
        UsePushNewsArticleDetailPageReturn usePushNewsArticleDetailPage() {
          Future<void> run({required String title, required String url}) {
            isCalled = true;
            return Future.value();
          }

          return (run: run);
        }

        await tester.pumpWidget(
          TestMaterialApp(
            child: Scaffold(
              body: NewsArticleListPage(
                useNewsArticles: useNewsArticles,
                usePushNewsArticleDetailPage: usePushNewsArticleDetailPage,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final tabBarFinder = find.byType(TabBar);
        expect(tabBarFinder, findsOneWidget);
        final tabBar = tabBarFinder.evaluate().first.widget as TabBar;
        expect(tabBar.tabs.length, 7);
        expect(tabBar.controller!.index, 0);
        expect(find.byType(TabBarView), findsOneWidget);
        expect(find.byType(NewsArticleGridItem), findsExactly(3));

        await tester.tap(find.byType(NewsArticleGridItem).first);
        await tester.pumpAndSettle();
        expect(isCalled, true);
      });
    });

    group('useNewsArticles#state.itemsが0件', () {
      testWidgets(
          [
            'TabBar,TabBarViewが表示されること',
            'NewsArticleGridItemが表示されないこと',
            'データがないメッセージが表示されること',
          ].join(', '), (tester) async {
        UseNewsArticlesReturn useNewsArticles({required String category}) {
          final state = AsyncValue.data(
            NewsArticles(
              items: [],
            ),
          );

          Future<void> fetch({
            bool isRefresh = false,
          }) async {
            return Future.value();
          }

          Future<void> fetchMore() async {
            return Future.value();
          }

          return (
            state: state,
            fetch: fetch,
            fetchMore: fetchMore,
          );
        }

        await tester.pumpWidget(
          TestMaterialApp(
            child: Scaffold(
              body: NewsArticleListPage(
                useNewsArticles: useNewsArticles,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final tabBarFinder = find.byType(TabBar);
        expect(tabBarFinder, findsOneWidget);
        final tabBar = tabBarFinder.evaluate().first.widget as TabBar;
        expect(tabBar.tabs.length, 7);
        expect(tabBar.controller!.index, 0);
        expect(find.byType(TabBarView), findsOneWidget);
        expect(find.byType(NewsArticleGridItem), findsNothing);
        expect(find.text('データがありません。'), findsOneWidget);
      });
    });
  });
}
