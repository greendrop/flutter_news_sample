import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/about_app_icon.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AboutAppIcon extends StatelessWidget {
  const AboutAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const feature.AboutAppIcon();
  }
}

@UseCase(
  name: 'Default',
  type: AboutAppIcon,
)
Widget buildAboutAppIconDefaultUseCase(BuildContext context) {
  return const AboutAppIcon();
}
