import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

class GoldenTestWidgetScenario extends StatelessWidget {
  const GoldenTestWidgetScenario({
    super.key,
    required this.name,
    required this.brightness,
    required this.builder,
    this.minWidth = 50,
    this.minHeight = 50,
    this.maxWidth = 400,
    this.maxHeight = 400,
  });

  final String name;
  final Brightness brightness;
  final ValueGetter<Widget> builder;
  final double minWidth;
  final double minHeight;
  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return GoldenTestScenario(
      name: name,
      child: ClipRect(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minWidth,
            minHeight: minHeight,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
          ),
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
