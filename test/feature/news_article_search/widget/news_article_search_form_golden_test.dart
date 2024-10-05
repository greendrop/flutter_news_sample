import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_form.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleSearchForm Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildNewsArticleSearchForm({
      String initialKeyword = '',
      bool initiallidationEnabled = false,
      void Function({required String keyword})? onSubmit,
    }) {
      return TestMaterialApp(
        child: NewsArticleSearchForm(
          initialKeyword: initialKeyword,
          initiallidationEnabled: initiallidationEnabled,
          onSubmit: onSubmit,
        ),
      );
    }

    final fileNamePrefix = 'news_article_search_form${Platform.pathSeparator}';

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}default_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () => buildNewsArticleSearchForm(
                  onSubmit: ({required String keyword}) {},
                ),
              );
            },
          );
        });

        group('Invalid', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}invalid_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () => buildNewsArticleSearchForm(
                  initiallidationEnabled: true,
                  onSubmit: ({required String keyword}) {},
                ),
              );
            },
          );
        });

        group('Disabled Submit', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}disabled_submit_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: buildNewsArticleSearchForm,
              );
            },
          );
        });
      });
    }
  });
}
