import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_show_app_about_dialog.dart';
import 'package:flutter_news_sample/feature/setting/widget/app_about_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/dev_tool_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart';
import 'package:flutter_news_sample/feature/setting/widget/theme_list_tile.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_push_theme_setting_page.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  SettingPage({
    super.key,
    this.usePushLocaleSettingPage = usePushLocaleSettingPageImpl,
    this.usePushThemeSettingPage = usePushThemeSettingPageImpl,
    this.useShowAppAboutDialog = useShowAppAboutDialogImpl,
    this.usePushDevToolPage = usePushDevToolPageImpl,
    bool? showDevTool,
  }) : showDevTool = showDevTool ?? AppConfig.instance.showDevTool;

  final UsePushLocaleSettingPage usePushLocaleSettingPage;
  final UsePushThemeSettingPage usePushThemeSettingPage;
  final UseShowAppAboutDialog useShowAppAboutDialog;
  final UsePushDevToolPage usePushDevToolPage;
  final bool showDevTool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final pushLocaleSettingPage = usePushLocaleSettingPage();
    final pushThemeSettingPage = usePushThemeSettingPage();
    final showAppAboutDialog = useShowAppAboutDialog();
    final pushDevToolPage = usePushDevToolPage();

    return Scaffold(
      body: SafeArea(
        child: BodyContainer(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              _appBar(context, ref, translations: translations),
              _body(
                context,
                ref,
                pushLocaleSettingPage: pushLocaleSettingPage,
                pushThemeSettingPage: pushThemeSettingPage,
                showAppAboutDialog: showAppAboutDialog,
                pushDevToolPage: pushDevToolPage,
              ),
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

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required UsePushLocaleSettingPageReturn pushLocaleSettingPage,
    required UsePushThemeSettingPageReturn pushThemeSettingPage,
    required UseShowAppAboutDialogReturn showAppAboutDialog,
    required UsePushDevToolPageReturn pushDevToolPage,
  }) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignTokenSpacing.sm),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(DesignTokenSpacing.sm),
                child: Column(
                  children: [
                    LocaleListTile(onTap: pushLocaleSettingPage.run),
                    ThemeListTile(onTap: pushThemeSettingPage.run),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(DesignTokenSpacing.sm),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(DesignTokenSpacing.sm),
                child: Column(
                  children: [
                    AppAboutListTile(onTap: showAppAboutDialog.run),
                  ],
                ),
              ),
            ),
          ),
          showDevTool
              ? Padding(
                  padding: const EdgeInsets.all(DesignTokenSpacing.sm),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(DesignTokenSpacing.sm),
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
