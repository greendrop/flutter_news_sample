// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_detail_route_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsArticleDetailRouteDataHash() =>
    r'12d7670adaa854b3823dd2572635616696215618';

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

/// See also [newsArticleDetailRouteData].
@ProviderFor(newsArticleDetailRouteData)
const newsArticleDetailRouteDataProvider = NewsArticleDetailRouteDataFamily();

/// See also [newsArticleDetailRouteData].
class NewsArticleDetailRouteDataFamily
    extends Family<NewsArticleDetailRouteData> {
  /// See also [newsArticleDetailRouteData].
  const NewsArticleDetailRouteDataFamily();

  /// See also [newsArticleDetailRouteData].
  NewsArticleDetailRouteDataProvider call({
    required String title,
    required String url,
  }) {
    return NewsArticleDetailRouteDataProvider(
      title: title,
      url: url,
    );
  }

  @override
  NewsArticleDetailRouteDataProvider getProviderOverride(
    covariant NewsArticleDetailRouteDataProvider provider,
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
  String? get name => r'newsArticleDetailRouteDataProvider';
}

/// See also [newsArticleDetailRouteData].
class NewsArticleDetailRouteDataProvider
    extends AutoDisposeProvider<NewsArticleDetailRouteData> {
  /// See also [newsArticleDetailRouteData].
  NewsArticleDetailRouteDataProvider({
    required String title,
    required String url,
  }) : this._internal(
          (ref) => newsArticleDetailRouteData(
            ref as NewsArticleDetailRouteDataRef,
            title: title,
            url: url,
          ),
          from: newsArticleDetailRouteDataProvider,
          name: r'newsArticleDetailRouteDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsArticleDetailRouteDataHash,
          dependencies: NewsArticleDetailRouteDataFamily._dependencies,
          allTransitiveDependencies:
              NewsArticleDetailRouteDataFamily._allTransitiveDependencies,
          title: title,
          url: url,
        );

  NewsArticleDetailRouteDataProvider._internal(
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
    NewsArticleDetailRouteData Function(NewsArticleDetailRouteDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsArticleDetailRouteDataProvider._internal(
        (ref) => create(ref as NewsArticleDetailRouteDataRef),
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
  AutoDisposeProviderElement<NewsArticleDetailRouteData> createElement() {
    return _NewsArticleDetailRouteDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsArticleDetailRouteDataProvider &&
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

mixin NewsArticleDetailRouteDataRef
    on AutoDisposeProviderRef<NewsArticleDetailRouteData> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `url` of this provider.
  String get url;
}

class _NewsArticleDetailRouteDataProviderElement
    extends AutoDisposeProviderElement<NewsArticleDetailRouteData>
    with NewsArticleDetailRouteDataRef {
  _NewsArticleDetailRouteDataProviderElement(super.provider);

  @override
  String get title => (origin as NewsArticleDetailRouteDataProvider).title;
  @override
  String get url => (origin as NewsArticleDetailRouteDataProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
