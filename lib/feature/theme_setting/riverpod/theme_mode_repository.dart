import 'package:flutter_news_sample/feature/theme_setting/repository/theme_mode_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_repository.g.dart';

@Riverpod(keepAlive: true)
ThemeModeRepository themeModeRepository(ThemeModeRepositoryRef ref) {
  return ThemeModeRepository(ref: ref);
}
