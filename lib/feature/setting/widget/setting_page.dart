import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:flutter_news_sample/feature/setting/widget/dev_tool_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_about_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/theme_list_tile.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_push_theme_setting_page.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  SettingPage({super.key, bool? showDevTool})
      : showDevTool = showDevTool ?? AppConfig.instance.showDevTool;

  static String routeName = 'SettingPage';

  final bool showDevTool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();

    return Scaffold(
      body: SafeArea(
        child: BodyContainer(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              _appBar(context, ref, translations: translations),
              _body(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _appBar(
    BuildContext context,
    WidgetRef ref, {
    required Translations translations,
  }) {
    return SliverAppBar(
      title: Text(translations.setting.title),
      floating: true,
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    final pushLocaleSettingPage = usePushLocaleSettingPage();
    final pushThemeSettingPage = usePushThemeSettingPage();
    final pushDevToolPage = usePushDevToolPage();

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppConstant.spacing1),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstant.spacing1),
                child: Column(
                  children: [
                    LocaleListTile(onTap: pushLocaleSettingPage.run),
                    ThemeListTile(onTap: pushThemeSettingPage.run),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppConstant.spacing1),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(AppConstant.spacing1),
                child: Column(
                  children: [
                    SettingAboutListTile(),
                  ],
                ),
              ),
            ),
          ),
          showDevTool
              ? Padding(
                  padding: const EdgeInsets.all(AppConstant.spacing1),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstant.spacing1),
                      child: Column(
                        children: [
                          DevToolListTile(onTap: pushDevToolPage.run),
                        ],
                      ),
                    ),
                  ),
                )
              : null,
        ].whereNotNull().toList(),
      ),
    );
  }
}
