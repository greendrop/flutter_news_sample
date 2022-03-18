// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/repositories/theme_mode_repository.dart';

class ThemeModeStateNotifier extends StateNotifier<ThemeMode> {
  ThemeModeStateNotifier({
    required this.ref,
    ThemeModeRepository? themeModeRepository,
  }) : super(ThemeMode.system) {
    this.themeModeRepository = themeModeRepository ?? ThemeModeRepository();
  }

  Ref ref;
  late ThemeModeRepository themeModeRepository;

  Future<void> initialize() async {
    state = await themeModeRepository.fetch();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await themeModeRepository.update(themeMode);
  }
}
