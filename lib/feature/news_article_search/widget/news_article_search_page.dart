import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_search_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_form.dart';
import 'package:flutter_news_sample/feature/snack_bar/hook/show_danger_text_snack_bar.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/feature/url_launcher/hook/use_url_launcher.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleSearchPage extends HookConsumerWidget {
  const NewsArticleSearchPage({
    super.key,
    this.useNewsArticles = useNewsArticlesImpl,
    this.useShowDangerTextSnackBar = useShowDangerTextSnackBarImpl,
    this.usePushNewsArticleSearchDetailPage =
        usePushNewsArticleSearchDetailPageImpl,
    this.useUrlLauncher = useUrlLauncherImpl,
    this.stopLoadingIndicator = false,
  });

  final UseNewsArticles useNewsArticles;
  final UseShowDangerTextSnackBar useShowDangerTextSnackBar;
  final UsePushNewsArticleSearchDetailPage usePushNewsArticleSearchDetailPage;
  final UseUrlLauncher useUrlLauncher;
  final bool stopLoadingIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final currentKeyword = useState('');
    final newsArticles = useNewsArticles();
    final showDangerTextSnackBar = useShowDangerTextSnackBar();
    final pushNewsArticleSearchDetailPage =
        usePushNewsArticleSearchDetailPage();

    return LayoutBuilder(
      builder: (_, constraints) {
        final breakpoint = Breakpoint.fromConstraints(constraints);

        return Scaffold(
          body: SafeArea(
            child: BodyContainer(
              child: RefreshIndicator(
                onRefresh: () {
                  if (currentKeyword.value.isEmpty) {
                    return Future.value();
                  }

                  return newsArticles
                      .fetch(keyword: currentKeyword.value, isRefresh: true)
                      .onError((error, stackTrace) {
                    showDangerTextSnackBar.run(
                      text: AppException.fromException(error as Exception?)
                          .messageByTranslations(translations),
                    );
                  });
                },
                edgeOffset: kToolbarHeight * 2,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    _appBar(
                      context,
                      ref,
                      translations: translations,
                      currentKeyword: currentKeyword,
                      newsArticles: newsArticles,
                    ),
                    _body(
                      context,
                      ref,
                      translations: translations,
                      currentKeyword: currentKeyword,
                      newsArticles: newsArticles,
                      gridCrossAxisCount: breakpoint.columns ~/ 2,
                      pushNewsArticleSearchDetailPage:
                          pushNewsArticleSearchDetailPage,
                    ),
                  ],
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
    required UseNewsArticlesReturn newsArticles,
    required ValueNotifier<String> currentKeyword,
  }) {
    return SliverAppBar(
      title: Text(translations.newsArticleSearch.title),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            DesignTokenSpacing.md,
            0,
            DesignTokenSpacing.md,
            DesignTokenSpacing.sm,
          ),
          child: NewsArticleSearchForm(
            initialKeyword: currentKeyword.value,
            onSubmit: ({required String keyword}) {
              currentKeyword.value = keyword;
              newsArticles
                  .fetch(keyword: keyword)
                  .onError((error, stackTrace) {});
            },
          ),
        ),
      ),
      floating: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required Translations translations,
    required UseNewsArticlesReturn newsArticles,
    required UsePushNewsArticleSearchDetailPageReturn
        pushNewsArticleSearchDetailPage,
    required ValueNotifier<String> currentKeyword,
    required int gridCrossAxisCount,
  }) {
    return newsArticles.state.when(
      loading: () {
        return SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(
              value: stopLoadingIndicator ? 0.8 : null,
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return SliverFillRemaining(
          child: Center(
            child: Text(
              AppException.fromException(error as Exception)
                  .messageByTranslations(translations),
            ),
          ),
        );
      },
      data: (data) {
        if (data.items.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(translations.general.noDataAvailable),
            ),
          );
        }
        return SliverGrid.builder(
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
                  pushNewsArticleSearchDetailPage.run(
                    title: data.items[index].title ?? '',
                    url: data.items[index].url ?? '',
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
