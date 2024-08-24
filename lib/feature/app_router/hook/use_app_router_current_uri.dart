import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

typedef UseAppRouterCurrentUri = Uri Function();

Uri useAppRouterCurrentUri() {
  return GoRouterState.of(useContext()).uri;
}
