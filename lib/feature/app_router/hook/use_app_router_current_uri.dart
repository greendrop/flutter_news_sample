import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

typedef UseAppRouterCurrentUri = Uri Function();

Uri useAppRouterCurrentUriImpl() {
  return GoRouterState.of(useContext()).uri;
}

final UseAppRouterCurrentUri useAppRouterCurrentUri =
    useAppRouterCurrentUriImpl;
