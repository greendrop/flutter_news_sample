import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_app_logger_file_content.dart';
import 'package:flutter_news_sample/feature/navigator/hook/use_navigator_state.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLogDetailPage extends HookConsumerWidget {
  const AppLogDetailPage({
    super.key,
    required this.filename,
  });

  static const routeName = 'AppLogDetailPage';

  final String filename;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorState = useNavigatorState();
    final appLoggerFileContent = useAppLoggerFileContent(filename: filename);

    useEffect(
      () {
        Future.delayed(Duration.zero, appLoggerFileContent.fetch);
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
              onRefresh: appLoggerFileContent.fetch,
              edgeOffset: kToolbarHeight,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  _appBar(context, ref),
                  _body(
                    context,
                    ref,
                    appLoggerFileContent: appLoggerFileContent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _appBar(BuildContext context, WidgetRef ref) {
    return SliverAppBar(title: Text(filename), floating: true);
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required UseAppLoggerFileContentReturn appLoggerFileContent,
  }) {
    final translations = useTranslations();

    return appLoggerFileContent.state.when(
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text('Error: $error')),
      ),
      data: (data) {
        final lines = data.split('\n');

        if (lines.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(translations.general.noDataAvailable)),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: lines.length,
            (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        lines[index],
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
