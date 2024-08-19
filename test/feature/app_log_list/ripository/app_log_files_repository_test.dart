import 'dart:io';

import 'package:flutter_news_sample/feature/app_log_list/riverpod/app_log_files_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './app_log_files_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Directory>(),
])
void main() {
  group('AppLogFilesRepository', () {
    group('#fetch', () {
      test('ファイル一覧が返すこと', () async {
        final directory = MockDirectory();
        final files = [File('path/to/file1'), File('path/to/file2')];

        when(directory.list()).thenAnswer((_) => Stream.fromIterable(files));

        final container = ProviderContainer();

        final repository = container.read(appLogFilesRepositoryProvider);
        final result = await repository.fetch(directory: directory);

        expect(result, files);
      });
    });
  });
}
