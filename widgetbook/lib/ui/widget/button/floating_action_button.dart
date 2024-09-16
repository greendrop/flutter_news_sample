import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show FloatingActionButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class FloatingActionButton extends StatelessWidget {
  const FloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return material.FloatingActionButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Default',
  type: FloatingActionButton,
)
Widget buildFloatingActionButtonDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FloatingActionButton(
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true)
          ? () {}
          : null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
