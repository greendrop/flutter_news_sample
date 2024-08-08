// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_logger_file.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLoggerFileHash() => r'bd9320275afa2722ba306b956c7098a453e11c42';

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

/// See also [appLoggerFile].
@ProviderFor(appLoggerFile)
const appLoggerFileProvider = AppLoggerFileFamily();

/// See also [appLoggerFile].
class AppLoggerFileFamily extends Family<File?> {
  /// See also [appLoggerFile].
  const AppLoggerFileFamily();

  /// See also [appLoggerFile].
  AppLoggerFileProvider call({
    required String filename,
  }) {
    return AppLoggerFileProvider(
      filename: filename,
    );
  }

  @override
  AppLoggerFileProvider getProviderOverride(
    covariant AppLoggerFileProvider provider,
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
  String? get name => r'appLoggerFileProvider';
}

/// See also [appLoggerFile].
class AppLoggerFileProvider extends AutoDisposeProvider<File?> {
  /// See also [appLoggerFile].
  AppLoggerFileProvider({
    required String filename,
  }) : this._internal(
          (ref) => appLoggerFile(
            ref as AppLoggerFileRef,
            filename: filename,
          ),
          from: appLoggerFileProvider,
          name: r'appLoggerFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appLoggerFileHash,
          dependencies: AppLoggerFileFamily._dependencies,
          allTransitiveDependencies:
              AppLoggerFileFamily._allTransitiveDependencies,
          filename: filename,
        );

  AppLoggerFileProvider._internal(
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
    File? Function(AppLoggerFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppLoggerFileProvider._internal(
        (ref) => create(ref as AppLoggerFileRef),
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
  AutoDisposeProviderElement<File?> createElement() {
    return _AppLoggerFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppLoggerFileProvider && other.filename == filename;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppLoggerFileRef on AutoDisposeProviderRef<File?> {
  /// The parameter `filename` of this provider.
  String get filename;
}

class _AppLoggerFileProviderElement extends AutoDisposeProviderElement<File?>
    with AppLoggerFileRef {
  _AppLoggerFileProviderElement(super.provider);

  @override
  String get filename => (origin as AppLoggerFileProvider).filename;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
