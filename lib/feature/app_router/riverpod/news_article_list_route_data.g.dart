// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_list_route_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsArticleListRouteDataHash() =>
    r'68430f1fb5f47a84579831f1972721868f5ec120';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [newsArticleListRouteData].
@ProviderFor(newsArticleListRouteData)
const newsArticleListRouteDataProvider = NewsArticleListRouteDataFamily();

/// See also [newsArticleListRouteData].
class NewsArticleListRouteDataFamily extends Family<NewsArticleListRouteData> {
  /// See also [newsArticleListRouteData].
  const NewsArticleListRouteDataFamily();

  /// See also [newsArticleListRouteData].
  NewsArticleListRouteDataProvider call({
    required String? category,
  }) {
    return NewsArticleListRouteDataProvider(
      category: category,
    );
  }

  @override
  NewsArticleListRouteDataProvider getProviderOverride(
    covariant NewsArticleListRouteDataProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsArticleListRouteDataProvider';
}

/// See also [newsArticleListRouteData].
class NewsArticleListRouteDataProvider
    extends AutoDisposeProvider<NewsArticleListRouteData> {
  /// See also [newsArticleListRouteData].
  NewsArticleListRouteDataProvider({
    required String? category,
  }) : this._internal(
          (ref) => newsArticleListRouteData(
            ref as NewsArticleListRouteDataRef,
            category: category,
          ),
          from: newsArticleListRouteDataProvider,
          name: r'newsArticleListRouteDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsArticleListRouteDataHash,
          dependencies: NewsArticleListRouteDataFamily._dependencies,
          allTransitiveDependencies:
              NewsArticleListRouteDataFamily._allTransitiveDependencies,
          category: category,
        );

  NewsArticleListRouteDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String? category;

  @override
  Override overrideWith(
    NewsArticleListRouteData Function(NewsArticleListRouteDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsArticleListRouteDataProvider._internal(
        (ref) => create(ref as NewsArticleListRouteDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<NewsArticleListRouteData> createElement() {
    return _NewsArticleListRouteDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsArticleListRouteDataProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsArticleListRouteDataRef
    on AutoDisposeProviderRef<NewsArticleListRouteData> {
  /// The parameter `category` of this provider.
  String? get category;
}

class _NewsArticleListRouteDataProviderElement
    extends AutoDisposeProviderElement<NewsArticleListRouteData>
    with NewsArticleListRouteDataRef {
  _NewsArticleListRouteDataProviderElement(super.provider);

  @override
  String? get category => (origin as NewsArticleListRouteDataProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
