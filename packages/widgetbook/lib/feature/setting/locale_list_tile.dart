// ignore: depend_on_referenced_packages
import 'package:app/feature/setting/widget/locale_list_tile.dart' as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class LocaleListTile extends StatelessWidget {
  const LocaleListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return feature.LocaleListTile(onTap: onTap);
  }
}

@UseCase(
  name: 'Enabled',
  type: LocaleListTile,
)
Widget buildLocaleListTileEnabledUseCase(BuildContext context) {
  return LocaleListTile(onTap: () {});
}

@UseCase(
  name: 'Disabled',
  type: LocaleListTile,
)
Widget buildLocaleListTileDisabledUseCase(BuildContext context) {
  return const LocaleListTile();
}
