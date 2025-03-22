import 'package:app/config/app_constant.dart';
import 'package:app/config/design_token/spacing.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/navigator/hook/use_navigator_state.dart';
import 'package:app/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:app/feature/theme_setting/widget/theme_setting_form.dart';
import 'package:app/widget/body_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeSettingPage extends HookConsumerWidget {
  const ThemeSettingPage({
    super.key,
    this.useThemeMode = useThemeModeImpl,
  });

  final UseThemeMode useThemeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final themeMode = useThemeMode();
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
                _body(context, ref, themeMode: themeMode),
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
      title: Text(l10n.themeSettingTitle),
      floating: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required UseThemeModeReturn themeMode,
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
