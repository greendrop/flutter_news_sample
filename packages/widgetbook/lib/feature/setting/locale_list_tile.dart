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

Widget buildLocaleListTileEnabled(BuildContext context) {
  return LocaleListTile(onTap: () {});
}

Widget buildLocaleListTileDisabled(BuildContext context) {
  return const LocaleListTile();
}

@UseCase(name: 'Enabled', type: LocaleListTile)
Widget buildLocaleListTileEnabledUseCase(BuildContext context) {
  return buildLocaleListTileEnabled(context);
}

@UseCase(name: 'Disabled', type: LocaleListTile)
Widget buildLocaleListTileDisabledUseCase(BuildContext context) {
  return buildLocaleListTileDisabled(context);
}
