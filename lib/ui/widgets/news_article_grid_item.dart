// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

class NewsArticleGridItem extends HookConsumerWidget {
  const NewsArticleGridItem({Key? key, required this.newsArticle, this.onTap})
      : super(key: key);

  final NewsArticle newsArticle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Expanded(child: Text(newsArticle.title.toString())),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: _NewsArticleImage(url: newsArticle.urlToImage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsArticleImage extends HookConsumerWidget {
  const _NewsArticleImage({Key? key, required this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (url == null || url == '') {
      return const Center(child: Text('NO IMAGE'));
    }

    return Image.network(
      url.toString(),
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('NO IMAGE'));
      },
    );
  }
}
