import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/news_article_detail/entity/webview_vertical_scroll_state.dart';
import 'package:flutter_news_sample/feature/news_article_detail/riverpod/webview_vertical_scroll_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void useWebviewVerticalScrollEffect({
  required AnimationController appBarAnimationController,
}) {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(webViewVerticalScrollStateNotifierProvider);
  useEffect(
    () {
      Future.delayed(Duration.zero, () {
        if (state.direction == WebviewVerticalScrollDirection.up) {
          appBarAnimationController.reverse();
        } else {
          appBarAnimationController.forward();
        }
      });
      return () {};
    },
    [state.direction],
  );
}
