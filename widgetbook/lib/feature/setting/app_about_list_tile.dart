import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/app_about_list_tile.dart'
    as feature;
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
  name: 'Enabled',
  type: AppAboutListTile,
)
Widget buildAppAboutListTileEnabledUseCase(BuildContext context) {
  return AppAboutListTile(onTap: () {});
}

@UseCase(
  name: 'Disabled',
  type: AppAboutListTile,
)
Widget buildAppAboutListTileDisabledUseCase(BuildContext context) {
  return const AppAboutListTile();
}
