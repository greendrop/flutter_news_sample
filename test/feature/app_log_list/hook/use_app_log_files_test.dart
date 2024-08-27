import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_list/entity/app_log_file.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_app_log_files.dart';
import 'package:flutter_news_sample/feature/app_log_list/ripository/app_log_files_repository.dart';
import 'package:flutter_news_sample/feature/app_log_list/riverpod/app_log_files_repository.dart';
import 'package:flutter_news_sample/feature/app_logger/repository/app_logger_repository.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/test_material_app.dart';

class MockAppLoggerDirectoryRepository extends Mock
    implements AppLoggerDirectoryRepository {}

class MockAppLogFilesRepository extends Mock implements AppLogFilesRepository {}

void main() {
  group('useAppLogFiles', () {
    group('#fetch', () {
      testWidgets(
          [
            'appLogFilesRepository.fetchが呼ばれること',
            'AppLogFilesのstateに設定されること',
          ].join(', '), (tester) async {
        late UseAppLogFilesReturn appLogFiles;

        final appLoggerDirectoryRepository = MockAppLoggerDirectoryRepository();
        final appLogFilesRepository = MockAppLogFilesRepository();

        final directory = Directory('test');
        when(appLoggerDirectoryRepository.fetch)
            .thenAnswer((_) async => directory);

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              appLoggerDirectoryRepositoryProvider
                  .overrideWithValue(appLoggerDirectoryRepository),
              appLogFilesRepositoryProvider
                  .overrideWithValue(appLogFilesRepository),
            ],
            child: HookConsumer(
              builder: (context, ref, child) {
                useEffect(
                  () {
                    ref.read(appLoggerDirectoryProvider.notifier).initialize();
                    return () {};
                  },
                  [],
                );

                appLogFiles = useAppLogFiles();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => appLogFilesRepository.fetch(directory: directory))
            .thenAnswer(
          (_) async => [
            File('test1.log'),
            File('test2.txt'),
            File('test3.log'),
          ],
        );

        await appLogFiles.fetch();
        await tester.pumpAndSettle();

        verify(() => appLogFilesRepository.fetch(directory: directory))
            .called(1);
        expect(appLogFiles.state.hasValue, isTrue);
        expect(appLogFiles.state.hasError, isFalse);
        expect(appLogFiles.state.isLoading, isFalse);
        expect(appLogFiles.state.valueOrNull, [
          AppLogFile(path: 'test1.log'),
          AppLogFile(path: 'test3.log'),
        ]);
      });
    });

    group('#fetch(isRefresh: true)', () {
      testWidgets(
          [
            'appLogFilesRepository.fetchが呼ばれること',
            'AppLogFileがstateに設定されること',
          ].join(', '), (tester) async {
        late UseAppLogFilesReturn appLogFiles;

        final appLoggerDirectoryRepository = MockAppLoggerDirectoryRepository();
        final appLogFilesRepository = MockAppLogFilesRepository();

        final directory = Directory('test');
        when(appLoggerDirectoryRepository.fetch)
            .thenAnswer((_) async => directory);

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              appLoggerDirectoryRepositoryProvider
                  .overrideWithValue(appLoggerDirectoryRepository),
              appLogFilesRepositoryProvider
                  .overrideWithValue(appLogFilesRepository),
            ],
            child: HookConsumer(
              builder: (context, ref, child) {
                useEffect(
                  () {
                    ref.read(appLoggerDirectoryProvider.notifier).initialize();
                    return () {};
                  },
                  [],
                );

                appLogFiles = useAppLogFiles();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => appLogFilesRepository.fetch(directory: directory))
            .thenAnswer(
          (_) async => [
            File('test1.log'),
            File('test2.txt'),
            File('test3.log'),
          ],
        );

        await appLogFiles.fetch(isRefresh: true);
        await tester.pumpAndSettle();

        verify(() => appLogFilesRepository.fetch(directory: directory))
            .called(1);
        expect(appLogFiles.state.hasValue, isTrue);
        expect(appLogFiles.state.hasError, isFalse);
        expect(appLogFiles.state.isLoading, isFalse);
        expect(appLogFiles.state.valueOrNull, [
          AppLogFile(path: 'test1.log'),
          AppLogFile(path: 'test3.log'),
        ]);
      });
    });
  });
}
