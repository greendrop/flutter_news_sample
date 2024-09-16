import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show AppBar;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return material.AppBar(title: title, leading: leading, actions: actions);
  }
}

@UseCase(
  name: 'Default',
  type: AppBar,
)
Widget buildAppBarDefaultUseCase(BuildContext context) {
  return AppBar(
    title: Text(context.knobs.string(label: 'Title', initialValue: 'Title')),
  );
}

@UseCase(
  name: 'With Leading',
  type: AppBar,
)
Widget buildAppBarWithLeadingUseCase(BuildContext context) {
  return AppBar(
    title: Text(context.knobs.string(label: 'Title', initialValue: 'Title')),
    leading: const Icon(Icons.menu),
  );
}

@UseCase(
  name: 'With Actions',
  type: AppBar,
)
Widget buildAppBarWithActionsUseCase(BuildContext context) {
  return AppBar(
    title: Text(context.knobs.string(label: 'Title', initialValue: 'Title')),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications_outlined),
        onPressed: () {},
      ),
    ],
  );
}
