import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show ElevatedButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ElevatedButton extends StatelessWidget {
  const ElevatedButton({
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
      return material.ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: child,
      );
    }

    return material.ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Enabled',
  type: ElevatedButton,
)
Widget buildElevatedButtonEnabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Enabled With Icon',
  type: ElevatedButton,
)
Widget buildElevatedButtonEnabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () {},
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: ElevatedButton,
)
Widget buildElevatedButtonDisabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled With Icon',
  type: ElevatedButton,
)
Widget buildElevatedButtonDisabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: null,
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
