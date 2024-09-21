import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart'
    as feature;
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppLogDetailPage extends StatelessWidget {
  const AppLogDetailPage({
    super.key,
    this.isLoading = false,
    this.isEmpty = false,
  });

  final bool isLoading;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    UseAppLogFileContentReturn useAppLogFileContent({
      required String filename,
    }) {
      late AsyncValue<String> state;

      if (isLoading) {
        state = const AsyncValue.loading();
      } else if (isEmpty) {
        state = const AsyncValue.data('');
      } else {
        state = AsyncValue.data(
          List.generate(30, (index) {
            // ignore: lines_longer_than_80_chars
            return '{"level":"info","timestamp":"${DateTime.utc(2024, 1, 1, 0, index).toUtc()}","message":"message${index + 1}"}';
          }).join('\n'),
        );
      }

      Future<void> fetch() async {}

      return (
        state: state,
        fetch: fetch,
      );
    }

    return feature.AppLogDetailPage(
      filename: 'test1.log',
      useAppLogFileContent: useAppLogFileContent,
    );
  }
}

@UseCase(
  name: 'Default',
  type: AppLogDetailPage,
)
Widget buildAppLogDetailPageDefaultUseCase(BuildContext context) {
  return const AppLogDetailPage();
}

@UseCase(
  name: 'Loading',
  type: AppLogDetailPage,
)
Widget buildAppLogDetailPageLoadingUseCase(BuildContext context) {
  return const AppLogDetailPage(isLoading: true);
}

@UseCase(
  name: 'Empty',
  type: AppLogDetailPage,
)
Widget buildAppLogDetailPageEmptyUseCase(BuildContext context) {
  return const AppLogDetailPage(isEmpty: true);
}
