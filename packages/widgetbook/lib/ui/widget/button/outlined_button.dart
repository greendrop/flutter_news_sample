import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show OutlinedButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class OutlinedButton extends StatelessWidget {
  const OutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return material.OutlinedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Enabled',
  type: OutlinedButton,
)
Widget buildOutlinedButtonEnabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: OutlinedButton(
      onPressed: () {},
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: OutlinedButton,
)
Widget buildOutlinedButtonDisabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: OutlinedButton(
      onPressed: null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
