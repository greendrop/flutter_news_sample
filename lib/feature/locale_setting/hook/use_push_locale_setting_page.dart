import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:go_router/go_router.dart';

typedef UsePushLocaleSettingPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushLocaleSettingPage = UsePushLocaleSettingPageReturn Function();

const String _hookName = 'usePushLocaleSettingPage';

UsePushLocaleSettingPageReturn usePushLocaleSettingPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return context.pushNamed<void>(
      LocaleSettingPage.routeName,
    );
  });

  return (run: run,);
}
