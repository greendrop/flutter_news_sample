import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/url_launcher/riverpod/url_launcher_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

export 'package:url_launcher/url_launcher.dart' show LaunchMode;

typedef UseUrlLauncherWrapperReturn = ({
  Future<bool> Function(Uri url) canLaunchUrl,
  Future<bool> Function(
    Uri url, {
    url_launcher.LaunchMode mode,
    url_launcher.WebViewConfiguration webViewConfiguration,
    String? webOnlyWindowName,
  }) launchUrl,
});

typedef UseUrlLauncherWrapper = UseUrlLauncherWrapperReturn Function();

const String _hookName = 'UseUrlLauncherWrapper';

UseUrlLauncherWrapperReturn useUrlLauncherWrapper() {
  final context = useContext();
  final ref = context as WidgetRef;

  final canLaunchUrl = useCallback(
    (Uri url) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#fetch',
          {'url': url},
        ],
      );

      return ref.read(urlLauncherWrapperProvider).canLaunchUrl(url);
    },
    [],
  );

  final launchUrl = useCallback(
    (
      Uri url, {
      url_launcher.LaunchMode mode = url_launcher.LaunchMode.platformDefault,
      url_launcher.WebViewConfiguration webViewConfiguration =
          const url_launcher.WebViewConfiguration(),
      String? webOnlyWindowName,
    }) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#launchUrl',
          {
            'url': url,
            'mode': mode,
            'webViewConfiguration': webViewConfiguration,
            'webOnlyWindowName': webOnlyWindowName,
          },
        ],
      );

      return ref.read(urlLauncherWrapperProvider).launchUrl(
            url,
            mode: mode,
            webViewConfiguration: webViewConfiguration,
            webOnlyWindowName: webOnlyWindowName,
          );
    },
    [],
  );

  return (
    canLaunchUrl: canLaunchUrl,
    launchUrl: launchUrl,
  );
}
