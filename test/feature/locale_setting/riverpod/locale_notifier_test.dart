import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/locale_setting/repository/locale_repository.dart';
import 'package:flutter_news_sample/feature/locale_setting/riverpod/locale_notifier.dart';
import 'package:flutter_news_sample/feature/locale_setting/riverpod/locale_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/logger.dart';

class MockLocaleRepository extends Mock implements LocaleRepository {}

void main() {
  group('LocaleNotifier', () {
    group('#initialize', () {
      test('localeRepository.fetchが呼ばれること', () async {
        final localeRepository = MockLocaleRepository();
        final container = ProviderContainer(
          overrides: [
            appLoggerProvider.overrideWithValue(buildAppTestLogger()),
            localeRepositoryProvider.overrideWithValue(localeRepository),
          ],
        );

        when(localeRepository.fetch)
            .thenAnswer((_) async => const Locale('ja'));

        final notifier = container.read(localeNotifierProvider.notifier);
        await notifier.initialize();

        verify(localeRepository.fetch).called(1);
      });
    });
  });

  group('#setLocale', () {
    test('localeRepository.updateが呼ばれること', () async {
      final localeRepository = MockLocaleRepository();
      final container = ProviderContainer(
        overrides: [
          appLoggerProvider.overrideWithValue(buildAppTestLogger()),
          localeRepositoryProvider.overrideWithValue(localeRepository),
        ],
      );

      when(() => localeRepository.update(const Locale('ja')))
          .thenAnswer((_) async {});

      final notifier = container.read(localeNotifierProvider.notifier);
      await notifier.setLocale(const Locale('ja'));

      verify(() => localeRepository.update(const Locale('ja'))).called(1);
    });
  });
}
