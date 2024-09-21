import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show NavigationRail;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NavigationRail extends StatelessWidget {
  const NavigationRail({
    super.key,
    this.labelType,
  });

  final NavigationRailLabelType? labelType;

  @override
  Widget build(BuildContext context) {
    return material.NavigationRail(
      selectedIndex: 0,
      labelType: labelType,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text('Search'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.notifications),
          label: Text('Notifications'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
    );
  }
}

@UseCase(
  name: 'Default',
  type: NavigationRail,
)
Widget buildNavigationRailDefaultUseCase(BuildContext context) {
  return const NavigationRail();
}

@UseCase(
  name: 'LabelTypeAll',
  type: NavigationRail,
)
Widget buildNavigationRailLabelTypeAllUseCase(BuildContext context) {
  return const NavigationRail(labelType: NavigationRailLabelType.all);
}

@UseCase(
  name: 'LabelTypeSelected',
  type: NavigationRail,
)
Widget buildNavigationRailLabelTypeSelectedUseCase(BuildContext context) {
  return const NavigationRail(labelType: NavigationRailLabelType.selected);
}

@UseCase(
  name: 'LabelTypeNone',
  type: NavigationRail,
)
Widget buildNavigationRailLabelTypeNoneUseCase(BuildContext context) {
  return const NavigationRail(labelType: NavigationRailLabelType.none);
}
