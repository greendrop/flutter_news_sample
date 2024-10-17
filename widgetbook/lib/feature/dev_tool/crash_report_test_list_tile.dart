import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/crash_report_test_list_tile.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class CrashReportListTile extends StatelessWidget {
  const CrashReportListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.CrashReportListTile(onTap: onTap);
  }
}

@UseCase(
  name: 'Enabled',
  type: CrashReportListTile,
)
Widget buildCrashReportListTileEnabledUseCase(BuildContext context) {
  return CrashReportListTile(onTap: () {});
}

@UseCase(
  name: 'Disabled',
  type: CrashReportListTile,
)
Widget buildCrashReportListTileDisabledUseCase(BuildContext context) {
  return const CrashReportListTile();
}
