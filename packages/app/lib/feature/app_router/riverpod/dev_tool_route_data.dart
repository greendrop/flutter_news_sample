import 'package:app/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dev_tool_route_data.g.dart';

@riverpod
DevToolRouteData devToolRouteData(Ref ref) {
  return DevToolRouteData();
}
