import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/app_root.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _prepareTimeZone();
  await _prepareFirebase();
  await _prepareFirebaseCrashlytics();

  runApp(ProviderScope(child: TranslationProvider(child: const AppRoot())));
}

Future<void> _prepareTimeZone() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(
    tz.getLocation(await FlutterTimezone.getLocalTimezone()),
  );
}

Future<void> _prepareFirebase() async {
  await Firebase.initializeApp();
}

Future<void> _prepareFirebaseCrashlytics() async {
  if (!AppConfig.instance.crashReportEnabled) {
    return;
  }

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter
  // framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
