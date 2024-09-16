import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class SpacingWidget extends StatelessWidget {
  const SpacingWidget({
    super.key,
    required this.spacing,
    required this.name,
  });

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: spacing,
          child: Container(color: Colors.blue),
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Text(name),
            Text('Value: $spacing'),
          ],
        ),
      ],
    );
  }
}

class Spacing extends StatelessWidget {
  const Spacing({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;

    return const SingleChildScrollView(
      child: Column(
        children: [
          SpacingWidget(spacing: DesignTokenSpacing.none, name: 'none'),
          SizedBox(height: spacing),
          SpacingWidget(spacing: DesignTokenSpacing.xs, name: 'xs'),
          SizedBox(height: spacing),
          SpacingWidget(spacing: DesignTokenSpacing.sm, name: 'sm'),
          SizedBox(height: spacing),
          SpacingWidget(spacing: DesignTokenSpacing.md, name: 'md'),
          SizedBox(height: spacing),
          SpacingWidget(spacing: DesignTokenSpacing.lg, name: 'lg'),
          SizedBox(height: spacing),
          SpacingWidget(spacing: DesignTokenSpacing.xl, name: 'xl'),
          SizedBox(height: spacing),
          SpacingWidget(spacing: DesignTokenSpacing.xxl, name: 'xxl'),
        ],
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: Spacing,
)
Widget buildSpacingDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(8), child: Spacing());
}
