import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';
import 'package:widgetbook/widgetbook.dart';

class SlangAddon extends WidgetbookAddon<Locale> {
  SlangAddon({
    required this.locales,
    required this.localizationsDelegates,
    this.initialLocale,
  })  : assert(
          locales.isNotEmpty,
          'locales cannot be empty',
        ),
        assert(
          initialLocale == null || locales.contains(initialLocale),
          'initialLocale must be in locales',
        ),
        super(
          name: 'Locale',
        );

  final Locale? initialLocale;
  final List<Locale> locales;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;

  @override
  List<Field> get fields {
    return [
      ListField<Locale>(
        name: 'name',
        values: locales,
        initialValue: initialLocale ?? locales.first,
        labelBuilder: (locale) => locale.toLanguageTag(),
      ),
    ];
  }

  @override
  Locale valueFromQueryGroup(Map<String, String> group) {
    return valueOf('name', group)!;
  }

  @override
  Widget buildUseCase(
    BuildContext context,
    Widget child,
    Locale setting,
  ) {
    LocaleSettings.setLocaleRaw(setting.toString());

    return TranslationProvider(
      child: LocalizationsWidget(
        locale: setting,
        delegates: localizationsDelegates,
        child: child,
      ),
    );
    // return LocalizationsWidget(
    //   locale: setting,
    //   delegates: localizationsDelegates,
    //   child: child,
    // );
  }
}

class LocalizationsWidget extends StatelessWidget {
  const LocalizationsWidget({
    super.key,
    required this.locale,
    required this.delegates,
    required this.child,
  });

  final Locale locale;
  final List<LocalizationsDelegate<dynamic>> delegates;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: locale,
      delegates: delegates,
      child: child,
    );
  }
}
