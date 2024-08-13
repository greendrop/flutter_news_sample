import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ThemeData useThemeData() {
  return Theme.of(useContext());
}
