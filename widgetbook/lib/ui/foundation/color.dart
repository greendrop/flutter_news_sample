import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show Color;
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
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          ColorWidget(color: colorScheme.primary, name: 'Primary'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.onPrimary, name: 'On Primary'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.secondary, name: 'Secondary'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.onSecondary, name: 'On Secondary'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.error, name: 'Error'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.onError, name: 'On Error'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.surface, name: 'Surface'),
          const SizedBox(height: spacing),
          ColorWidget(color: colorScheme.onSurface, name: 'On Surface'),
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
  return const Color();
}
