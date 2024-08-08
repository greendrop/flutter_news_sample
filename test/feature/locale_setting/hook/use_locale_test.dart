import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_locale.dart';
import 'package:flutter_news_sample/feature/locale_setting/repository/locale_repository.dart';
import 'package:flutter_news_sample/feature/locale_setting/riverpod/locale_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';
import './use_locale_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocaleRepository>(),
])
void main() {
  group('useLocale', () {
    group('#initialize', () {
      testWidgets('localeRepository.fetchが呼ばれること', (tester) async {
        late UseLocaleReturn locale;

        final localeRepository = MockLocaleRepository();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              localeRepositoryProvider.overrideWithValue(localeRepository),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  locale = useLocale();
                  return Container();
                },
              ),
            ),
          ),
        );

        when(localeRepository.fetch())
            .thenAnswer((_) async => const Locale('ja'));

        await locale.initialize();

        verify(localeRepository.fetch());
      });
    });

    group('#update', () {
      testWidgets('localeRepository.updateが呼ばれること', (tester) async {
        late UseLocaleReturn locale;

        final localeRepository = MockLocaleRepository();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              localeRepositoryProvider.overrideWithValue(localeRepository),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  locale = useLocale();
                  return Container();
                },
              ),
            ),
          ),
        );

        when(localeRepository.update(const Locale('en')))
            .thenAnswer((_) async {});

        await locale.update(const Locale('en'));

        verify(localeRepository.update(const Locale('en')));
      });
    });
  });
}
