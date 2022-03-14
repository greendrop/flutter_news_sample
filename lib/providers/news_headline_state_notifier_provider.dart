// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/notifiers/news_headline_state_notifier.dart';
import 'package:flutter_news_sample/states/news_headline_state.dart';

final newsHeadlineStateNotifierProvider =
    StateNotifierProvider<NewsHeadlineStateNotifier, NewsHeadlineState>(
  (ref) => NewsHeadlineStateNotifier(),
);
