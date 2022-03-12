// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/notifiers/locale_state_notifier.dart';

final localeStateNotifierProvider =
    StateNotifierProvider<LocaleStateNotifier, Locale?>(
  (_) => LocaleStateNotifier(),
);
