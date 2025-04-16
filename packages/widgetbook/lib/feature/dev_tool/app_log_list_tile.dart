import 'package:app/feature/dev_tool/widget/app_log_list_tile.dart' as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppLogListTile extends StatelessWidget {
  const AppLogListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.AppLogListTile(onTap: onTap);
  }
}

Widget buildAppLogListTileEnabled(BuildContext context) {
  return AppLogListTile(onTap: () {});
}

Widget buildAppLogListTileDisabled(BuildContext context) {
  return const AppLogListTile();
}

@UseCase(name: 'Enabled', type: AppLogListTile)
Widget buildAppLogListTileEnabledUseCase(BuildContext context) {
  return buildAppLogListTileEnabled(context);
}

@UseCase(name: 'Disabled', type: AppLogListTile)
Widget buildAppLogListTileDisabledUseCase(BuildContext context) {
  return buildAppLogListTileDisabled(context);
}
