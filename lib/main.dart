import 'package:flutter/material.dart';
import 'package:flutter_news_sample/app_root.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _prepareTimeZone();

  runApp(ProviderScope(child: TranslationProvider(child: const AppRoot())));
}

Future<void> _prepareTimeZone() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(
    tz.getLocation(await FlutterTimezone.getLocalTimezone()),
  );
}
