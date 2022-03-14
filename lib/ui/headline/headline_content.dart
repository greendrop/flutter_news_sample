// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/providers/news_headline_state_notifier_provider.dart';
import 'package:flutter_news_sample/ui/widgets/news_article_grid_item.dart';

class HeadlineContent extends HookConsumerWidget {
  const HeadlineContent({
    Key? key,
    required this.category,
    required this.gridCrossAxisCount,
  }) : super(key: key);

  final String category;
  final int gridCrossAxisCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsHeadlineState = ref.watch(newsHeadlineStateNotifierProvider);

    if (newsHeadlineState.categoryArticlesFetching[category] == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (newsHeadlineState.categoryArticles[category] == null) {
      return Container();
    }

    final gridChildren =
        newsHeadlineState.categoryArticles[category]!.map<Widget>((article) {
      return NewsArticleGridItem(newsArticle: article);
    }).toList();

    return GridView.count(
      crossAxisCount: gridCrossAxisCount,
      children: gridChildren,
    );
  }
}
