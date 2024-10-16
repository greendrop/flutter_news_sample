import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_locale.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_form.dart';
import 'package:flutter_news_sample/feature/navigator/hook/use_navigator_state.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocaleSettingPage extends HookConsumerWidget {
  const LocaleSettingPage({
    super.key,
    this.useLocale = useLocaleImpl,
  });

  final UseLocale useLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final locale = useLocale();
    final navigatorState = useNavigatorState();

    return Scaffold(
      body: SafeArea(
        child: BodyContainer(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > AppConstant.swipePopThreshold) {
                navigatorState.pop();
              }
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: <Widget>[
                _appBar(context, ref, translations: translations),
                _body(context, ref, locale: locale),
              ],
            ),
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
      title: Text(translations.localeSetting.title),
      floating: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required UseLocaleReturn locale,
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
                child: LocaleSettingForm(
                  initialLocale: locale.state,
                  onSubmit: (value) {
                    locale.update(value);
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
