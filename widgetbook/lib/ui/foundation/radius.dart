import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/design_token/radius.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class RadiusWidget extends StatelessWidget {
  const RadiusWidget({
    super.key,
    required this.radius,
    required this.name,
  });

  final double radius;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Text(name),
            Text('Value: $radius'),
          ],
        ),
      ],
    );
  }
}

class Radius extends StatelessWidget {
  const Radius({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;

    return const SingleChildScrollView(
      child: Column(
        children: [
          RadiusWidget(radius: DesignTokenRadius.none, name: 'none'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.xs, name: 'xs'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.sm, name: 'sm'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.md, name: 'md'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.lg, name: 'lg'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.xl, name: 'xl'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.xxl, name: 'xxl'),
          SizedBox(height: spacing),
          RadiusWidget(radius: DesignTokenRadius.full, name: 'full'),
        ],
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: Radius,
)
Widget buildRadiusDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(8), child: Radius());
}
