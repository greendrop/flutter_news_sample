import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/dev_tool_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UsePushDevToolPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushDevToolPage = UsePushDevToolPageReturn Function();

const String _hookName = 'usePushDevToolPage';

UsePushDevToolPageReturn usePushDevToolPageImpl() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return ref.read(devToolRouteDataProvider).push<void>(context);
  });

  return (run: run,);
}

final UsePushDevToolPage usePushDevToolPage = usePushDevToolPageImpl;
