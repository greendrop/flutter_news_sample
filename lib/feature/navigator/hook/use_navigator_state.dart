import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef UseNavigatorState = NavigatorState Function();

NavigatorState useNavigatorStateImpl() {
  return Navigator.of(useContext());
}

final UseNavigatorState useNavigatorState = useNavigatorStateImpl;
