part of 'app_route_data.dart';

class AppLogDetailRouteData extends GoRouteData {
  const AppLogDetailRouteData({
    required this.filename,
  });

  static final $parentNavigatorKey = rootNavigatorKey;

  final String filename;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AppLogDetailPage(filename: filename);
  }
}
