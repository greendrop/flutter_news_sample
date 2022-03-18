// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/notifiers/news_search_state_notifier.dart';
import 'package:flutter_news_sample/states/news_search_state.dart';

final newsSearchStateNotifierProvider =
    StateNotifierProvider<NewsSearchStateNotifier, NewsSearchState>(
  (ref) => NewsSearchStateNotifier(ref: ref),
);
