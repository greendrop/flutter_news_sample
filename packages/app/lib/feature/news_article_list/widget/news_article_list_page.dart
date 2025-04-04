import 'package:app/exception/app_exception.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/news_article/widget/news_article_grid_item.dart';
import 'package:app/feature/news_article/widget/news_article_grid_item_skeleton.dart';
import 'package:app/feature/news_article_detail/hook/use_push_news_article_detail_page.dart';
import 'package:app/feature/news_article_list/enum/news_headline_category.dart';
import 'package:app/feature/news_article_list/hook/use_news_articles.dart';
import 'package:app/feature/snack_bar/hook/show_danger_text_snack_bar.dart';
import 'package:app/feature/theme_data/hook/use_theme_data.dart';
import 'package:app/widget/body_container.dart';
import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleListPage extends HookConsumerWidget {
  const NewsArticleListPage({
    super.key,
    this.initialCategory = defaultCategory,
    this.useNewsArticles = useNewsArticlesImpl,
    this.usePushNewsArticleDetailPage = usePushNewsArticleDetailPageImpl,
    this.loadingSkeletonCount = 8,
    this.loadingSkeletonShimmerLoop = 0,
  });

  final NewsHeadlineCategory initialCategory;
  final UseNewsArticles useNewsArticles;
  final UsePushNewsArticleDetailPage usePushNewsArticleDetailPage;
  final int loadingSkeletonCount;
  final int loadingSkeletonShimmerLoop;

  static const defaultCategory = NewsHeadlineCategory.general;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final themeData = useThemeData();
    final pushNewsArticleDetailPage = usePushNewsArticleDetailPage();
    final showDangerTextSnackBar = useShowDangerTextSnackBarImpl();

    final newsArticlesByCategories = NewsHeadlineCategory.values.fold(
      <NewsHeadlineCategory, UseNewsArticlesReturn>{},
      (acc, category) {
        acc[category] = useNewsArticles(category: category.value);
        return acc;
      },
    );
    final tabController = useTabController(
      initialLength: newsArticlesByCategories.length,
      initialIndex: newsArticlesByCategories.keys.toList().indexWhere(
        (category) => category == initialCategory,
      ),
    );

    useEffect(() {
      Future.microtask(() {
        newsArticlesByCategories.forEach((category, newsArticles) {
          newsArticles.fetch().onError((error, stackTrace) {});
        });
      });
      return () {};
    }, []);

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
                      _appBar(context, ref, l10n: l10n),
                      _tabBar(
                        context,
                        ref,
                        newsArticlesByCategories: newsArticlesByCategories,
                        controller: tabController,
                        themeData: themeData,
                        l10n: l10n,
                      ),
                    ];
                  },
                  body: _body(
                    context,
                    ref,
                    tabController: tabController,
                    newsArticlesByCategories: newsArticlesByCategories,
                    gridCrossAxisCount: breakpoint.columns ~/ 2,
                    l10n: l10n,
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
    required L10n l10n,
  }) {
    return SliverAppBar(title: Text(l10n.newsArticleListTitle), floating: true);
  }

  Widget _tabBar(
    BuildContext context,
    WidgetRef ref, {
    required Map<NewsHeadlineCategory, UseNewsArticlesReturn>
    newsArticlesByCategories,
    required TabController controller,
    required ThemeData themeData,
    required L10n l10n,
  }) {
    return SliverPersistentHeader(
      delegate: _TabBarDelegate(
        backgroundColor:
            themeData.appBarTheme.backgroundColor ??
            themeData.scaffoldBackgroundColor,
        tabBar: TabBar(
          controller: controller,
          isScrollable: true,
          tabs:
              newsArticlesByCategories.keys
                  .map((category) => Tab(text: category.nameByL10n(l10n)))
                  .toList(),
        ),
      ),
      pinned: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required TabController tabController,
    required Map<NewsHeadlineCategory, UseNewsArticlesReturn>
    newsArticlesByCategories,
    required int gridCrossAxisCount,
    required L10n l10n,
    required UsePushNewsArticleDetailPageReturn pushNewsArticleDetailPage,
    required UseShowDangerTextSnackBarReturn showDangerTextSnackBar,
  }) {
    return TabBarView(
      controller: tabController,
      children:
          newsArticlesByCategories.keys.map<Widget>((category) {
            final newsArticles = newsArticlesByCategories[category]!;

            return RefreshIndicator(
              onRefresh: () {
                return newsArticles.fetch(isRefresh: true).onError((
                  error,
                  stackTrace,
                ) {
                  showDangerTextSnackBar.run(
                    text: AppException.fromException(
                      error as Exception?,
                    ).messageByL10n(l10n),
                  );
                });
              },
              child: newsArticles.state.when(
                loading: () {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridCrossAxisCount,
                    ),
                    itemCount: loadingSkeletonCount,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsArticleGridItemSkeleton(
                        shimmerLoop: loadingSkeletonShimmerLoop,
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  final appException =
                      error is AppException
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
                            child: Text(appException.messageByL10n(l10n)),
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
                              child: Text(l10n.generalNoDataAvailable),
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
                        // Future.microtask(() {
                        //   newsArticles.fetchMore().onError(
                        //         (error, stackTrace) {},
                        //       );
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
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate({required this.tabBar, required this.backgroundColor});

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
    return Container(color: backgroundColor, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
