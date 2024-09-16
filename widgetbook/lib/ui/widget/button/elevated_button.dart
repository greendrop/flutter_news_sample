import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show ElevatedButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ElevatedButton extends StatelessWidget {
  const ElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return material.ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Default',
  type: ElevatedButton,
)
Widget buildElevatedButtonDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true)
          ? () {}
          : null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
