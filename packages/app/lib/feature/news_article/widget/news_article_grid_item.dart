import 'package:app/config/design_token/spacing.dart';
import 'package:app/feature/news_article/entity/news_article.dart';
import 'package:app/feature/news_article/widget/news_article_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleGridItem extends HookConsumerWidget {
  const NewsArticleGridItem({required this.newsArticle, super.key, this.onTap});

  final NewsArticle newsArticle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(DesignTokenSpacing.sm),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  newsArticle.title.toString(),
                  key: const ValueKey('NewsArticleGridItemTitleText'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: DesignTokenSpacing.sm),
                  child: NewsArticleImage(url: newsArticle.urlToImage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
