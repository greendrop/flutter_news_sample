import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_search_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleSearchPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.02);

    Widget buildNewsArticleSearchPage({
      bool isLoading = false,
      bool isEmpty = false,
    }) {
      UseNewsArticlesReturn useNewsArticles() {
        late AsyncValue<NewsArticles> state;

        if (isLoading) {
          state = const AsyncValue.loading();
        } else if (isEmpty) {
          state = AsyncValue.data(NewsArticles(items: []));
        } else {
          state = AsyncValue.data(
            NewsArticles(
              items: List.generate(3, (index) {
                return NewsArticle(
                  title: 'title',
                  url: 'https://example.com',
                );
              }),
            ),
          );
        }

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

      UsePushNewsArticleSearchDetailPageReturn
          usePushNewsArticleSearchDetailPage() {
        Future<void> run({required String title, required String url}) {
          return Future.value();
        }

        return (run: run);
      }

      return TestMaterialApp(
        child: NewsArticleSearchPage(
          useNewsArticles: useNewsArticles,
          usePushNewsArticleSearchDetailPage:
              usePushNewsArticleSearchDetailPage,
          stopLoadingIndicator: isLoading,
        ),
      );
    }

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: 'news_article_search_page/default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: buildNewsArticleSearchPage,
              );
            },
          );
        });

        group('Empty', () {
          goldenTest(
            '',
            fileName: 'news_article_search_page/empty_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () => buildNewsArticleSearchPage(isEmpty: true),
              );
            },
          );
        });

        group('Loading', () {
          goldenTest(
            '',
            fileName: 'news_article_search_page/loading_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () {
                  return buildNewsArticleSearchPage(isLoading: true);
                },
              );
            },
          );
        });
      });
    }
  });
}
