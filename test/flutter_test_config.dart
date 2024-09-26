import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/golden_test/local_file_comparator_with_threshold.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        enabled: false,
      ),
      ciGoldensConfig: CiGoldensConfig(
        obscureText: false,
        renderShadows: true,
      ),
    ),
    run: () async {
      if (goldenFileComparator is LocalFileComparator) {
        final testUrl = (goldenFileComparator as LocalFileComparator).basedir;

        goldenFileComparator = LocalFileComparatorWithThreshold(
          Uri.parse('$testUrl/test.dart'),
          0.01, // Set the threshhold here e.g. 1%
        );
      } else {
        throw Exception(
          'Expected `goldenFileComparator` to be of type '
          '`LocalFileComparator`, but it is of type '
          '`${goldenFileComparator.runtimeType}`.',
        );
      }

      return testMain();
    },
  );
}
