import 'package:app/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:app/feature/app_log_detail/widget/app_log_detail_page.dart'
    as feature;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppLogDetailPage extends StatelessWidget {
  const AppLogDetailPage({
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
            return '{"level":"info",'
                '"timestamp":"${DateTime.utc(2024, 1, 1, 0, index).toUtc()}",'
                '"message":"message${index + 1}"}';
          }).join('\n'),
        );
      }

      Future<void> fetch() async {}

      return (state: state, fetch: fetch);
    }

    return feature.AppLogDetailPage(
      filename: 'test1.log',
      useAppLogFileContent: useAppLogFileContent,
      stopLoadingIndicator: stopLoadingIndicator,
    );
  }
}

Widget buildAppLogDetailPageDefault(BuildContext context) {
  return const AppLogDetailPage();
}

Widget buildAppLogDetailPageLoading(
  BuildContext context, {
  bool stopLoadingIndicator = false,
}) {
  return const AppLogDetailPage(isLoading: true, stopLoadingIndicator: true);
}

Widget buildAppLogDetailPageEmpty(BuildContext context) {
  return const AppLogDetailPage(isEmpty: true);
}

@UseCase(name: 'Default', type: AppLogDetailPage)
Widget buildAppLogDetailPageDefaultUseCase(BuildContext context) {
  return buildAppLogDetailPageDefault(context);
}

@UseCase(name: 'Loading', type: AppLogDetailPage)
Widget buildAppLogDetailPageLoadingUseCase(
  BuildContext context, {
  bool stopLoadingIndicator = false,
}) {
  return buildAppLogDetailPageLoading(
    context,
    stopLoadingIndicator: stopLoadingIndicator,
  );
}

@UseCase(name: 'Empty', type: AppLogDetailPage)
Widget buildAppLogDetailPageEmptyUseCase(BuildContext context) {
  return buildAppLogDetailPageEmpty(context);
}
