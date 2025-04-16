import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/locale_setting/locale_setting_form.dart';

import '../../support/alchemist/golden_test_widget_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingForm Golden Test', () {
    final fileNamePrefix = 'locale_setting_form${Platform.pathSeparator}';
    const brightnesses = Brightness.values;

    group('Default', () {
      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}default',
        builder: () {
          final children = <Widget>[];
          for (final brightness in brightnesses) {
            children.add(
              GoldenTestWidgetScenario(
                name: brightness.name,
                brightness: brightness,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildLocaleSettingFormDefault(context),
                  );
                },
              ),
            );
          }
          return GoldenTestGroup(
            columns: brightnesses.length,
            children: children,
          );
        },
      );
    });
  });
}
