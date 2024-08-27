// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_search_detail_route_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsArticleSearchDetailRouteDataHash() =>
    r'0e757aaf40c16f69825272d4f0cda719924f06c7';

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

/// See also [newsArticleSearchDetailRouteData].
@ProviderFor(newsArticleSearchDetailRouteData)
const newsArticleSearchDetailRouteDataProvider =
    NewsArticleSearchDetailRouteDataFamily();

/// See also [newsArticleSearchDetailRouteData].
class NewsArticleSearchDetailRouteDataFamily
    extends Family<NewsArticleSearchDetailRouteData> {
  /// See also [newsArticleSearchDetailRouteData].
  const NewsArticleSearchDetailRouteDataFamily();

  /// See also [newsArticleSearchDetailRouteData].
  NewsArticleSearchDetailRouteDataProvider call({
    required String title,
    required String url,
  }) {
    return NewsArticleSearchDetailRouteDataProvider(
      title: title,
      url: url,
    );
  }

  @override
  NewsArticleSearchDetailRouteDataProvider getProviderOverride(
    covariant NewsArticleSearchDetailRouteDataProvider provider,
  ) {
    return call(
      title: provider.title,
      url: provider.url,
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
  String? get name => r'newsArticleSearchDetailRouteDataProvider';
}

/// See also [newsArticleSearchDetailRouteData].
class NewsArticleSearchDetailRouteDataProvider
    extends AutoDisposeProvider<NewsArticleSearchDetailRouteData> {
  /// See also [newsArticleSearchDetailRouteData].
  NewsArticleSearchDetailRouteDataProvider({
    required String title,
    required String url,
  }) : this._internal(
          (ref) => newsArticleSearchDetailRouteData(
            ref as NewsArticleSearchDetailRouteDataRef,
            title: title,
            url: url,
          ),
          from: newsArticleSearchDetailRouteDataProvider,
          name: r'newsArticleSearchDetailRouteDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsArticleSearchDetailRouteDataHash,
          dependencies: NewsArticleSearchDetailRouteDataFamily._dependencies,
          allTransitiveDependencies:
              NewsArticleSearchDetailRouteDataFamily._allTransitiveDependencies,
          title: title,
          url: url,
        );

  NewsArticleSearchDetailRouteDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.url,
  }) : super.internal();

  final String title;
  final String url;

  @override
  Override overrideWith(
    NewsArticleSearchDetailRouteData Function(
            NewsArticleSearchDetailRouteDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsArticleSearchDetailRouteDataProvider._internal(
        (ref) => create(ref as NewsArticleSearchDetailRouteDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<NewsArticleSearchDetailRouteData> createElement() {
    return _NewsArticleSearchDetailRouteDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsArticleSearchDetailRouteDataProvider &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsArticleSearchDetailRouteDataRef
    on AutoDisposeProviderRef<NewsArticleSearchDetailRouteData> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `url` of this provider.
  String get url;
}

class _NewsArticleSearchDetailRouteDataProviderElement
    extends AutoDisposeProviderElement<NewsArticleSearchDetailRouteData>
    with NewsArticleSearchDetailRouteDataRef {
  _NewsArticleSearchDetailRouteDataProviderElement(super.provider);

  @override
  String get title =>
      (origin as NewsArticleSearchDetailRouteDataProvider).title;
  @override
  String get url => (origin as NewsArticleSearchDetailRouteDataProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
