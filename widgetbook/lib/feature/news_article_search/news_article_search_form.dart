import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_form.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NewsArticleSearchForm extends StatelessWidget {
  const NewsArticleSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return feature.NewsArticleSearchForm(
      initialKeyword: 'Keyword',
      onSubmit: ({required String keyword}) {},
    );
  }
}

@UseCase(
  name: 'Default',
  type: NewsArticleSearchForm,
)
Widget buildNewsArticleSearchFormDefaultUseCase(BuildContext context) {
  return const NewsArticleSearchForm();
}
