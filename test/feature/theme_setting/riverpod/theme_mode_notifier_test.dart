import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/repository/theme_mode_repository.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_notifier.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './theme_mode_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ThemeModeRepository>(),
])
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

        final notifier = container.read(themeModeNotifierProvider.notifier);
        await notifier.initialize();

        verify(themeModeRepository.fetch());
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

      final notifier = container.read(themeModeNotifierProvider.notifier);
      await notifier.setThemeMode(ThemeMode.light);

      verify(themeModeRepository.update(ThemeMode.light));
    });
  });
}
