import 'package:app/feature/news_article/widget/news_article_grid_item_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleGridItemSkeleton', () {
    testWidgets('タイトル, 画像が表示されること', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(body: NewsArticleGridItemSkeleton(shimmerLoop: 1)),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(NewsArticleGridItemSkeleton), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);

      final textFinder = find.byKey(
        const Key('NewsArticleGridItemSkeletonTitleText0'),
      );
      expect(textFinder, findsOneWidget);
      final imageFinder = find.byKey(
        const ValueKey('NewsArticleGridItemSkeletonImage'),
      );
      expect(imageFinder, findsOneWidget);
    });
  });
}
