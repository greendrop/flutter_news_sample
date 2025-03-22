import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class BaseFindable<T extends Widget> {
  Finder get self => find.byType(T);
  bool get isShown => self.evaluate().isNotEmpty;
}
