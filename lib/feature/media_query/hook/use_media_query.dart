import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef UseMediaQueryData = MediaQueryData Function();

MediaQueryData useMediaQueryDataImpl() {
  return MediaQuery.of(useContext());
}

final UseMediaQueryData useMediaQueryData = useMediaQueryDataImpl;
