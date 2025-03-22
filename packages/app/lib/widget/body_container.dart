import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodyContainer extends HookConsumerWidget {
  const BodyContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NOTE: 全ページで監視・処理したい場合は、ここに記述する
    //   例:
    //     - 強制アップデートのチェック・ダイアログ表示
    //     - FCMトークンの更新

    return Column(children: [Expanded(child: child)]);
  }
}
