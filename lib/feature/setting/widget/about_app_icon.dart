import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/assets.gen.dart';
import 'package:flutter_news_sample/config/design_token/radius.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutAppIcon extends HookConsumerWidget {
  const AboutAppIcon({super.key});

  static const _size = 48.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      key: const Key('AboutAppIconContainer'),
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignTokenRadius.sm),
        image: DecorationImage(
          image: AssetImage(Assets.icons.appIcon.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
