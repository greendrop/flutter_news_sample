import 'package:app/config/app_config.dart';
import 'package:app/config/design_token/spacing.dart';
import 'package:app/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:app/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/setting/hook/use_show_app_about_dialog.dart';
import 'package:app/feature/setting/widget/app_about_list_tile.dart';
import 'package:app/feature/setting/widget/dev_tool_list_tile.dart';
import 'package:app/feature/setting/widget/locale_list_tile.dart';
import 'package:app/feature/setting/widget/theme_list_tile.dart';
import 'package:app/feature/theme_setting/hook/use_push_theme_setting_page.dart';
import 'package:app/widget/body_container.dart';
import 'package:flutter/material.dart';
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
    final l10n = useL10n();
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
              _appBar(context, ref, l10n: l10n),
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
    required L10n l10n,
  }) {
    return SliverAppBar(
      title: Text(l10n.settingTitle),
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
                    LocaleListTile(
                      key: const ValueKey('LocaleListTile'),
                      onTap: pushLocaleSettingPage.run,
                    ),
                    ThemeListTile(
                      key: const ValueKey('ThemeListTile'),
                      onTap: pushThemeSettingPage.run,
                    ),
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
                    AppAboutListTile(
                      key: const ValueKey('AppAboutListTile'),
                      onTap: showAppAboutDialog.run,
                    ),
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
        ].nonNulls.toList(),
      ),
    );
  }
}
