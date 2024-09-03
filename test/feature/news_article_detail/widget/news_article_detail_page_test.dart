import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/widget/news_article_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_detail/widget/news_article_detail_webview.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleDetailPage', () {
    testWidgets(
        [
          '引数のtitleが表示されること',
          'NewsArticleDetailWebViewが表示されること',
        ].join(', '), (tester) async {
      await tester.pumpWidget(
        const TestMaterialApp(
          child: Scaffold(
            body: NewsArticleDetailPage(
              title: 'dummy',
              url: 'https://example.com',
              isDummyWebView: true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('dummy'), findsOneWidget);
      expect(find.byType(NewsArticleDetailWebView), findsOneWidget);
    });
  });
}
