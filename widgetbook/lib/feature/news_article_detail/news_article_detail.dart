import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/widget/news_article_detail_page.dart'
    as feature;
import 'package:flutter_news_sample/feature/share/hook/use_share.dart';
// ignore: depend_on_referenced_packages
import 'package:share_plus/share_plus.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NewsArticleDetailPage extends StatelessWidget {
  const NewsArticleDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UseShareReturn useShare() {
      Future<void> run(
        String text, {
        String? subject,
        Rect? sharePositionOrigin,
      }) {
        return Future.value();
      }

      Future<void> runXFiles(
        List<XFile> files, {
        String? subject,
        String? text,
        Rect? sharePositionOrigin,
        List<String>? fileNameOverrides,
      }) {
        return Future.value();
      }

      return (run: run, runXFiles: runXFiles);
    }

    return feature.NewsArticleDetailPage(
      title: 'title',
      url: 'https://example.com',
      isDummyWebView: true,
      useShare: useShare,
    );
  }
}

@UseCase(
  name: 'Default',
  type: NewsArticleDetailPage,
)
Widget buildNewsArticleDetailPageDefaultUseCase(BuildContext context) {
  return const NewsArticleDetailPage();
}
