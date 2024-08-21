import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/repository/theme_mode_repository.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_notifier.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class MockThemeModeRepository extends Mock implements ThemeModeRepository {}

void main() {
  group('ThemeModeNotifier', () {
    group('#initialize', () {
      test('themeModeRepository.fetchが呼ばれること', () async {
        final themeModeRepository = MockThemeModeRepository();
        final container = ProviderContainer(
          overrides: [
            themeModeRepositoryProvider.overrideWithValue(themeModeRepository),
          ],
        );

        when(themeModeRepository.fetch)
            .thenAnswer((_) async => ThemeMode.system);

        final notifier = container.read(themeModeNotifierProvider.notifier);
        await notifier.initialize();

        verify(themeModeRepository.fetch).called(1);
      });
    });
  });

  group('#update', () {
    test('themeModeRepository.updateが呼ばれること', () async {
      final themeModeRepository = MockThemeModeRepository();
      final container = ProviderContainer(
        overrides: [
          themeModeRepositoryProvider.overrideWithValue(themeModeRepository),
        ],
      );

      when(() => themeModeRepository.update(ThemeMode.light))
          .thenAnswer((_) async {});

      final notifier = container.read(themeModeNotifierProvider.notifier);
      await notifier.setThemeMode(ThemeMode.light);

      verify(() => themeModeRepository.update(ThemeMode.light)).called(1);
    });
  });
}
