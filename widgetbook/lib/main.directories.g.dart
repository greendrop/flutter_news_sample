// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/feature/locale_setting/locale_setting_form.dart'
    as _i2;
import 'package:widgetbook_workspace/feature/locale_setting/locale_setting_page.dart'
    as _i3;
import 'package:widgetbook_workspace/feature/setting/about_app_icon.dart'
    as _i4;
import 'package:widgetbook_workspace/feature/setting/app_about_list_tile.dart'
    as _i5;
import 'package:widgetbook_workspace/feature/setting/dev_tool_list_tile.dart'
    as _i6;
import 'package:widgetbook_workspace/feature/setting/locale_list_tile.dart'
    as _i7;
import 'package:widgetbook_workspace/feature/setting/setting_page.dart' as _i8;
import 'package:widgetbook_workspace/feature/setting/theme_list_tile.dart'
    as _i9;
import 'package:widgetbook_workspace/ui/foundation/color.dart' as _i10;
import 'package:widgetbook_workspace/ui/foundation/radius.dart' as _i11;
import 'package:widgetbook_workspace/ui/foundation/spacing.dart' as _i12;
import 'package:widgetbook_workspace/ui/foundation/typography.dart' as _i13;
import 'package:widgetbook_workspace/ui/widget/app_bar.dart' as _i14;
import 'package:widgetbook_workspace/ui/widget/button/elevated_button.dart'
    as _i15;
import 'package:widgetbook_workspace/ui/widget/button/filled_button.dart'
    as _i16;
import 'package:widgetbook_workspace/ui/widget/button/floating_action_button.dart'
    as _i17;
import 'package:widgetbook_workspace/ui/widget/button/outlined_button.dart'
    as _i18;
import 'package:widgetbook_workspace/ui/widget/button/text_button.dart' as _i19;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'feature',
    children: [
      _i1.WidgetbookFolder(
        name: 'locale_setting',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'LocaleSettingForm',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.buildLocaleSettingFormDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'LocaleSettingPage',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.buildLocaleSettingPageDefaultUseCase,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'setting',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'AboutAppIcon',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i4.buildAboutAppIconDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'AppAboutListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i5.buildAppAboutListTileDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'DevToolListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i6.buildDevToolListTileDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'LocaleListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i7.buildLocaleListTileDefaultUseCase,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'SettingPage',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i8.buildSettingDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Show Dev Tool',
                builder: _i8.buildSettingShowDevToolUseCase,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ThemeListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i9.buildThemeListTileDefaultUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'ui',
    children: [
      _i1.WidgetbookFolder(
        name: 'foundation',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Color',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i10.buildColorDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Radius',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i11.buildRadiusDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Spacing',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i12.buildSpacingDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Typography',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i13.buildTypographyDefaultUseCase,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'widget',
        children: [
          _i1.WidgetbookComponent(
            name: 'AppBar',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i14.buildAppBarDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'With Actions',
                builder: _i14.buildAppBarWithActionsUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'With Leading',
                builder: _i14.buildAppBarWithLeadingUseCase,
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'button',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ElevatedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i15.buildElevatedButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'FilledButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i16.buildFilledButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'FloatingActionButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i17.buildFloatingActionButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'OutlinedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i18.buildOutlinedButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'TextButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i19.buildTextButtonDefaultUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
