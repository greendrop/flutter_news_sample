import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/news_article/widget/news_article_grid_item.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_go_news_article_detail_page_for_search.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_form.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/feature/url_launcher/hook/use_url_launcher_wrapper.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleSearchPage extends HookConsumerWidget {
  const NewsArticleSearchPage({
    super.key,
  });

  static String routeName = 'NewsArticleSearchPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final currentKeyword = useState('');
    final newsArticles = useNewsArticles();
    final goNewsArticleDetailPageForSearch =
        useGoNewsArticleDetailPageForSearch();
    final urlLauncherWrapper = useUrlLauncherWrapper();

    return LayoutBuilder(
      builder: (_, constraints) {
        final breakpoint = Breakpoint.fromConstraints(constraints);

        return Scaffold(
          body: SafeArea(
            child: BodyContainer(
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
                    goNewsArticleDetailPageForSearch:
                        goNewsArticleDetailPageForSearch,
                    urlLauncherWrapper: urlLauncherWrapper,
                  ),
                ],
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
    required ValueNotifier<String> currentKeyword,
    required UseNewsArticlesReturn newsArticles,
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
    required Translations translations,
    required ValueNotifier<String> currentKeyword,
    required UseNewsArticlesReturn newsArticles,
    required int gridCrossAxisCount,
    required UseGoNewsArticleDetailPageForSearchReturn
        goNewsArticleDetailPageForSearch,
    required UseUrlLauncherWrapperReturn urlLauncherWrapper,
  }) {
    return SliverFillRemaining(
      child: RefreshIndicator(
        onRefresh: () {
          return newsArticles
              .fetch(keyword: currentKeyword.value)
              .onError((error, stackTrace) {});
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
            return Center(
              child: Text(appException.messageByTranslations(translations)),
            );
          },
          data: (data) {
            if (data.items.isEmpty) {
              return Center(
                child: Text(translations.general.noDataAvailable),
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
                      goNewsArticleDetailPageForSearch.run(
                        title: data.items[index].title ?? '',
                        url: data.items[index].url ?? '',
                      );
                    } else {
                      final url = Uri.parse(data.items[index].url!);

                      urlLauncherWrapper.canLaunchUrl(url).then((value) {
                        if (value) {
                          urlLauncherWrapper.launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      });
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
