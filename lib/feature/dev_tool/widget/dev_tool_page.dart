import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_push_app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_news_sample/feature/navigator/hook/use_navigator_state.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DevToolPage extends HookConsumerWidget {
  const DevToolPage({
    super.key,
  });

  static const routeName = 'DevToolPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final navigatorState = useNavigatorState();

    return Scaffold(
      body: SafeArea(
        child: BodyContainer(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > AppConstant.swipePopThreshold) {
                navigatorState.pop();
              }
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                _appBar(context, ref, translations: translations),
                _body(context, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _appBar(
    BuildContext context,
    WidgetRef ref, {
    required Translations translations,
  }) {
    return SliverAppBar(
      title: Text(translations.devTools.title),
      floating: true,
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    final pushAppLogListPage = usePushAppLogListPage();

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppConstant.spacing1),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstant.spacing1),
                child: Column(
                  children: [
                    AppLogListTile(onTap: pushAppLogListPage.run),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
