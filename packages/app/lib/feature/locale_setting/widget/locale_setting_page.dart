import 'package:app/config/app_constant.dart';
import 'package:app/config/design_token/spacing.dart';
import 'package:app/feature/locale_setting/hook/use_locale.dart';
import 'package:app/feature/locale_setting/widget/locale_setting_form.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/navigator/hook/use_navigator_state.dart';
import 'package:app/widget/body_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocaleSettingPage extends HookConsumerWidget {
  const LocaleSettingPage({
    super.key,
    this.useLocale = useLocaleImpl,
  });

  final UseLocale useLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
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
                _appBar(context, ref, l10n: l10n),
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
    required L10n l10n,
  }) {
    return SliverAppBar(
      title: Text(l10n.localeSettingTitle),
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
