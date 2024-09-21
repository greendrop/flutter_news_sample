import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_push_app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class DevToolPage extends StatelessWidget {
  const DevToolPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UsePushAppLogListPageReturn usePushAppLogListPage() {
      Future<void> run() {
        return Future.value();
      }

      return (run: run);
    }

    return feature.DevToolPage(
      usePushAppLogListPage: usePushAppLogListPage,
    );
  }
}

@UseCase(
  name: 'Default',
  type: DevToolPage,
)
Widget buildAppLogListPageDefaultUseCase(BuildContext context) {
  return const DevToolPage();
}
