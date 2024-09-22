import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/dev_tool_list_tile.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class DevToolListTile extends StatelessWidget {
  const DevToolListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.DevToolListTile(onTap: onTap);
  }
}

@UseCase(
  name: 'Enabled',
  type: DevToolListTile,
)
Widget buildDevToolListTileEnabledUseCase(BuildContext context) {
  return DevToolListTile(onTap: () {});
}

@UseCase(
  name: 'Disabled',
  type: DevToolListTile,
)
Widget buildDevToolListTileDisabledUseCase(BuildContext context) {
  return const DevToolListTile();
}
