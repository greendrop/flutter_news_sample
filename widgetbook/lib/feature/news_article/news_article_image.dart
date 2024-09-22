import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_image.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

class NewsArticleImage extends StatelessWidget {
  const NewsArticleImage({super.key, required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return feature.NewsArticleImage(url: url);
  }
}

@UseCase(
  name: 'Exist Image Enabled',
  type: NewsArticleImage,
)
Widget buildNewsArticleImageExistImageUseCase(BuildContext context) {
  return const NewsArticleImage(url: _dummyImageUrl);
}

@UseCase(
  name: 'Not Exist Image',
  type: NewsArticleImage,
)
Widget buildNewsArticleImageNotExistImageUseCase(BuildContext context) {
  return const NewsArticleImage(url: null);
}
