import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/dev_tool_list_tile.dart'
    as feature;
import 'package:widgetbook/widgetbook.dart';
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
  name: 'Default',
  type: DevToolListTile,
)
Widget buildDevToolListTileDefaultUseCase(BuildContext context) {
  return DevToolListTile(
    onTap: context.knobs.boolean(label: 'Enabled', initialValue: true)
        ? () {}
        : null,
  );
}
