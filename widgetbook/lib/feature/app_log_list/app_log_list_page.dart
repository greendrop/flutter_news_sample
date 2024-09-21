import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_log_list/entity/app_log_file.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_app_log_files.dart';
import 'package:flutter_news_sample/feature/app_log_list/widget/app_log_list_page.dart'
    as feature;
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppLogListPage extends StatelessWidget {
  const AppLogListPage({
    super.key,
    this.isLoading = false,
    this.isEmpty = false,
  });

  final bool isLoading;
  final bool isEmpty;

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

      return (
        state: state,
        fetch: fetch,
      );
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
    );
  }
}

@UseCase(
  name: 'Default',
  type: AppLogListPage,
)
Widget buildAppLogListPageDefaultUseCase(BuildContext context) {
  return const AppLogListPage();
}

@UseCase(
  name: 'Loading',
  type: AppLogListPage,
)
Widget buildAppLogListPageLoadingUseCase(BuildContext context) {
  return const AppLogListPage(isLoading: true);
}

@UseCase(
  name: 'Empty',
  type: AppLogListPage,
)
Widget buildAppLogListPageEmptyUseCase(BuildContext context) {
  return const AppLogListPage(isEmpty: true);
}
