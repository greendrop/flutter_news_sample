// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:breakpoint/breakpoint.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/providers/news_headline_state_notifier_provider.dart';
import 'package:flutter_news_sample/ui/news_headline/news_headline_content.dart';

class NewsHeadlinePage extends HookConsumerWidget {
  const NewsHeadlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfig = useMemoized(AppConfig.new);
    final l10n = L10n.of(context)!;

    useEffect(
      () {
        ref
            .read(newsHeadlineStateNotifierProvider.notifier)
            .fetchAllCategories();
        return () {};
      },
      [],
    );

    return LayoutBuilder(
      builder: (_, constraints) {
        final breakpoint = Breakpoint.fromConstraints(constraints);
        final tabs = appConfig.newsHeadlineCategories.map<Widget>((category) {
          return Tab(text: _categoryText(l10n, category));
        }).toList();

        final tabContents = appConfig.newsHeadlineCategories
            .map<Widget>(
              (category) => NewsHeadlineContent(
                category: category,
                gridCrossAxisCount: breakpoint.columns ~/ 2,
              ),
            )
            .toList();

        final appBar = AppBar(
          title: Text(L10n.of(context)!.newsHeadlineTitle),
          bottom: TabBar(tabs: tabs, isScrollable: true),
        );

        final body = TabBarView(
          children: tabContents,
        );

        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: appBar,
            body: body,
          ),
        );
      },
    );
  }

  String _categoryText(L10n l10n, String category) {
    switch (category) {
      case 'general':
        return l10n.newsHeadlineCategoryGeneral;
      case 'business':
        return l10n.newsHeadlineCategoryBusiness;
      case 'entertainment':
        return l10n.newsHeadlineCategoryEntertainment;
      case 'health':
        return l10n.newsHeadlineCategoryHealth;
      case 'science':
        return l10n.newsHeadlineCategoryScience;
      case 'sports':
        return l10n.newsHeadlineCategorySports;
      case 'technology':
        return l10n.newsHeadlineCategoryTechnology;
      default:
        return category;
    }
  }
}
