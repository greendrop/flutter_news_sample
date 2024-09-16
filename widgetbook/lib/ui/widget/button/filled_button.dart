import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show FilledButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.tonal,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool tonal;

  @override
  Widget build(BuildContext context) {
    if (tonal) {
      return material.FilledButton.tonal(
        onPressed: onPressed,
        child: child,
      );
    }

    return material.FilledButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Default',
  type: FilledButton,
)
Widget buildDesignSystemColorUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true)
          ? () {}
          : null,
      tonal: context.knobs.boolean(label: 'Tonal'),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
