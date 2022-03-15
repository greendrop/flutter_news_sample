// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:uri/uri.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:flutter_news_sample/config/routes/app_router.dart';
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
      return NewsArticleGridItem(
        newsArticle: article,
        onTap: () {
          if (article.url == null) {
            return;
          }

          if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
            final uriBuilder = UriBuilder()
              ..path = const NewsDetailRoute().path
              ..queryParameters['title'] = article.title.toString()
              ..queryParameters['url'] = article.url.toString();
            AutoRouter.of(context).pushNamed(uriBuilder.build().toString());
          } else {
            launch(article.url.toString());
          }
        },
      );
    }).toList();

    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(newsHeadlineStateNotifierProvider.notifier)
            .fetchAllCategories();
      },
      child: GridView.count(
        crossAxisCount: gridCrossAxisCount,
        children: gridChildren,
      ),
    );
  }
}
