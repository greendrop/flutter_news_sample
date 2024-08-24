import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_detail_route_data_provider.g.dart';

@riverpod
AppLogDetailRouteData appLogDetailRouteData(
  AppLogDetailRouteDataRef ref, {
  required String filename,
}) {
  return AppLogDetailRouteData(filename: filename);
}
