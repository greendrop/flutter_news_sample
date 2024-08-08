import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/riverpod/locale_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale? build() {
    return null;
  }

  Future<void> initialize() async {
    state = await ref.watch(localeRepositoryProvider).fetch();
  }

  Future<void> setLocale(Locale? locale) async {
    state = locale;
    await ref.watch(localeRepositoryProvider).update(locale);
  }
}
