import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestTranslationProvider extends HookConsumerWidget {
  const TestTranslationProvider({
    super.key,
    required this.builder,
    this.locale = const Locale('ja'),
  });

  final WidgetBuilder builder;
  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.microtask(() {
          LocaleSettings.setLocaleRaw(locale.toString());
        });
        return () {};
      },
      [],
    );

    return TranslationProvider(child: Builder(builder: builder));
  }
}
