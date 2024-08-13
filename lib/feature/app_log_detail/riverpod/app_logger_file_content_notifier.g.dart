// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_logger_file_content_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLoggerFileContentNotifierHash() =>
    r'c771c6e7d28ede39948c0c01b311537419de4a56';

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

abstract class _$AppLoggerFileContentNotifier
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String filename;

  FutureOr<String> build({
    required String filename,
  });
}

/// See also [AppLoggerFileContentNotifier].
@ProviderFor(AppLoggerFileContentNotifier)
const appLoggerFileContentNotifierProvider =
    AppLoggerFileContentNotifierFamily();

/// See also [AppLoggerFileContentNotifier].
class AppLoggerFileContentNotifierFamily extends Family<AsyncValue<String>> {
  /// See also [AppLoggerFileContentNotifier].
  const AppLoggerFileContentNotifierFamily();

  /// See also [AppLoggerFileContentNotifier].
  AppLoggerFileContentNotifierProvider call({
    required String filename,
  }) {
    return AppLoggerFileContentNotifierProvider(
      filename: filename,
    );
  }

  @override
  AppLoggerFileContentNotifierProvider getProviderOverride(
    covariant AppLoggerFileContentNotifierProvider provider,
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
  String? get name => r'appLoggerFileContentNotifierProvider';
}

/// See also [AppLoggerFileContentNotifier].
class AppLoggerFileContentNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AppLoggerFileContentNotifier,
        String> {
  /// See also [AppLoggerFileContentNotifier].
  AppLoggerFileContentNotifierProvider({
    required String filename,
  }) : this._internal(
          () => AppLoggerFileContentNotifier()..filename = filename,
          from: appLoggerFileContentNotifierProvider,
          name: r'appLoggerFileContentNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appLoggerFileContentNotifierHash,
          dependencies: AppLoggerFileContentNotifierFamily._dependencies,
          allTransitiveDependencies:
              AppLoggerFileContentNotifierFamily._allTransitiveDependencies,
          filename: filename,
        );

  AppLoggerFileContentNotifierProvider._internal(
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
    covariant AppLoggerFileContentNotifier notifier,
  ) {
    return notifier.build(
      filename: filename,
    );
  }

  @override
  Override overrideWith(AppLoggerFileContentNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppLoggerFileContentNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AppLoggerFileContentNotifier, String>
      createElement() {
    return _AppLoggerFileContentNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppLoggerFileContentNotifierProvider &&
        other.filename == filename;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppLoggerFileContentNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `filename` of this provider.
  String get filename;
}

class _AppLoggerFileContentNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        AppLoggerFileContentNotifier,
        String> with AppLoggerFileContentNotifierRef {
  _AppLoggerFileContentNotifierProviderElement(super.provider);

  @override
  String get filename =>
      (origin as AppLoggerFileContentNotifierProvider).filename;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
