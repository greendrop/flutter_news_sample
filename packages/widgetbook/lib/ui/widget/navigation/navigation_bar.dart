import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show NavigationBar;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return material.NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

@UseCase(
  name: 'Default',
  type: NavigationBar,
)
Widget buildNavigationBarDefaultUseCase(BuildContext context) {
  return const NavigationBar();
}
