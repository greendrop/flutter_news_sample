import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:go_router/go_router.dart';

typedef UsePushDevToolPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushDevToolPage = UsePushDevToolPageReturn Function();

const String _hookName = 'usePushDevToolPage';

UsePushDevToolPageReturn usePushDevToolPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return context.pushNamed<void>(
      DevToolPage.routeName,
    );
  });

  return (run: run,);
}
