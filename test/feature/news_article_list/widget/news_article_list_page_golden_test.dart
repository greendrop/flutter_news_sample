import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_list/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/widget/news_article_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleListPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.02);

    Widget buildNewsArticleListPage({
      bool isLoading = false,
      bool isEmpty = false,
    }) {
      UseNewsArticlesReturn useNewsArticles({required String category}) {
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

      UsePushNewsArticleDetailPageReturn usePushNewsArticleDetailPage() {
        Future<void> run({required String title, required String url}) {
          return Future.value();
        }

        return (run: run);
      }

      return TestMaterialApp(
        child: NewsArticleListPage(
          useNewsArticles: useNewsArticles,
          usePushNewsArticleDetailPage: usePushNewsArticleDetailPage,
          stopLoadingIndicator: isLoading,
        ),
      );
    }

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: 'news_article_list_page_default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: buildNewsArticleListPage,
              );
            },
          );
        });

        group('Empty', () {
          goldenTest(
            '',
            fileName: 'news_article_list_page_empty_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () => buildNewsArticleListPage(isEmpty: true),
              );
            },
          );
        });

        group('Loading', () {
          goldenTest(
            '',
            fileName: 'news_article_list_page_loading_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () {
                  return buildNewsArticleListPage(isLoading: true);
                },
              );
            },
          );
        });
      });
    }
  });
}
