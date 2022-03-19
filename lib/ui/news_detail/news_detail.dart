// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends HookConsumerWidget {
  const NewsDetailPage({
    Key? key,
  }) : super(key: key);

  static const _webViewIndex = 0;
  static const _progressIndex = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryParam = RouteData.of(context).queryParams;
    final title = queryParam.getString('title');
    final url = queryParam.getString('url');
    final webViewController = useState<InAppWebViewController?>(null);
    final stackIndex = useState(_progressIndex);
    final promptTextController = useTextEditingController();
    final initialOptions = useMemoized(() {
      return InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
        ),
      );
    });
    final pullToRefreshController = useMemoized(() {
      final themeData = Theme.of(context);
      return PullToRefreshController(
        options: PullToRefreshOptions(
          color: themeData.colorScheme.primary,
          backgroundColor: themeData.canvasColor,
        ),
        onRefresh: () async {
          if (Platform.isAndroid) {
            await webViewController.value?.reload();
          } else if (Platform.isIOS) {
            await webViewController.value?.loadUrl(
              urlRequest:
                  URLRequest(url: await webViewController.value?.getUrl()),
            );
          }
        },
      );
    });

    final appBar = AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Platform.isIOS ? FontAwesomeIcons.safari : FontAwesomeIcons.chrome,
          ),
          onPressed: () => launch(url),
        ),
      ],
    );

    final body = IndexedStack(
      index: stackIndex.value,
      children: <Widget>[
        InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(url)),
          initialOptions: initialOptions,
          pullToRefreshController: pullToRefreshController,
          onWebViewCreated: (controller) {
            stackIndex.value = _progressIndex;
            webViewController.value = controller;
          },
          onLoadStart: (controller, url) {
            stackIndex.value = _progressIndex;
          },
          onLoadStop: (controller, url) async {
            await pullToRefreshController.endRefreshing();
            stackIndex.value = _webViewIndex;
          },
          onLoadError: (controller, url, code, message) async {
            await pullToRefreshController.endRefreshing();
            stackIndex.value = _webViewIndex;
          },
          onLoadHttpError: (controller, url, statusCode, description) async {
            await pullToRefreshController.endRefreshing();
            stackIndex.value = _webViewIndex;
          },
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT,
            );
          },
          onProgressChanged: (controller, progress) async {
            if (progress >= 100) {
              await pullToRefreshController.endRefreshing();
              stackIndex.value = _webViewIndex;
            }
          },
          onConsoleMessage: (controller, consoleMessage) {
            debugPrint(consoleMessage.toString());
          },
          onJsAlert: (controller, jsAlertRequest) {
            return _onJsAlert(context, controller, jsAlertRequest);
          },
          onJsConfirm: (controller, jsConfirmRequest) {
            return _onJsConfirm(context, controller, jsConfirmRequest);
          },
          onJsPrompt: (controller, jsPromptRequest) async {
            return _onJsPrompt(
              context,
              promptTextController,
              controller,
              jsPromptRequest,
            );
          },
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );

    return WillPopScope(
      onWillPop: () async {
        if (webViewController.value != null &&
            await webViewController.value!.canGoBack()) {
          await webViewController.value!.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(appBar: appBar, body: body),
    );
  }

  Future<JsAlertResponse?> _onJsAlert(
    BuildContext context,
    InAppWebViewController controller,
    JsAlertRequest jsAlertRequest,
  ) async {
    final completer = Completer<JsAlertResponse?>();
    final response = JsAlertResponse();
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(jsAlertRequest.message.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'CLOSE'),
              child: Text(L10n.of(context)!.close),
            ),
          ],
        );
      },
    );
    response.handledByClient = true;
    completer.complete(response);
    return completer.future;
  }

  Future<JsConfirmResponse?> _onJsConfirm(
    BuildContext context,
    InAppWebViewController controller,
    JsConfirmRequest jsConfirmRequest,
  ) async {
    final completer = Completer<JsConfirmResponse>();
    final response = JsConfirmResponse();
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final l10n = L10n.of(context)!;

        return AlertDialog(
          content: Text(jsConfirmRequest.message.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'CANCEL'),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
    response
      ..handledByClient = true
      ..action = result == 'OK'
          ? JsConfirmResponseAction.CONFIRM
          : JsConfirmResponseAction.CANCEL;
    completer.complete(response);
    return completer.future;
  }

  Future<JsPromptResponse?> _onJsPrompt(
    BuildContext context,
    TextEditingController promptTextController,
    InAppWebViewController controller,
    JsPromptRequest jsPromptRequest,
  ) async {
    final completer = Completer<JsPromptResponse>();
    final response = JsPromptResponse();

    promptTextController.text = '';
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final l10n = L10n.of(context)!;

        return AlertDialog(
          content: TextField(
            controller: promptTextController,
            decoration: InputDecoration(
              hintText: jsPromptRequest.message.toString(),
            ),
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'CANCEL'),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
    response
      ..handledByClient = true
      ..value = promptTextController.text
      ..action = result == 'OK'
          ? JsPromptResponseAction.CONFIRM
          : JsPromptResponseAction.CANCEL;
    completer.complete(response);
    return completer.future;
  }
}
