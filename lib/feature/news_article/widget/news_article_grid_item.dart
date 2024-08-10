import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleGridItem extends HookConsumerWidget {
  const NewsArticleGridItem({super.key, required this.newsArticle, this.onTap});

  final NewsArticle newsArticle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppConstant.spacing1),
          child: Column(
            children: [
              Expanded(child: Text(newsArticle.title.toString())),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppConstant.spacing1),
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
  const _NewsArticleImage({required this.url});

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
