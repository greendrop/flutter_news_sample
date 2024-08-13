import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeModeRepository', () {
    group('#fetch', () {
      test('空文字で保存されている場合、ThemeMode.systemを返すこと', () async {
        SharedPreferences.setMockInitialValues({
          'themeMode': '',
        });
        final container = ProviderContainer();

        final repository = container.read(themeModeRepositoryProvider);
        final themeMode = await repository.fetch();

        expect(themeMode, ThemeMode.system);
      });

      test('ThemeMode.lightで保存されている場合、ThemeMode.lightを返すこと', () async {
        SharedPreferences.setMockInitialValues({
          'themeMode': 'light',
        });
        final container = ProviderContainer();

        final repository = container.read(themeModeRepositoryProvider);
        final themeMode = await repository.fetch();

        expect(themeMode, ThemeMode.light);
      });
    });

    group('#update', () {
      test('#指定した値で更新されること', () async {
        SharedPreferences.setMockInitialValues({
          'themeMode': 'light',
        });
        final container = ProviderContainer();

        final repository = container.read(themeModeRepositoryProvider);
        await repository.update(ThemeMode.dark);
        final themeMode = await repository.fetch();

        expect(themeMode, ThemeMode.dark);
      });
    });
  });
}
