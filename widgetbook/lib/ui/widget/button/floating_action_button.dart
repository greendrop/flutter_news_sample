import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show FloatingActionButton;
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
  name: 'Enabled',
  type: FloatingActionButton,
)
Widget buildFloatingActionButtonEnabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: FloatingActionButton,
)
Widget buildFloatingActionButtonDisabledUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: FloatingActionButton(
      onPressed: null,
      child: Icon(Icons.add),
    ),
  );
}
