import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  Future<void> initialize() async {
    state = await ref.read(themeModeRepositoryProvider).fetch();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await ref.read(themeModeRepositoryProvider).update(themeMode);
  }
}
