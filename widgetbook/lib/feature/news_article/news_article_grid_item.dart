import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

class NewsArticleGridItem extends StatelessWidget {
  const NewsArticleGridItem({
    super.key,
    required this.newsArticle,
    this.onTap,
  });

  final NewsArticle newsArticle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.NewsArticleGridItem(newsArticle: newsArticle, onTap: onTap);
  }
}

@UseCase(
  name: 'Enabled With Image',
  type: NewsArticleGridItem,
)
Widget buildNewsArticleGridItemEnabledWithImageUseCase(BuildContext context) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(
      title: 'Title',
      urlToImage: _dummyImageUrl,
    ),
    onTap: () {},
  );
}

@UseCase(
  name: 'Disabled With Image',
  type: NewsArticleGridItem,
)
Widget buildNewsArticleGridItemDisabledWithImageUseCase(BuildContext context) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(
      title: 'Title',
      urlToImage: _dummyImageUrl,
    ),
  );
}

@UseCase(
  name: 'Enabled Without Image',
  type: NewsArticleGridItem,
)
Widget buildNewsArticleGridItemEnabledWithoutImageUseCase(
  BuildContext context,
) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(title: 'Title'),
    onTap: () {},
  );
}

@UseCase(
  name: 'Disabled Without Image',
  type: NewsArticleGridItem,
)
Widget buildNewsArticleGridItemDisabledWithoutImageUseCase(
  BuildContext context,
) {
  return NewsArticleGridItem(
    newsArticle: NewsArticle(title: 'Title'),
  );
}
