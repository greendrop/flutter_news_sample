// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/repositories/locale_repository.dart';

class LocaleStateNotifier extends StateNotifier<Locale?> {
  LocaleStateNotifier({
    required this.ref,
    LocaleRepository? localeRepository,
  }) : super(null) {
    this.localeRepository = localeRepository ?? LocaleRepository();
  }

  Ref ref;
  late LocaleRepository localeRepository;

  Future<void> initialize() async {
    state = await localeRepository.fetch();
  }

  Future<void> setLocale(Locale? locale) async {
    state = locale;
    await localeRepository.update(locale);
  }
}
