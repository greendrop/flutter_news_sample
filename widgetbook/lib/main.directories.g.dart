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
                name: 'Default',
                builder: _i4.buildAppLogListTileDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Disabled',
                builder: _i4.buildAppLogListTileDisabledUseCase,
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
          _i1.WidgetbookLeafComponent(
            name: 'AppAboutListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i9.buildAppAboutListTileDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'DevToolListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i10.buildDevToolListTileDefaultUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'LocaleListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i11.buildLocaleListTileDefaultUseCase,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'SettingPage',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i12.buildSettingDefaultUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Show Dev Tool',
                builder: _i12.buildSettingShowDevToolUseCase,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ThemeListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i13.buildThemeListTileDefaultUseCase,
            ),
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
              _i1.WidgetbookLeafComponent(
                name: 'ElevatedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i21.buildElevatedButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'FilledButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i22.buildFilledButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'FloatingActionButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i23.buildFloatingActionButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'OutlinedButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i24.buildOutlinedButtonDefaultUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'TextButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i25.buildTextButtonDefaultUseCase,
                ),
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
