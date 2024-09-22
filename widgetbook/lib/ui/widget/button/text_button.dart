import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show TextButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.iconData,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    if (iconData != null) {
      return material.TextButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: child,
      );
    }

    return material.TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Enabled',
  type: TextButton,
)
Widget buildTextButtonEnabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextButton(
      onPressed: () {},
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Enabled With Icon',
  type: TextButton,
)
Widget buildTextButtonEnabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextButton(
      onPressed: () {},
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: TextButton,
)
Widget buildTextButtonDisabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextButton(
      onPressed: null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled With Icon',
  type: TextButton,
)
Widget buildTextButtonDisabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextButton(
      onPressed: null,
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
