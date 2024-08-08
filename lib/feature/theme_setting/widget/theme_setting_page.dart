import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart'
    as hook;
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_form.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeSettingPage extends HookConsumerWidget {
  const ThemeSettingPage({
    super.key,
    this.useThemeMode = hook.useThemeMode,
  });

  static String routeName = 'ThemeSettingPage';

  final hook.UseThemeMode useThemeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final themeMode = useThemeMode();

    return Scaffold(
      body: SafeArea(
        child: BodyContainer(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              _appBar(context, ref, translations: translations),
              _body(context, ref, themeMode: themeMode),
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
      title: Text(translations.themeSetting.title),
      floating: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required hook.UseThemeModeReturn themeMode,
  }) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppConstant.spacing1),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstant.spacing1),
                child: ThemeSettingForm(
                  initialThemeMode: themeMode.state,
                  onSubmit: (value) {
                    themeMode.update(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
