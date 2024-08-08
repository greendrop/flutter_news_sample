import 'package:flutter_news_sample/feature/locale_setting/repository/locale_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_repository.g.dart';

@Riverpod(keepAlive: true)
LocaleRepository localeRepository(LocaleRepositoryRef ref) {
  return LocaleRepository(ref: ref);
}
