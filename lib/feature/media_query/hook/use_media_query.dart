import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

MediaQueryData useMediaQueryData() {
  return MediaQuery.of(useContext());
}
