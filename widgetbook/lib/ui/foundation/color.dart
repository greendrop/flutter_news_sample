import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show Color;
import 'package:flutter_news_sample/config/design_token/color.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    super.key,
    required this.color,
    required this.name,
  });

  final material.Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;

    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Container(color: color),
        ),
        const SizedBox(width: spacing),
        Column(
          children: [
            Text(name),
            Text('RGB: ${color.red}, ${color.green}, ${color.blue}'),
            Text('HEX: #${color.value.toRadixString(16)}'),
          ],
        ),
      ],
    );
  }
}

class Color extends StatelessWidget {
  const Color({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;
    final themeData = Theme.of(context);
    final designTokenColor = DesignTokenColor.fromBrightness(
      themeData.brightness,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          ColorWidget(
            color: designTokenColor.primary,
            name: 'Primary',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.onPrimary,
            name: 'On Primary',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.secondary,
            name: 'Secondary',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.onSecondary,
            name: 'On Secondary',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.error,
            name: 'Error',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.onError,
            name: 'On Error',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.surface,
            name: 'Surface',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.onSurface,
            name: 'On Surface',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.infoText,
            name: 'Info Text',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.infoBackground,
            name: 'Info Background',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.warningText,
            name: 'Warning Text',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.warningBackground,
            name: 'Warning Background',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.dangerText,
            name: 'Danger Text',
          ),
          const SizedBox(height: spacing),
          ColorWidget(
            color: designTokenColor.dangerBackground,
            name: 'Danger Background',
          ),
        ],
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: Color,
)
Widget buildDesignSystemColorUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(8), child: Color());
}
