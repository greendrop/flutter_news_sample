import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dev_tool_route_data.g.dart';

@riverpod
DevToolRouteData devToolRouteData(DevToolRouteDataRef ref) {
  return DevToolRouteData();
}
