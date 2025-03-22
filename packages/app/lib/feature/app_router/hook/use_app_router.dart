import 'package:app/feature/app_logger/hook/use_app_logger.dart';
import 'package:app/feature/app_router/navigator_observer/logger_navigator_observer.dart';
import 'package:app/feature/app_router/route_data/app_route_data.dart';
import 'package:go_router/go_router.dart';

typedef UseAppRouter = GoRouter Function({String initialLocation});

GoRouter useAppRouterImpl({String initialLocation = '/news_articles'}) {
  final appLogger = useAppLogger();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialLocation,
    routes: $appRoutes,
    // NOTE： ログイン状態を判断・リダイレクトなどを行いたい場合、 redirect, refreshListenable を使用する
    // redirect: (context, state) {
    //   return null;
    // },
    // refreshListenable: null,
    observers: [
      LoggerNavigatorObserver(logger: appLogger),
    ],
  );
}

const UseAppRouter useAppRouter = useAppRouterImpl;
