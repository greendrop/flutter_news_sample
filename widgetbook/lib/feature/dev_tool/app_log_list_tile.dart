import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppLogListTile extends StatelessWidget {
  const AppLogListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.AppLogListTile(onTap: onTap);
  }
}

@UseCase(
  name: 'Enabled',
  type: AppLogListTile,
)
Widget buildAppLogListTileEnabledUseCase(BuildContext context) {
  return AppLogListTile(onTap: () {});
}

@UseCase(
  name: 'Disabled',
  type: AppLogListTile,
)
Widget buildAppLogListTileDisabledUseCase(BuildContext context) {
  return const AppLogListTile();
}
