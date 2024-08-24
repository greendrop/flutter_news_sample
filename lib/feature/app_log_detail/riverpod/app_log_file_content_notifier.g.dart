// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_log_file_content_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLogFileContentNotifierHash() =>
    r'017e997a1c1767d122fbc252c8951514af06c642';

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

abstract class _$AppLogFileContentNotifier
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String filename;

  FutureOr<String> build({
    required String filename,
  });
}

/// See also [AppLogFileContentNotifier].
@ProviderFor(AppLogFileContentNotifier)
const appLogFileContentNotifierProvider = AppLogFileContentNotifierFamily();

/// See also [AppLogFileContentNotifier].
class AppLogFileContentNotifierFamily extends Family<AsyncValue<String>> {
  /// See also [AppLogFileContentNotifier].
  const AppLogFileContentNotifierFamily();

  /// See also [AppLogFileContentNotifier].
  AppLogFileContentNotifierProvider call({
    required String filename,
  }) {
    return AppLogFileContentNotifierProvider(
      filename: filename,
    );
  }

  @override
  AppLogFileContentNotifierProvider getProviderOverride(
    covariant AppLogFileContentNotifierProvider provider,
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
  String? get name => r'appLogFileContentNotifierProvider';
}

/// See also [AppLogFileContentNotifier].
class AppLogFileContentNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AppLogFileContentNotifier,
        String> {
  /// See also [AppLogFileContentNotifier].
  AppLogFileContentNotifierProvider({
    required String filename,
  }) : this._internal(
          () => AppLogFileContentNotifier()..filename = filename,
          from: appLogFileContentNotifierProvider,
          name: r'appLogFileContentNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appLogFileContentNotifierHash,
          dependencies: AppLogFileContentNotifierFamily._dependencies,
          allTransitiveDependencies:
              AppLogFileContentNotifierFamily._allTransitiveDependencies,
          filename: filename,
        );

  AppLogFileContentNotifierProvider._internal(
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
  FutureOr<String> runNotifierBuild(
    covariant AppLogFileContentNotifier notifier,
  ) {
    return notifier.build(
      filename: filename,
    );
  }

  @override
  Override overrideWith(AppLogFileContentNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppLogFileContentNotifierProvider._internal(
        () => create()..filename = filename,
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
  AutoDisposeAsyncNotifierProviderElement<AppLogFileContentNotifier, String>
      createElement() {
    return _AppLogFileContentNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppLogFileContentNotifierProvider &&
        other.filename == filename;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppLogFileContentNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `filename` of this provider.
  String get filename;
}

class _AppLogFileContentNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppLogFileContentNotifier,
        String> with AppLogFileContentNotifierRef {
  _AppLogFileContentNotifierProviderElement(super.provider);

  @override
  String get filename => (origin as AppLogFileContentNotifierProvider).filename;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
