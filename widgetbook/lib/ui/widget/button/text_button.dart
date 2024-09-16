import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show TextButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return material.TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Default',
  type: TextButton,
)
Widget buildTextButtonDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextButton(
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true)
          ? () {}
          : null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
