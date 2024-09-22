import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show FilledButton;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tonal = false,
    this.iconData,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool tonal;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    if (tonal) {
      if (iconData != null) {
        return material.FilledButton.tonalIcon(
          onPressed: onPressed,
          icon: Icon(iconData),
          label: child,
        );
      }

      return material.FilledButton.tonal(
        onPressed: onPressed,
        child: child,
      );
    }

    if (iconData != null) {
      return material.FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: child,
      );
    }

    return material.FilledButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

@UseCase(
  name: 'Enabled',
  type: FilledButton,
)
Widget buildFilledButtonEnabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: () {},
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Enabled With Icon',
  type: FilledButton,
)
Widget buildFilledButtonEnabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: () {},
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: FilledButton,
)
Widget buildFilledButtonDisabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: null,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Disabled With Icon',
  type: FilledButton,
)
Widget buildFilledButtonDisabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: null,
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Tonal Enabled',
  type: FilledButton,
)
Widget buildFilledButtonTonalEnabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: () {},
      tonal: true,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Tonal Enabled With Icon',
  type: FilledButton,
)
Widget buildFilledButtonTonalEnabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: () {},
      tonal: true,
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Tonal Disabled',
  type: FilledButton,
)
Widget buildFilledButtonTonalDisabledUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: null,
      tonal: true,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(
  name: 'Tonal Disabled With Icon',
  type: FilledButton,
)
Widget buildFilledButtonTonalDisabledWithIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FilledButton(
      onPressed: null,
      tonal: true,
      iconData: Icons.add,
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}
