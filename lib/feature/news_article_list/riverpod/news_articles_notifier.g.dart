// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_articles_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsArticlesNotifierHash() =>
    r'ec5b742790065f8b7f11f8c1288915db3da1fd86';

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

abstract class _$NewsArticlesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<NewsArticles> {
  late final String category;

  FutureOr<NewsArticles> build({
    required String category,
  });
}

/// See also [NewsArticlesNotifier].
@ProviderFor(NewsArticlesNotifier)
const newsArticlesNotifierProvider = NewsArticlesNotifierFamily();

/// See also [NewsArticlesNotifier].
class NewsArticlesNotifierFamily extends Family<AsyncValue<NewsArticles>> {
  /// See also [NewsArticlesNotifier].
  const NewsArticlesNotifierFamily();

  /// See also [NewsArticlesNotifier].
  NewsArticlesNotifierProvider call({
    required String category,
  }) {
    return NewsArticlesNotifierProvider(
      category: category,
    );
  }

  @override
  NewsArticlesNotifierProvider getProviderOverride(
    covariant NewsArticlesNotifierProvider provider,
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
  String? get name => r'newsArticlesNotifierProvider';
}

/// See also [NewsArticlesNotifier].
class NewsArticlesNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    NewsArticlesNotifier, NewsArticles> {
  /// See also [NewsArticlesNotifier].
  NewsArticlesNotifierProvider({
    required String category,
  }) : this._internal(
          () => NewsArticlesNotifier()..category = category,
          from: newsArticlesNotifierProvider,
          name: r'newsArticlesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsArticlesNotifierHash,
          dependencies: NewsArticlesNotifierFamily._dependencies,
          allTransitiveDependencies:
              NewsArticlesNotifierFamily._allTransitiveDependencies,
          category: category,
        );

  NewsArticlesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  FutureOr<NewsArticles> runNotifierBuild(
    covariant NewsArticlesNotifier notifier,
  ) {
    return notifier.build(
      category: category,
    );
  }

  @override
  Override overrideWith(NewsArticlesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewsArticlesNotifierProvider._internal(
        () => create()..category = category,
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
  AutoDisposeAsyncNotifierProviderElement<NewsArticlesNotifier, NewsArticles>
      createElement() {
    return _NewsArticlesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsArticlesNotifierProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsArticlesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<NewsArticles> {
  /// The parameter `category` of this provider.
  String get category;
}

class _NewsArticlesNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NewsArticlesNotifier,
        NewsArticles> with NewsArticlesNotifierRef {
  _NewsArticlesNotifierProviderElement(super.provider);

  @override
  String get category => (origin as NewsArticlesNotifierProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
