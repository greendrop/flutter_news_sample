import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

const String _dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

void main() {
  group('NewsArticleGridItem Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildNewsArticleGridItem({
      String title = 'test',
      String? imageUrl,
      VoidCallback? onTap,
    }) {
      return TestMaterialApp(
        child: NewsArticleGridItem(
          newsArticle: NewsArticle(
            title: 'title',
            urlToImage: imageUrl,
          ),
          onTap: onTap,
        ),
      );
    }

    final fileNamePrefix = 'news_article_grid_item${Platform.pathSeparator}';

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        group('Exist Image', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}exist_image_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () =>
                    buildNewsArticleGridItem(imageUrl: _dummyImageUrl),
              );
            },
          );
        });

        group('No Image', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}no_image_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: buildNewsArticleGridItem,
              );
            },
          );
        });
      });
    }
  });
}
