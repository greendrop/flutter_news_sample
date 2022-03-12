// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:flutter_news_sample/repositories/theme_mode_repository.dart';

class ThemeModeStateNotifier extends StateNotifier<ThemeMode> {
  ThemeModeStateNotifier({ThemeModeRepository? themeModeRepository})
      : super(ThemeMode.system) {
    this.themeModeRepository = themeModeRepository ?? ThemeModeRepository();
  }

  late ThemeModeRepository themeModeRepository;

  Future<void> initialize() async {
    state = await themeModeRepository.fetch();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await themeModeRepository.update(themeMode);
  }
}
