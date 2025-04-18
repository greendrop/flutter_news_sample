import 'package:app/feature/news_article/entity/news_article.dart';
import 'package:app/feature/news_article/widget/news_article_grid_item.dart'
    as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

class NewsArticleGridItem extends StatelessWidget {
  const NewsArticleGridItem({required this.newsArticle, super.key, this.onTap});

  final NewsArticle newsArticle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.NewsArticleGridItem(newsArticle: newsArticle, onTap: onTap);
  }
}

Widget buildNewsArticleGridItemEnabledWithImage(BuildContext context) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(title: 'Title', urlToImage: _dummyImageUrl),
    onTap: () {},
  );
}

Widget buildNewsArticleGridItemDisabledWithImage(BuildContext context) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(title: 'Title', urlToImage: _dummyImageUrl),
  );
}

Widget buildNewsArticleGridItemEnabledWithoutImage(BuildContext context) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(title: 'Title'),
    onTap: () {},
  );
}

Widget buildNewsArticleGridItemDisabledWithoutImage(BuildContext context) {
  return NewsArticleGridItem(newsArticle: NewsArticle(title: 'Title'));
}

@UseCase(name: 'Enabled With Image', type: NewsArticleGridItem)
Widget buildNewsArticleGridItemEnabledWithImageUseCase(BuildContext context) {
  return buildNewsArticleGridItemEnabledWithImage(context);
}

@UseCase(name: 'Disabled With Image', type: NewsArticleGridItem)
Widget buildNewsArticleGridItemDisabledWithImageUseCase(BuildContext context) {
  return buildNewsArticleGridItemDisabledWithImage(context);
}

@UseCase(name: 'Enabled Without Image', type: NewsArticleGridItem)
Widget buildNewsArticleGridItemEnabledWithoutImageUseCase(
  BuildContext context,
) {
  return buildNewsArticleGridItemEnabledWithoutImage(context);
}

@UseCase(name: 'Disabled Without Image', type: NewsArticleGridItem)
Widget buildNewsArticleGridItemDisabledWithoutImageUseCase(
  BuildContext context,
) {
  return buildNewsArticleGridItemEnabledWithoutImage(context);
}
