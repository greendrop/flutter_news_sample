import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleGridItem', () {
    testWidgets('タイトル, 画像が表示されること', (tester) async {
      final newsArticle = NewsArticle(
        title: 'title',
      );

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: NewsArticleGridItem(newsArticle: newsArticle),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final textFinder = find.byKey(const Key('NewsArticleGridItemTitleText'));
      expect(textFinder, findsOneWidget);
      final text = tester.widget<Text>(textFinder);
      expect(text.data, 'title');

      expect(find.byType(NewsArticleImage), findsOneWidget);
    });

    testWidgets('タップして、onTapが呼ばれること', (tester) async {
      final newsArticle = NewsArticle(
        title: 'title',
      );
      var isCalled = false;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: NewsArticleGridItem(
                newsArticle: newsArticle,
                onTap: () {
                  isCalled = true;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(NewsArticleGridItem));
      expect(isCalled, isTrue);
    });
  });
}
