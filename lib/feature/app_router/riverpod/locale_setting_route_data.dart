import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_setting_route_data.g.dart';

@riverpod
LocaleSettingRouteData localeSettingRouteData(Ref ref) {
  return LocaleSettingRouteData();
}
