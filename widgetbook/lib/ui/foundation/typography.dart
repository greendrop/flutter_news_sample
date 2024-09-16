import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.name,
    this.style,
  });

  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(name, style: style);
  }
}

class Typography extends StatelessWidget {
  const Typography({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;
    final styles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(name: 'Display Large', style: styles.displayLarge),
          TextWidget(name: 'Display Medium', style: styles.displayMedium),
          TextWidget(name: 'Display Small', style: styles.displaySmall),
          const SizedBox(height: spacing),
          TextWidget(name: 'Headline Large', style: styles.headlineLarge),
          TextWidget(name: 'Headline Medium', style: styles.headlineMedium),
          TextWidget(name: 'Headline Small', style: styles.headlineSmall),
          const SizedBox(height: spacing),
          TextWidget(name: 'Title Large', style: styles.titleLarge),
          TextWidget(name: 'Title Medium', style: styles.titleMedium),
          TextWidget(name: 'Title Small', style: styles.titleSmall),
          const SizedBox(height: spacing),
          TextWidget(name: 'Body Large', style: styles.bodyLarge),
          TextWidget(name: 'Body Medium', style: styles.bodyMedium),
          TextWidget(name: 'Body Small', style: styles.bodySmall),
          const SizedBox(height: spacing),
          TextWidget(name: 'Label Large', style: styles.labelLarge),
          TextWidget(name: 'Label Medium', style: styles.labelMedium),
          TextWidget(name: 'Label Small', style: styles.labelSmall),
          const SizedBox(height: spacing),
          const TextWidget(name: 'Default'),
        ],
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: Typography,
)
Widget buildTypographyDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(8), child: Typography());
}
