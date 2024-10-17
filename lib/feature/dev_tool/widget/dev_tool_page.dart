import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_push_app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_crash_report_test.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/crash_report_test_list_tile.dart';
import 'package:flutter_news_sample/feature/navigator/hook/use_navigator_state.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DevToolPage extends HookConsumerWidget {
  const DevToolPage({
    super.key,
    this.usePushAppLogListPage = usePushAppLogListPageImpl,
    this.useCrashReportTest = useCrashReportTestImpl,
  });

  final UsePushAppLogListPage usePushAppLogListPage;
  final UseCrashReportTest useCrashReportTest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final navigatorState = useNavigatorState();
    final pushAppLogListPage = usePushAppLogListPage();
    final crashReportTest = useCrashReportTest();

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
              slivers: [
                _appBar(context, ref, translations: translations),
                _body(
                  context,
                  ref,
                  pushAppLogListPage: pushAppLogListPage,
                  crashReportTest: crashReportTest,
                ),
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
      title: Text(translations.devTools.title),
      floating: true,
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required UsePushAppLogListPageReturn pushAppLogListPage,
    required UseCrashReportTestReturn crashReportTest,
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
                    AppLogListTile(onTap: pushAppLogListPage.run),
                    CrashReportListTile(onTap: crashReportTest.run),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
