import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

part 'url_launcher_wrapper.g.dart';

class UrlLauncherWrapper {
  Future<bool> canLaunchUrl(Uri url) async {
    return url_launcher.canLaunchUrl(url);
  }

  Future<bool> launchUrl(
    Uri url, {
    url_launcher.LaunchMode mode = url_launcher.LaunchMode.platformDefault,
    url_launcher.WebViewConfiguration webViewConfiguration =
        const url_launcher.WebViewConfiguration(),
    String? webOnlyWindowName,
  }) {
    return url_launcher.launchUrl(
      url,
      mode: mode,
      webViewConfiguration: webViewConfiguration,
      webOnlyWindowName: webOnlyWindowName,
    );
  }
}

@riverpod
UrlLauncherWrapper urlLauncherWrapper(UrlLauncherWrapperRef ref) {
  return UrlLauncherWrapper();
}
