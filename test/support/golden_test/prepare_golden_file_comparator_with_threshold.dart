import 'package:flutter_test/flutter_test.dart';

import 'local_file_comparator_with_threshold.dart';

void prepareGoldenFileComparatorWithThreshold({
  double threshold = 0.01, // 1%
}) {
  if (goldenFileComparator is LocalFileComparator) {
    final testUrl = (goldenFileComparator as LocalFileComparator).basedir;

    goldenFileComparator = LocalFileComparatorWithThreshold(
      Uri.parse('$testUrl/test.dart'),
      threshold,
    );
  } else {
    throw Exception(
      'Expected `goldenFileComparator` to be of type '
      '`LocalFileComparator`, but it is of type '
      '`${goldenFileComparator.runtimeType}`.',
    );
  }
}
