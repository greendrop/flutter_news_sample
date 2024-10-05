import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';

const String _dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

void main() {
  group('NewsArticleImage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildNewsArticleImage({String? url}) {
      return mockNetworkImages(() => NewsArticleImage(url: url));
    }

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        group('Exist Image', () {
          goldenTest(
            '',
            fileName: 'news_article_image_exist_image_${brightness.name}',
            builder: () => GoldenTestWidgetScenario(
              name: '',
              brightness: brightness,
              builder: () => buildNewsArticleImage(url: _dummyImageUrl),
            ),
          );
        });

        group('No Image', () {
          goldenTest(
            '',
            fileName: 'news_article_image_no_image_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () => mockNetworkImages(buildNewsArticleImage),
              );
            },
          );
        });
      });
    }
  });
}
