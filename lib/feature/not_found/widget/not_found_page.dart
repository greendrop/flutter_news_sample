import 'package:flutter/material.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotFoundPage extends HookConsumerWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: BodyContainer(child: Center(child: Text('Not Found'))),
      ),
    );
  }
}
