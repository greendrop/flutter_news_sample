import 'package:flutter_test/flutter_test.dart';

import '../base_driver.dart';
import 'news_article_detail_page_findable.dart';

class NewsArticleDetailPageDriver extends BaseDriver {
  NewsArticleDetailPageDriver(super.tester);

  final _findable = NewsArticleDetailPageFindable();

  bool get isShown => _findable.isShown;

  Future<void> waitUntileVisible() async {
    await waitFor(_findable.self);
  }

  Future<void> tapBack() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.back);
  }

  Future<void> expectTitle(String title) async {
    await tester.pumpAndSettle();
    expect(find.text(title), findsOneWidget);
  }
}
