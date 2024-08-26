// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_log_detail_route_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLogDetailRouteDataHash() =>
    r'b716c2d07e585a5b45bfc75e58b2586fa31f10d8';

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

/// See also [appLogDetailRouteData].
@ProviderFor(appLogDetailRouteData)
const appLogDetailRouteDataProvider = AppLogDetailRouteDataFamily();

/// See also [appLogDetailRouteData].
class AppLogDetailRouteDataFamily extends Family<AppLogDetailRouteData> {
  /// See also [appLogDetailRouteData].
  const AppLogDetailRouteDataFamily();

  /// See also [appLogDetailRouteData].
  AppLogDetailRouteDataProvider call({
    required String filename,
  }) {
    return AppLogDetailRouteDataProvider(
      filename: filename,
    );
  }

  @override
  AppLogDetailRouteDataProvider getProviderOverride(
    covariant AppLogDetailRouteDataProvider provider,
  ) {
    return call(
      filename: provider.filename,
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
  String? get name => r'appLogDetailRouteDataProvider';
}

/// See also [appLogDetailRouteData].
class AppLogDetailRouteDataProvider
    extends AutoDisposeProvider<AppLogDetailRouteData> {
  /// See also [appLogDetailRouteData].
  AppLogDetailRouteDataProvider({
    required String filename,
  }) : this._internal(
          (ref) => appLogDetailRouteData(
            ref as AppLogDetailRouteDataRef,
            filename: filename,
          ),
          from: appLogDetailRouteDataProvider,
          name: r'appLogDetailRouteDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appLogDetailRouteDataHash,
          dependencies: AppLogDetailRouteDataFamily._dependencies,
          allTransitiveDependencies:
              AppLogDetailRouteDataFamily._allTransitiveDependencies,
          filename: filename,
        );

  AppLogDetailRouteDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filename,
  }) : super.internal();

  final String filename;

  @override
  Override overrideWith(
    AppLogDetailRouteData Function(AppLogDetailRouteDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppLogDetailRouteDataProvider._internal(
        (ref) => create(ref as AppLogDetailRouteDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filename: filename,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AppLogDetailRouteData> createElement() {
    return _AppLogDetailRouteDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppLogDetailRouteDataProvider && other.filename == filename;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppLogDetailRouteDataRef
    on AutoDisposeProviderRef<AppLogDetailRouteData> {
  /// The parameter `filename` of this provider.
  String get filename;
}

class _AppLogDetailRouteDataProviderElement
    extends AutoDisposeProviderElement<AppLogDetailRouteData>
    with AppLogDetailRouteDataRef {
  _AppLogDetailRouteDataProviderElement(super.provider);

  @override
  String get filename => (origin as AppLogDetailRouteDataProvider).filename;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
