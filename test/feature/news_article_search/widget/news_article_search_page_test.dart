import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_search_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleSearchPage', () {
    testWidgets('初期表示でデータがないメッセージが表示されること', (tester) async {
      await tester.pumpWidget(
        const TestMaterialApp(
          child: Scaffold(
            body: NewsArticleSearchPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('データがありません。'), findsOneWidget);
    });

    testWidgets(
      [
        'useNewsArticles#stateが存在する場合、NewsArticleGridItemが表示されること',
        // ignore: lines_longer_than_80_chars
        'NewsArticleGridItemをタップした場合、usePushNewsArticleSearchDetailPage#runが呼ばれること',
      ].join(', '),
      (tester) async {
        UseNewsArticlesReturn useNewsArticles() {
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
            required String keyword,
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
        UsePushNewsArticleSearchDetailPageReturn
            usePushNewsArticleSearchDetailPage() {
          void run({required String title, required String url}) {
            isCalled = true;
          }

          return (run: run);
        }

        await tester.pumpWidget(
          TestMaterialApp(
            child: Scaffold(
              body: NewsArticleSearchPage(
                useNewsArticles: useNewsArticles,
                usePushNewsArticleSearchDetailPage:
                    usePushNewsArticleSearchDetailPage,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(NewsArticleGridItem), findsExactly(3));

        await tester.tap(find.byType(NewsArticleGridItem).first);
        await tester.pumpAndSettle();

        expect(isCalled, true);
      },
    );

    testWidgets(
      'NewsArticleSearchFormでキーワードを入力し検索をタップした場合、useNewsArticles#fetchが呼ばれること',
      (tester) async {
        var isCalledFetch = false;
        UseNewsArticlesReturn useNewsArticles() {
          final state = AsyncValue.data(
            NewsArticles(
              items: [],
            ),
          );

          Future<void> fetch({
            required String keyword,
            bool isRefresh = false,
          }) async {
            isCalledFetch = true;
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
              body: NewsArticleSearchPage(
                useNewsArticles: useNewsArticles,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final keywordTextFieldFinder = find.descendant(
          of: find.byKey(const Key('NewsArticleSearchFormKeywordTextField')),
          matching: find.byType(TextField),
        );

        await tester.enterText(keywordTextFieldFinder, 'keyword');
        await tester.pumpAndSettle();

        await tester
            .tap(find.byKey(const Key('NewsArticleSearchFormSubmitButton')));
        await tester.pumpAndSettle();

        expect(isCalledFetch, true);
      },
    );
  });
}
