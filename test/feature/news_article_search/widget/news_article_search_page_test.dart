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
    var fetchedNewsArticles = false;
    UseNewsArticles buildUseNewsArticles({
      required AsyncValue<NewsArticles> state,
    }) {
      UseNewsArticlesReturn useNewsArticles() {
        Future<void> fetch({
          required String keyword,
          bool isRefresh = false,
        }) async {
          fetchedNewsArticles = true;
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

      return useNewsArticles;
    }

    var runnedPushNewsArticleDetailPage = false;
    UsePushNewsArticleSearchDetailPage
        buildUsePushNewsArticleSearchDetailPage() {
      UsePushNewsArticleSearchDetailPageReturn
          usePushNewsArticleSearchDetailPage() {
        Future<void> run({required String title, required String url}) {
          runnedPushNewsArticleDetailPage = true;
          return Future.value();
        }

        return (run: run);
      }

      return usePushNewsArticleSearchDetailPage;
    }

    group('useNewsArticles#state.itemsが0件', () {
      testWidgets('データがないメッセージが表示されること', (tester) async {
        final state = AsyncValue.data(
          NewsArticles(
            items: [],
          ),
        );

        await tester.pumpWidget(
          TestMaterialApp(
            child: Scaffold(
              body: NewsArticleSearchPage(
                useNewsArticles: buildUseNewsArticles(state: state),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('データがありません。'), findsOneWidget);
      });
    });

    group('useNewsArticles#state.itemsが1件以上', () {
      testWidgets(
        [
          'NewsArticleGridItemが表示されること',
          // ignore: lines_longer_than_80_chars
          'NewsArticleGridItemをタップし、usePushNewsArticleSearchDetailPage#runが呼ばれること',
        ].join(', '),
        (tester) async {
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

          await tester.pumpWidget(
            TestMaterialApp(
              child: Scaffold(
                body: NewsArticleSearchPage(
                  useNewsArticles: buildUseNewsArticles(state: state),
                  usePushNewsArticleSearchDetailPage:
                      buildUsePushNewsArticleSearchDetailPage(),
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          expect(find.byType(NewsArticleGridItem), findsExactly(3));

          runnedPushNewsArticleDetailPage = false;
          await tester.tap(find.byType(NewsArticleGridItem).first);
          await tester.pumpAndSettle();

          expect(runnedPushNewsArticleDetailPage, true);
        },
      );
    });

    group('useNewsArticles#state.itemsが読込中', () {
      testWidgets(
        [
          'NewsArticleGridItemが表示されないこと',
          '読み込み中が表示されること',
        ].join(', '),
        (tester) async {
          final state = AsyncValue<NewsArticles>.loading();

          await tester.pumpWidget(
            TestMaterialApp(
              child: Scaffold(
                body: NewsArticleSearchPage(
                  useNewsArticles: buildUseNewsArticles(state: state),
                  stopLoadingIndicator: true,
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          expect(find.byType(NewsArticleGridItem), findsNothing);
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );
    });

    group('初期表示', () {
      testWidgets(
        'データがないメッセージが表示されること',
        (tester) async {
          await tester.pumpWidget(
            const TestMaterialApp(
              child: Scaffold(
                body: NewsArticleSearchPage(),
              ),
            ),
          );
          await tester.pumpAndSettle();

          expect(find.text('データがありません。'), findsOneWidget);
        },
      );
    });

    group('NewsArticleSearchFormでキーワードを入力し検索をタップ', () {
      testWidgets(
        'useNewsArticles#fetchが呼ばれること',
        (tester) async {
          final state = AsyncValue.data(
            NewsArticles(
              items: [],
            ),
          );
          fetchedNewsArticles = false;

          await tester.pumpWidget(
            TestMaterialApp(
              child: Scaffold(
                body: NewsArticleSearchPage(
                  useNewsArticles: buildUseNewsArticles(state: state),
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

          fetchedNewsArticles = false;
          await tester
              .tap(find.byKey(const Key('NewsArticleSearchFormSubmitButton')));
          await tester.pumpAndSettle();

          expect(fetchedNewsArticles, true);
        },
      );
    });
  });
}
