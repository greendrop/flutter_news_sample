// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/ui/setting/setting_form.dart';
import 'package:flutter_news_sample/ui/widgets/app_bottom_bavigation_bar.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBar = AppBar(
      title: Text(L10n.of(context)!.settingTitle),
    );
    final body = Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: SettingForm(),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
