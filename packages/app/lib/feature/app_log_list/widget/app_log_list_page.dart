import 'package:app/config/app_constant.dart';
import 'package:app/exception/app_exception.dart';
import 'package:app/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:app/feature/app_log_list/hook/use_app_log_files.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/navigator/hook/use_navigator_state.dart';
import 'package:app/widget/body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class AppLogListPage extends HookConsumerWidget {
  const AppLogListPage({
    super.key,
    this.useAppLogFiles = useAppLogFilesImpl,
    this.usePushAppLogDetailPage = usePushAppLogDetailPageImpl,
    this.stopLoadingIndicator = false,
  });

  final UseAppLogFiles useAppLogFiles;
  final UsePushAppLogDetailPage usePushAppLogDetailPage;
  final bool stopLoadingIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final navigatorState = useNavigatorState();
    final appLogFiles = useAppLogFiles();
    final pushAppLogDetailPage = usePushAppLogDetailPage();

    useEffect(() {
      Future.microtask(appLogFiles.fetch);
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
              onRefresh: () => appLogFiles.fetch(isRefresh: true),
              edgeOffset: kToolbarHeight,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  _appBar(context, ref, l10n: l10n),
                  _body(
                    context,
                    ref,
                    l10n: l10n,
                    appLogFiles: appLogFiles,
                    pushAppLogDetailPage: pushAppLogDetailPage,
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
    required L10n l10n,
  }) {
    return SliverAppBar(title: Text(l10n.appLogListTitle), floating: true);
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required L10n l10n,
    required UseAppLogFilesReturn appLogFiles,
    required UsePushAppLogDetailPageReturn pushAppLogDetailPage,
  }) {
    return appLogFiles.state.when(
      loading:
          () => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                value: stopLoadingIndicator ? 0.8 : null,
              ),
            ),
          ),
      error: (error, stackTrace) {
        final appException =
            error is AppException
                ? error
                : AppException(parentException: error as Exception);
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text(appException.messageByL10n(l10n))),
        );
      },
      data: (files) {
        if (files.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(l10n.generalNoDataAvailable)),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              key: ValueKey('ListTile-${files[index].path}'),
              leading: const Icon(FontAwesomeIcons.file),
              title: Text(
                basename(files[index].path),
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                pushAppLogDetailPage.run(filename: basename(files[index].path));
              },
            );
          }, childCount: files.length),
        );
      },
    );
  }
}
