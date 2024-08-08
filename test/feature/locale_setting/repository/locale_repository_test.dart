import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/riverpod/locale_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LocaleRepository', () {
    group('#fetch', () {
      test('空文字で保存されている場合、nullを返すこと', () async {
        SharedPreferences.setMockInitialValues({
          'locale': '',
        });
        final container = ProviderContainer();

        final repository = container.read(localeRepositoryProvider);
        final locale = await repository.fetch();

        expect(locale, null);
      });

      test('enで保存されている場合、enを返すこと', () async {
        SharedPreferences.setMockInitialValues({
          'locale': 'en',
        });
        final container = ProviderContainer();

        final repository = container.read(localeRepositoryProvider);
        final locale = await repository.fetch();

        expect(locale?.languageCode, 'en');
      });

      test('jaで保存されている場合、jaを返すこと', () async {
        SharedPreferences.setMockInitialValues({
          'locale': 'ja',
        });
        final container = ProviderContainer();

        final repository = container.read(localeRepositoryProvider);
        final locale = await repository.fetch();

        expect(locale?.languageCode, 'ja');
      });
    });

    group('#update', () {
      test('#指定した値で更新されること', () async {
        SharedPreferences.setMockInitialValues({
          'locale': 'ja',
        });
        final container = ProviderContainer();

        final repository = container.read(localeRepositoryProvider);
        await repository.update(const Locale('en'));
        final locale = await repository.fetch();

        expect(locale?.languageCode, 'en');
      });
    });
  });
}
