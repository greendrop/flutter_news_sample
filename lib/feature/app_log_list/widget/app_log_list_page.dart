import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_app_logger_files.dart';
import 'package:flutter_news_sample/feature/navigator/hook/use_navigator_state.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class AppLogListPage extends HookConsumerWidget {
  const AppLogListPage({
    super.key,
  });

  static String routeName = 'AppLogListPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final navigatorState = useNavigatorState();
    final appLoggerFiles = useAppLoggerFiles();

    useEffect(
      () {
        Future.delayed(Duration.zero, appLoggerFiles.fetch);
        return () {};
      },
      [],
    );

    return Scaffold(
      body: SafeArea(
        child: BodyContainer(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > AppConstant.swipePopThreshold) {
                navigatorState.pop();
              }
            },
            child: RefreshIndicator(
              onRefresh: appLoggerFiles.fetch,
              edgeOffset: kToolbarHeight,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  _appBar(context, ref, translations: translations),
                  _body(
                    context,
                    ref,
                    translations: translations,
                    appLoggerFiles: appLoggerFiles,
                  ),
                ],
              ),
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
      title: Text(translations.appLogList.title),
      floating: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required Translations translations,
    required UseAppLoggerFilesReturn appLoggerFiles,
  }) {
    final pushAppLogDetailPage = usePushAppLogDetailPage();

    return appLoggerFiles.state.when(
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text('Error: $error')),
      ),
      data: (files) {
        if (files.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(translations.general.noDataAvailable)),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: const Icon(FontAwesomeIcons.file),
                title: Text(
                  basename(files[index].path),
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  pushAppLogDetailPage.run(
                    filename: basename(files[index].path),
                  );
                },
              );
            },
            childCount: files.length,
          ),
        );
      },
    );
  }
}
