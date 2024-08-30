import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_detail_page_for_search.dart'
    as hook;
import 'package:flutter_news_sample/feature/news_article_search/hook/use_news_articles.dart'
    as hook;
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_form.dart';
import 'package:flutter_news_sample/feature/snack_bar/hook/show_danger_text_snack_bar.dart'
    as hook;
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart'
    as hook;
import 'package:flutter_news_sample/feature/url_launcher/hook/use_url_launcher.dart'
    as hook;
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleSearchPage extends HookConsumerWidget {
  const NewsArticleSearchPage({
    super.key,
    this.useTranslations = hook.useTranslations,
    this.useNewsArticles = hook.useNewsArticles,
    this.useShowDangerTextSnackBar = hook.useShowDangerTextSnackBar,
    this.usePushNewsArticleDetailPageForSearch =
        hook.usePushNewsArticleDetailPageForSearch,
    this.useUrlLauncher = hook.useUrlLauncher,
  });

  final hook.UseTranslations useTranslations;
  final hook.UseNewsArticles useNewsArticles;
  final hook.UseShowDangerTextSnackBar useShowDangerTextSnackBar;
  final hook.UsePushNewsArticleDetailPageForSearch
      usePushNewsArticleDetailPageForSearch;
  final hook.UseUrlLauncher useUrlLauncher;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final currentKeyword = useState('');
    final newsArticles = useNewsArticles();
    final showDangerTextSnackBar = useShowDangerTextSnackBar();
    final pushNewsArticleDetailPageForSearch =
        usePushNewsArticleDetailPageForSearch();
    final urlLauncher = useUrlLauncher();

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
                      pushNewsArticleDetailPageForSearch:
                          pushNewsArticleDetailPageForSearch,
                      urlLauncher: urlLauncher,
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
    required hook.Translations translations,
    required hook.UseNewsArticlesReturn newsArticles,
    required ValueNotifier<String> currentKeyword,
  }) {
    return SliverAppBar(
      title: Text(translations.newsArticleSearch.title),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstant.spacing2,
            0,
            AppConstant.spacing2,
            AppConstant.spacing1,
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
    required hook.Translations translations,
    required hook.UseNewsArticlesReturn newsArticles,
    required hook.UsePushNewsArticleDetailPageForSearchReturn
        pushNewsArticleDetailPageForSearch,
    required hook.UseUrlLauncherReturn urlLauncher,
    required ValueNotifier<String> currentKeyword,
    required int gridCrossAxisCount,
  }) {
    return newsArticles.state.when(
      loading: () {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
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
                  pushNewsArticleDetailPageForSearch.run(
                    title: data.items[index].title ?? '',
                    url: data.items[index].url ?? '',
                  );
                } else {
                  final url = Uri.parse(data.items[index].url!);

                  urlLauncher.canLaunchUrl(url).then((value) {
                    if (value) {
                      urlLauncher.launchUrl(
                        url,
                        mode: hook.LaunchMode.externalApplication,
                      );
                    }
                  });
                }
              },
            );
          },
        );
      },
    );
  }
}
