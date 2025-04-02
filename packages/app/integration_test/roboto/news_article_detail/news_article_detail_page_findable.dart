import 'package:app/feature/news_article_detail/widget/news_article_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class NewsArticleDetailPageFindable
    extends BaseFindable<NewsArticleDetailPage> {
  NewsArticleDetailPageFindable();

  final back = find.byTooltip(RegExp('Back|戻る'));
}
