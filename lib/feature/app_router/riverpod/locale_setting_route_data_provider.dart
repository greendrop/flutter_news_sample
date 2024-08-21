import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_setting_route_data_provider.g.dart';

@riverpod
LocaleSettingRouteData localeSettingRouteData(LocaleSettingRouteDataRef ref) {
  return LocaleSettingRouteData();
}
