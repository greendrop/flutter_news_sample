import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

class GoldenTestWidgetScenario extends StatelessWidget {
  const GoldenTestWidgetScenario({
    super.key,
    required this.name,
    required this.brightness,
    required this.builder,
    this.width = 400,
  });

  final String name;
  final Brightness brightness;
  final ValueGetter<Widget> builder;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GoldenTestScenario(
      name: name,
      child: ClipRect(
        child: SizedBox(
          width: width,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              platformBrightness: brightness,
            ),
            child: builder(),
          ),
        ),
      ),
    );
  }
}
