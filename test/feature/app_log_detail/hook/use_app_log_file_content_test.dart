import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:flutter_news_sample/feature/app_log_detail/repository/app_log_file_repository.dart';
import 'package:flutter_news_sample/feature/app_log_detail/riverpod/app_log_file_repository.dart';
import 'package:flutter_news_sample/feature/app_logger/repository/app_logger_repository.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

class MockFile extends Mock implements File {}

class MockAppLoggerDirectoryRepository extends Mock
    implements AppLoggerDirectoryRepository {}

class MockAppLogFileRepository extends Mock implements AppLogFileRepository {}

void main() {
  group('useAppLogFileContent', () {
    group('#initialize', () {
      testWidgets(
          [
            'appLogFileRepository.fetchが呼ばれること',
            'AppLogFilesのstateに設定されること',
          ].join(', '), (tester) async {
        late UseAppLogFileContentReturn appLogFileContent;

        final directory = Directory('path/to');
        const filename = 'dummy';
        final appLoggerDirectoryRepository = MockAppLoggerDirectoryRepository();
        final appLogFileRepository = MockAppLogFileRepository();
        final file = MockFile();

        when(appLoggerDirectoryRepository.fetch)
            .thenAnswer((_) async => directory);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              appLoggerDirectoryRepositoryProvider
                  .overrideWithValue(appLoggerDirectoryRepository),
              appLogFileRepositoryProvider
                  .overrideWithValue(appLogFileRepository),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  useEffect(
                    () {
                      ref
                          .read(appLoggerDirectoryProvider.notifier)
                          .initialize();
                      return () {};
                    },
                    [],
                  );

                  appLogFileContent = useAppLogFileContent(filename: filename);
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(
          () => appLogFileRepository.fetch(
            directory: directory,
            filename: filename,
          ),
        ).thenAnswer((_) async => file);
        when(file.readAsString).thenAnswer((_) async => 'dummy');

        await appLogFileContent.fetch();
        await tester.pumpAndSettle();

        verify(appLoggerDirectoryRepository.fetch).called(1);
        verify(
          () => appLogFileRepository.fetch(
            directory: directory,
            filename: filename,
          ),
        ).called(1);

        expect(appLogFileContent.state.hasValue, isTrue);
        expect(appLogFileContent.state.hasError, isFalse);
        expect(appLogFileContent.state.isLoading, isFalse);
        expect(appLogFileContent.state.valueOrNull, 'dummy');
      });
    });
  });
}
