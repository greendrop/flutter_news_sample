import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_list/enum/news_headline_category.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/snack_bar/hook/show_danger_text_snack_bar.dart';
import 'package:flutter_news_sample/feature/theme_data/hook/use_theme_data.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleListPage extends HookConsumerWidget {
  const NewsArticleListPage({
    super.key,
    this.initialCategory = defaultCategory,
    this.useNewsArticles = useNewsArticlesImpl,
    this.usePushNewsArticleDetailPage = usePushNewsArticleDetailPageImpl,
  });

  final NewsHeadlineCategory initialCategory;
  final UseNewsArticles useNewsArticles;
  final UsePushNewsArticleDetailPage usePushNewsArticleDetailPage;

  static const defaultCategory = NewsHeadlineCategory.general;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final themeData = useThemeData();
    final pushNewsArticleDetailPage = usePushNewsArticleDetailPage();
    final showDangerTextSnackBar = useShowDangerTextSnackBarImpl();

    final newsArticlesByCategories = NewsHeadlineCategory.values
        .fold(<NewsHeadlineCategory, UseNewsArticlesReturn>{}, (acc, category) {
      acc[category] = useNewsArticles(category: category.value);
      return acc;
    });
    final tabController = useTabController(
      initialLength: newsArticlesByCategories.length,
      initialIndex: newsArticlesByCategories.keys
          .toList()
          .indexWhere((category) => category == initialCategory),
    );

    useEffect(
      () {
        Future.delayed(Duration.zero, () {
          newsArticlesByCategories.forEach((category, newsArticles) {
            newsArticles.fetch().onError((error, stackTrace) {});
          });
        });
        return () {};
      },
      [],
    );

    return LayoutBuilder(
      builder: (_, constraints) {
        final breakpoint = Breakpoint.fromConstraints(constraints);

        return DefaultTabController(
          length: newsArticlesByCategories.length,
          child: Scaffold(
            body: SafeArea(
              child: BodyContainer(
                child: NestedScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      _appBar(context, ref, translations: translations),
                      _tabBar(
                        context,
                        ref,
                        newsArticlesByCategories: newsArticlesByCategories,
                        controller: tabController,
                        themeData: themeData,
                        translations: translations,
                      ),
                    ];
                  },
                  body: _body(
                    context,
                    ref,
                    tabController: tabController,
                    newsArticlesByCategories: newsArticlesByCategories,
                    gridCrossAxisCount: breakpoint.columns ~/ 2,
                    translations: translations,
                    pushNewsArticleDetailPage: pushNewsArticleDetailPage,
                    showDangerTextSnackBar: showDangerTextSnackBar,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SliverAppBar _appBar(
    BuildContext context,
    WidgetRef ref, {
    required Translations translations,
  }) {
    return SliverAppBar(
      title: Text(translations.newsArticleList.title),
      floating: true,
    );
  }

  Widget _tabBar(
    BuildContext context,
    WidgetRef ref, {
    required Map<NewsHeadlineCategory, UseNewsArticlesReturn>
        newsArticlesByCategories,
    required TabController controller,
    required ThemeData themeData,
    required Translations translations,
  }) {
    return SliverPersistentHeader(
      delegate: _TabBarDelegate(
        backgroundColor: themeData.appBarTheme.backgroundColor ??
            themeData.scaffoldBackgroundColor,
        tabBar: TabBar(
          controller: controller,
          isScrollable: true,
          tabs: newsArticlesByCategories.keys
              .map(
                (category) => Tab(
                  text: category.nameByTranslations(translations),
                ),
              )
              .toList(),
        ),
      ),
      pinned: true,
    );
  }
}

Widget _body(
  BuildContext context,
  WidgetRef ref, {
  required TabController tabController,
  required Map<NewsHeadlineCategory, UseNewsArticlesReturn>
      newsArticlesByCategories,
  required int gridCrossAxisCount,
  required Translations translations,
  required UsePushNewsArticleDetailPageReturn pushNewsArticleDetailPage,
  required UseShowDangerTextSnackBarReturn showDangerTextSnackBar,
}) {
  return TabBarView(
    controller: tabController,
    children: newsArticlesByCategories.keys.map<Widget>((category) {
      final newsArticles = newsArticlesByCategories[category]!;

      return RefreshIndicator(
        onRefresh: () {
          return newsArticles
              .fetch(isRefresh: true)
              .onError((error, stackTrace) {
            showDangerTextSnackBar.run(
              text: AppException.fromException(error as Exception?)
                  .messageByTranslations(translations),
            );
          });
        },
        child: newsArticles.state.when(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (error, stackTrace) {
            final appException = error is AppException
                ? error
                : AppException(parentException: error as Exception);
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Text(
                        appException.messageByTranslations(translations),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          data: (data) {
            if (data.items.isEmpty) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: Text(
                          translations.general.noDataAvailable,
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCrossAxisCount,
              ),
              itemCount: data.items.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == data.items.length - 1 && data.hasNextPage) {
                  // NOTE: API上限にならないように、追加ページを取得しない
                  // Future.delayed(Duration.zero, () {
                  //   newsArticles.fetchMore().onError((error, stackTrace) {});
                  // });
                }
                return NewsArticleGridItem(
                  newsArticle: data.items[index],
                  onTap: () {
                    if (data.items[index].url == null) {
                      return;
                    }

                    if (defaultTargetPlatform == TargetPlatform.android ||
                        defaultTargetPlatform == TargetPlatform.iOS) {
                      pushNewsArticleDetailPage.run(
                        title: data.items[index].title ?? '',
                        url: data.items[index].url ?? '',
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      );
    }).toList(),
  );
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate({
    required this.tabBar,
    required this.backgroundColor,
  });

  final TabBar tabBar;
  final Color? backgroundColor;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: backgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
