import 'package:app/feature/not_found/widget/not_found_page.dart' as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const feature.NotFoundPage();
  }
}

Widget buildNotFoundPageDefault(BuildContext context) {
  return const NotFoundPage();
}

@UseCase(name: 'Default', type: NotFoundPage)
Widget buildNotFoundPageDefaultUseCase(BuildContext context) {
  return buildNotFoundPageDefault(context);
}
