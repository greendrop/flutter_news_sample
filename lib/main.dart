// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/app_root.dart';
import 'package:flutter_news_sample/config/app_config.dart';

void main() {
  AppConfig().load();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: AppRoot()));
}
