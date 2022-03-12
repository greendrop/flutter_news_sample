// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:flutter_news_sample/repositories/locale_repository.dart';

class LocaleStateNotifier extends StateNotifier<Locale?> {
  LocaleStateNotifier({LocaleRepository? localeRepository}) : super(null) {
    this.localeRepository = localeRepository ?? LocaleRepository();
  }

  late LocaleRepository localeRepository;

  Future<void> initialize() async {
    state = await localeRepository.fetch();
  }

  Future<void> setLocale(Locale? locale) async {
    state = locale;
    await localeRepository.update(locale);
  }
}
