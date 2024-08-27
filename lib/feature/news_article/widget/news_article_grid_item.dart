import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_image.dart';
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
              Expanded(
                child: Text(
                  newsArticle.title.toString(),
                  key: const ValueKey('NewsArticleGridItemTitleText'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppConstant.spacing1),
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
