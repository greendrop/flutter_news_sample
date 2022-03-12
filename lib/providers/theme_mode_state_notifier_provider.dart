// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/notifiers/theme_mode_state_notifier.dart';

final themeModeStateNotifierProvider =
    StateNotifierProvider<ThemeModeStateNotifier, ThemeMode>(
  (_) => ThemeModeStateNotifier(),
);
