import 'package:app/config/design_token/color.dart';
import 'package:app/config/design_token/radius.dart';
import 'package:app/config/design_token/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsArticleGridItemSkeleton extends StatelessWidget {
  const NewsArticleGridItemSkeleton({
    super.key,
    this.shimmerLoop = 0,
    this.shimmerEnabled = true,
  });

  final int shimmerLoop;
  final bool shimmerEnabled;

  @override
  Widget build(BuildContext context) {
    final designTokenColor = DesignTokenColor.fromBrightness(
      Theme.of(context).brightness,
    );
    final baseColor = designTokenColor.skeletonBase;
    final highlightColor = designTokenColor.skeletonHighlight;
    return Card(
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        loop: shimmerLoop,
        enabled: shimmerEnabled,
        child: Padding(
          padding: const EdgeInsets.all(DesignTokenSpacing.sm),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxItems =
                        (constraints.maxHeight /
                                (DesignTokenSpacing.md + DesignTokenSpacing.xs))
                            .floor();
                    return Column(
                      children: List.generate(maxItems, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom:
                                index < maxItems - 1
                                    ? DesignTokenSpacing.xs
                                    : 0,
                          ),
                          child: Container(
                            key: Key(
                              'NewsArticleGridItemSkeletonTitleText$index',
                            ),
                            width: double.infinity,
                            height: DesignTokenSpacing.md,
                            decoration: BoxDecoration(
                              color: baseColor,
                              borderRadius: BorderRadius.circular(
                                DesignTokenRadius.xs,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: DesignTokenSpacing.sm),
                  child: Container(
                    key: const ValueKey('NewsArticleGridItemSkeletonImage'),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(DesignTokenRadius.xs),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
