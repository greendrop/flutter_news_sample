import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleImage extends HookConsumerWidget {
  const NewsArticleImage({super.key, required this.url});

  final String? url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (url == null || url == '') {
      return const Center(child: Text('NO IMAGE'));
    }

    return Image.network(
      url.toString(),
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('NO IMAGE'));
      },
    );
  }
}
