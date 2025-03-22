import 'dart:io';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  await integrationDriver(
    onScreenshot: (
      String screenshotName,
      List<int> screenshotBytes, [
      Map<String, Object?>? args,
    ]) async {
      final file = File('${[
        'integration_test',
        'screenshots',
        screenshotName,
      ].join(Platform.pathSeparator)}.png');

      if (!file.parent.existsSync()) {
        file.parent.createSync(recursive: true);
      }

      file.writeAsBytesSync(screenshotBytes);

      return true;
    },
  );
}
