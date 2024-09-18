import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/app_about_list_tile.dart'
    as feature;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppAboutListTile extends StatelessWidget {
  const AppAboutListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.AppAboutListTile(onTap: onTap);
  }
}

@UseCase(
  name: 'Default',
  type: AppAboutListTile,
)
Widget buildAppAboutListTileDefaultUseCase(BuildContext context) {
  return AppAboutListTile(
    onTap: context.knobs.boolean(label: 'Enabled', initialValue: true)
        ? () {}
        : null,
  );
}
