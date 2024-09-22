// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/feature/app_log_detail/app_log_detail_page.dart'
    as _i2;
import 'package:widgetbook_workspace/feature/app_log_list/app_log_list_page.dart'
    as _i3;
import 'package:widgetbook_workspace/feature/dev_tool/app_log_list_tile.dart'
    as _i4;
import 'package:widgetbook_workspace/feature/dev_tool/dev_tool_page.dart'
    as _i5;
import 'package:widgetbook_workspace/feature/locale_setting/locale_setting_form.dart'
    as _i6;
import 'package:widgetbook_workspace/feature/locale_setting/locale_setting_page.dart'
    as _i7;
import 'package:widgetbook_workspace/feature/setting/about_app_icon.dart'
    as _i8;
import 'package:widgetbook_workspace/feature/setting/app_about_list_tile.dart'
    as _i9;
import 'package:widgetbook_workspace/feature/setting/dev_tool_list_tile.dart'
    as _i10;
import 'package:widgetbook_workspace/feature/setting/locale_list_tile.dart'
    as _i11;
import 'package:widgetbook_workspace/feature/setting/setting_page.dart' as _i12;
import 'package:widgetbook_workspace/feature/setting/theme_list_tile.dart'
    as _i13;
import 'package:widgetbook_workspace/feature/theme_setting/theme_setting_form.dart'
    as _i14;
import 'package:widgetbook_workspace/feature/theme_setting/theme_setting_page.dart'
    as _i15;
import 'package:widgetbook_workspace/ui/foundation/color.dart' as _i16;
import 'package:widgetbook_workspace/ui/foundation/radius.dart' as _i17;
import 'package:widgetbook_workspace/ui/foundation/spacing.dart' as _i18;
import 'package:widgetbook_workspace/ui/foundation/typography.dart' as _i19;
import 'package:widgetbook_workspace/ui/widget/app_bar.dart' as _i20;
import 'package:widgetbook_workspace/ui/widget/button/elevated_button.dart'
    as _i21;
import 'package:widgetbook_workspace/ui/widget/button/filled_button.dart'
    as _i22;
import 'package:widgetbook_workspace/ui/widget/button/floating_action_button.dart'
    as _i23;
import 'package:widgetbook_workspace/ui/widget/button/outlined_button.dart'
    as _i24;
import 'package:widgetbook_workspace/ui/widget/button/text_button.dart' as _i25;
import 'package:widgetbook_workspace/ui/widget/navigation/navigation_bar.dart'
    as _i26;
import 'package:widgetbook_workspace/ui/widget/navigation/navigation_rail.dart'
    as _i27;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'feature',
    children: [
      _i1.WidgetbookFolder(
        name: 'app_log_detail',
        children: [
          _i1.WidgetbookComponent(
            name: 'AppLogDetailPage',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i2.buildAppLogDetailPageDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Empty',
                builder: _i2.buildAppLogDetailPageEmptyUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Loading',
                builder: _i2.buildAppLogDetailPageLoadingUseCase,
              ),
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'app_log_list',
        children: [
          _i1.WidgetbookComponent(
            name: 'AppLogListPage',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i3.buildAppLogListPageDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Empty',
                builder: _i3.buildAppLogListPageEmptyUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Loading',
                builder: _i3.buildAppLogListPageLoadingUseCase,
              ),
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'dev_tool',
        children: [
          _i1.WidgetbookComponent(
            name: 'AppLogListTile',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Disabled',
                builder: _i4.buildAppLogListTileDisabledUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Enabled',
                builder: _i4.buildAppLogListTileEnabledUseCase,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'DevToolPage',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i5.buildAppLogListPageDefaultUseCase,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'locale_setting',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'LocaleSettingForm',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i6.buildLocaleSettingFormDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'LocaleSettingPage',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i7.buildLocaleSettingPageDefaultUseCase,
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
              builder: _i8.buildAboutAppIconDefaultUseCase,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'AppAboutListTile',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Disabled',
                builder: _i9.buildAppAboutListTileDisabledUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Enabled',
                builder: _i9.buildAppAboutListTileEnabledUseCase,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'DevToolListTile',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Disabled',
                builder: _i10.buildDevToolListTileDisabledUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Enabled',
                builder: _i10.buildDevToolListTileEnabledUseCase,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'LocaleListTile',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Disabled',
                builder: _i11.buildLocaleListTileDisabledUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Enabled',
                builder: _i11.buildLocaleListTileEnabledUseCase,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'SettingPage',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i12.buildSettingDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Default With Dev Tool',
                builder: _i12.buildSettingDefaultWithDevToolUseCase,
              ),
            ],
          ),
          _i1.WidgetbookComponent(
            name: 'ThemeListTile',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Disabled',
                builder: _i13.buildThemeListTileDisabledUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Enabled',
                builder: _i13.buildThemeListTileEnabledUseCase,
              ),
            ],
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'theme_setting',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ThemeSettingForm',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i14.buildThemeSettingFormDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ThemeSettingPage',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i15.buildThemeSettingPageDefaultUseCase,
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
              builder: _i16.buildColorDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Radius',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i17.buildRadiusDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Spacing',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i18.buildSpacingDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Typography',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i19.buildTypographyDefaultUseCase,
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
                builder: _i20.buildAppBarDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'With Actions',
                builder: _i20.buildAppBarWithActionsUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'With Leading',
                builder: _i20.buildAppBarWithLeadingUseCase,
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'button',
            children: [
              _i1.WidgetbookComponent(
                name: 'ElevatedButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _i21.buildElevatedButtonDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Disabled With Icon',
                    builder: _i21.buildElevatedButtonDisabledWithIconUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled',
                    builder: _i21.buildElevatedButtonEnabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled With Icon',
                    builder: _i21.buildElevatedButtonEnabledWithIconUseCase,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'FilledButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _i22.buildFilledButtonDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Disabled With Icon',
                    builder: _i22.buildFilledButtonDisabledWithIconUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled',
                    builder: _i22.buildFilledButtonEnabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled With Icon',
                    builder: _i22.buildFilledButtonEnabledWithIconUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Tonal Disabled',
                    builder: _i22.buildFilledButtonTonalDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Tonal Disabled With Icon',
                    builder: _i22.buildFilledButtonTonalDisabledWithIconUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Tonal Enabled',
                    builder: _i22.buildFilledButtonTonalEnabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Tonal Enabled With Icon',
                    builder: _i22.buildFilledButtonTonalEnabledWithIconUseCase,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'FloatingActionButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _i23.buildFloatingActionButtonDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled',
                    builder: _i23.buildFloatingActionButtonEnabledUseCase,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'OutlinedButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _i24.buildOutlinedButtonDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled',
                    builder: _i24.buildOutlinedButtonEnabledUseCase,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'TextButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Disabled',
                    builder: _i25.buildTextButtonDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Disabled With Icon',
                    builder: _i25.buildTextButtonDisabledWithIconUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled',
                    builder: _i25.buildTextButtonEnabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Enabled With Icon',
                    builder: _i25.buildTextButtonEnabledWithIconUseCase,
                  ),
                ],
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'navigation',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'NavigationBar',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i26.buildNavigationBarDefaultUseCase,
                ),
              ),
              _i1.WidgetbookComponent(
                name: 'NavigationRail',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Default',
                    builder: _i27.buildNavigationRailDefaultUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'LabelTypeAll',
                    builder: _i27.buildNavigationRailLabelTypeAllUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'LabelTypeNone',
                    builder: _i27.buildNavigationRailLabelTypeNoneUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'LabelTypeSelected',
                    builder: _i27.buildNavigationRailLabelTypeSelectedUseCase,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
