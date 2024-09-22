import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/theme_list_tile.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.ThemeListTile(onTap: onTap);
  }
}

@UseCase(
  name: 'Enabled',
  type: ThemeListTile,
)
Widget buildThemeListTileEnabledUseCase(BuildContext context) {
  return ThemeListTile(onTap: () {});
}

@UseCase(
  name: 'Disabled',
  type: ThemeListTile,
)
Widget buildThemeListTileDisabledUseCase(BuildContext context) {
  return const ThemeListTile();
}
