import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:flutter_news_sample/feature/theme_setting/repository/theme_mode_repository.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

class MockThemeModeRepository extends Mock implements ThemeModeRepository {}

void main() {
  group('useThemeMode', () {
    group('#initialize', () {
      testWidgets('themeModeRepository.fetchが呼ばれること', (tester) async {
        late UseThemeModeReturn themeMode;

        final themeModeRepository = MockThemeModeRepository();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              themeModeRepositoryProvider
                  .overrideWithValue(themeModeRepository),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  themeMode = useThemeMode();
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(themeModeRepository.fetch)
            .thenAnswer((_) async => ThemeMode.system);

        await themeMode.initialize();

        verify(themeModeRepository.fetch).called(1);
      });
    });

    group('#update', () {
      testWidgets('themeModeRepository.updateが呼ばれること', (tester) async {
        late UseThemeModeReturn themeMode;

        final themeModeRepository = MockThemeModeRepository();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              themeModeRepositoryProvider
                  .overrideWithValue(themeModeRepository),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  themeMode = useThemeMode();
                  return Container();
                },
              ),
            ),
          ),
        );

        when(() => themeModeRepository.update(ThemeMode.system))
            .thenAnswer((_) async {});

        await themeMode.update(ThemeMode.system);

        verify(() => themeModeRepository.update(ThemeMode.system)).called(1);
      });
    });
  });
}
