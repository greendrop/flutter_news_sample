import 'package:app/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:app/feature/app_log_list/entity/app_log_file.dart';
import 'package:app/feature/app_log_list/hook/use_app_log_files.dart';
import 'package:app/feature/app_log_list/widget/app_log_list_page.dart'
    as feature;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppLogListPage extends StatelessWidget {
  const AppLogListPage({
    super.key,
    this.isLoading = false,
    this.isEmpty = false,
    this.stopLoadingIndicator = false,
  });

  final bool isLoading;
  final bool isEmpty;
  final bool stopLoadingIndicator;

  @override
  Widget build(BuildContext context) {
    UseAppLogFilesReturn useAppLogFiles() {
      late AsyncValue<List<AppLogFile>> state;

      if (isLoading) {
        state = const AsyncValue.loading();
      } else if (isEmpty) {
        state = const AsyncValue.data([]);
      } else {
        state = AsyncValue.data(
          List.generate(
            30,
            (index) => AppLogFile(path: '/path/to/test${index + 1}.log'),
          ),
        );
      }

      Future<void> fetch({bool isRefresh = false}) async {}

      return (state: state, fetch: fetch);
    }

    UsePushAppLogDetailPageReturn useMockPushAppLogDetailPage() {
      Future<void> run({required String filename}) {
        return Future.value();
      }

      return (run: run);
    }

    return feature.AppLogListPage(
      useAppLogFiles: useAppLogFiles,
      usePushAppLogDetailPage: useMockPushAppLogDetailPage,
      stopLoadingIndicator: stopLoadingIndicator,
    );
  }
}

Widget buildAppLogListPageDefault(BuildContext context) {
  return const AppLogListPage();
}

Widget buildAppLogListPageLoading(
  BuildContext context, {
  bool stopLoadingIndicator = false,
}) {
  return AppLogListPage(
    isLoading: true,
    stopLoadingIndicator: stopLoadingIndicator,
  );
}

Widget buildAppLogListPageEmpty(BuildContext context) {
  return const AppLogListPage(isEmpty: true);
}

@UseCase(name: 'Default', type: AppLogListPage)
Widget buildAppLogListPageDefaultUseCase(BuildContext context) {
  return buildAppLogListPageDefault(context);
}

@UseCase(name: 'Loading', type: AppLogListPage)
Widget buildAppLogListPageLoadingUseCase(BuildContext context) {
  return buildAppLogListPageLoading(context);
}

@UseCase(name: 'Empty', type: AppLogListPage)
Widget buildAppLogListPageEmptyUseCase(BuildContext context) {
  return buildAppLogListPageEmpty(context);
}
