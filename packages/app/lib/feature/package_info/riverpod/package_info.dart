import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

@Riverpod(keepAlive: true)
class PackageInfoNotifier extends _$PackageInfoNotifier {
  @override
  PackageInfo? build() {
    return null;
  }

  Future<void> initialize() async {
    state = await PackageInfo.fromPlatform();
  }

  Future<void> refresh() async {
    state = await PackageInfo.fromPlatform();
  }
}
