import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group('NewsArticleImage', () {
    testWidgets('urlが存在する場合、画像が表示され、NO IMAGE ではないこと', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: NewsArticleImage(url: 'https://example.com/image.png'),
          ),
        );
        expect(find.byType(Image), findsOneWidget);
        expect(find.text('NO IMAGE'), findsNothing);
      });
    });

    testWidgets('urlがnullの場合、NO IMAGE が表示されること', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(home: NewsArticleImage(url: null)),
        );
        expect(find.byType(Image), findsNothing);
        expect(find.text('NO IMAGE'), findsOneWidget);
      });
    });
  });
}
