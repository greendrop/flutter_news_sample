import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ThemeData useThemeDataImpl() {
  return Theme.of(useContext());
}

final useThemeData = useThemeDataImpl;
