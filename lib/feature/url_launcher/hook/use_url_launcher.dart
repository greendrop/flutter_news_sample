import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

export 'package:url_launcher/url_launcher.dart' show LaunchMode;

typedef UseUrlLauncherReturn = ({
  Future<bool> Function(Uri url) canLaunchUrl,
  Future<bool> Function(
    Uri url, {
    url_launcher.LaunchMode mode,
    url_launcher.WebViewConfiguration webViewConfiguration,
    String? webOnlyWindowName,
  }) launchUrl,
});

typedef UseUrlLauncher = UseUrlLauncherReturn Function();

const String _hookName = 'UseUrlLauncher';

UseUrlLauncherReturn useUrlLauncher() {
  final context = useContext();
  final ref = context as WidgetRef;

  final canLaunchUrl = useCallback(
    (Uri url) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#canLaunchUrl',
          {'url': url},
        ],
      );

      return url_launcher.canLaunchUrl(url);
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

      return url_launcher.launchUrl(
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
