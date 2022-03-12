// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/ui/widgets/app_bottom_bavigation_bar.dart';

class HeadlinePage extends HookConsumerWidget {
  const HeadlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.headlineTitle),
      ),
      body: Container(),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
