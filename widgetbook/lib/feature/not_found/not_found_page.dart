import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/not_found/widget/not_found_page.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const feature.NotFoundPage();
  }
}

@UseCase(
  name: 'Default',
  type: NotFoundPage,
)
Widget buildSettingDefaultUseCase(BuildContext context) {
  return const NotFoundPage();
}
