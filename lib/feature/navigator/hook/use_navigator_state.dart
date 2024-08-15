import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

NavigatorState useNavigatorState() {
  return Navigator.of(useContext());
}
