part of 'app_route_data.dart';

class DevToolRouteData extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DevToolPage();
  }
}
