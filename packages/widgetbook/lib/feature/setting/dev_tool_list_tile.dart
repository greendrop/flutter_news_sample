import 'package:app/feature/setting/widget/dev_tool_list_tile.dart' as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class DevToolListTile extends StatelessWidget {
  const DevToolListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.DevToolListTile(onTap: onTap);
  }
}

Widget buildDevToolListTileEnabled(BuildContext context) {
  return DevToolListTile(onTap: () {});
}

Widget buildDevToolListTileDisabled(BuildContext context) {
  return const DevToolListTile();
}

@UseCase(name: 'Enabled', type: DevToolListTile)
Widget buildDevToolListTileEnabledUseCase(BuildContext context) {
  return buildDevToolListTileEnabled(context);
}

@UseCase(name: 'Disabled', type: DevToolListTile)
Widget buildDevToolListTileDisabledUseCase(BuildContext context) {
  return buildDevToolListTileDisabled(context);
}
