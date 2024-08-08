import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:flutter_news_sample/feature/theme_setting/repository/theme_mode_repository.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';
import './use_theme_mode_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ThemeModeRepository>(),
])
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

        when(themeModeRepository.fetch())
            .thenAnswer((_) async => ThemeMode.system);

        await themeMode.initialize();

        verify(themeModeRepository.fetch());
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

        when(themeModeRepository.update(ThemeMode.system))
            .thenAnswer((_) async {});

        await themeMode.update(ThemeMode.system);

        verify(themeModeRepository.update(ThemeMode.system));
      });
    });
  });
}
