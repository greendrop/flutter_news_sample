import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart'
    as feature;
import 'package:widgetbook/widgetbook.dart';
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
  name: 'Default',
  type: LocaleListTile,
)
Widget buildLocaleListTileDefaultUseCase(BuildContext context) {
  return LocaleListTile(
    onTap: context.knobs.boolean(label: 'Enabled', initialValue: true)
        ? () {}
        : null,
  );
}
