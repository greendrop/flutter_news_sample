import 'package:app/config/app_constant.dart';
import 'package:app/exception/app_exception.dart';
import 'package:app/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/navigator/hook/use_navigator_state.dart';
import 'package:app/widget/body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLogDetailPage extends HookConsumerWidget {
  const AppLogDetailPage({
    required this.filename,
    this.useAppLogFileContent = useAppLogFileContentImpl,
    this.stopLoadingIndicator = false,
    super.key,
  });

  final String filename;
  final UseAppLogFileContent useAppLogFileContent;
  final bool stopLoadingIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorState = useNavigatorState();
    final appLogFileContent = useAppLogFileContent(filename: filename);

    useEffect(() {
      Future.microtask(appLogFileContent.fetch);
      return () {};
    }, []);

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
              onRefresh: appLogFileContent.fetch,
              edgeOffset: kToolbarHeight,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  _appBar(context, ref),
                  _body(context, ref, appLogFileContent: appLogFileContent),
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
    required UseAppLogFileContentReturn appLogFileContent,
  }) {
    final l10n = useL10n();

    return appLogFileContent.state.when(
      loading:
          () => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                value: stopLoadingIndicator ? 0.8 : null,
              ),
            ),
          ),
      error:
          (error, stackTrace) => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                AppException.fromException(
                  error as Exception,
                ).messageByL10n(l10n),
              ),
            ),
          ),
      data: (data) {
        final lines = data.split('\n');

        if (lines.isEmpty || (lines.length == 1 && lines.first.isEmpty)) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(l10n.generalNoDataAvailable)),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(childCount: lines.length, (
            context,
            index,
          ) {
            return ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(lines[index], overflow: TextOverflow.visible),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
