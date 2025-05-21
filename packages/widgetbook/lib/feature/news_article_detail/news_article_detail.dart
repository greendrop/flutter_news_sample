import 'package:app/feature/news_article_detail/widget/news_article_detail_page.dart'
    as feature;
import 'package:app/feature/share/hook/use_share.dart';
import 'package:app/util/result.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NewsArticleDetailPage extends StatelessWidget {
  const NewsArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    UseShareReturn useShare() {
      Future<Result<ShareResult>> run(ShareParams params) {
        return Future.value(
          const Result.ok(ShareResult('', ShareResultStatus.success)),
        );
      }

      return (run: run);
    }

    return feature.NewsArticleDetailPage(
      title: 'title',
      url: 'https://example.com',
      isDummyWebView: true,
      useShare: useShare,
    );
  }
}

@UseCase(name: 'Default', type: NewsArticleDetailPage)
Widget buildNewsArticleDetailPageDefaultUseCase(BuildContext context) {
  return const NewsArticleDetailPage();
}
